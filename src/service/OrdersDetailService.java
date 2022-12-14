package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.OrderDetailDao;
import domain.CartDetail;
import domain.OrderDetailDto;
import domain.Product;
import dto.OrderDto;

public class OrdersDetailService {
	//field
	private DataSource ds;
	private OrderDetailDao orderDetailDao;
	private OrderService orderService;
	private CartDetailService cartDetailService;
		
	//constructor
	public OrdersDetailService(ServletContext application) {
		this.ds = (DataSource) application.getAttribute("dataSource");
		this.orderDetailDao = (OrderDetailDao) application.getAttribute("orderDetailDao");
 		this.cartDetailService = (CartDetailService) application.getAttribute("cartDetailService"); 
 		this.orderService = (OrderService) application.getAttribute("orderService");
	}
	
	
	// 하나의 상품 구매하기 (하나의 orders_detail 생성하는 로직)
	public String addProductToOrder(OrderDto od){
		Connection conn = null;
		int rows = 0;
		String result = "";
		
		try {
			conn = ds.getConnection();
			rows = orderDetailDao.insertOrderDetail(conn, od);
		
			if(rows == 1) {
				result = od.getProductId() + "번 상품 주문이 완료되었습니다.";
			}

		} catch (Exception e) {
			result = od.getProductId() + "번 상품 주문에 실패되었습니다.";
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}
	
	// 장바구니에서 구매하는 경우 1~여러개 가능 
	// 하나의 order id 를 가지는 orderDetails 들이 여러개 생긴다.
	public void addCartDetailsToOrder(String userId, List<Object> cartDetailIdList) {		
		Connection conn = null;

		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			int totalPrice = 0;
			int quantity = 0;
			
			for(Object cdId : cartDetailIdList) {
				// 각 cartdetailId 값으로 cartDetail 객체를가져온다.
				CartDetail cartDetail = cartDetailService.getCartDetailOne(conn, Integer.parseInt((String)cdId));
	    
	    		// 주문한 상품 삭제 여부 확인 필요
				Product product = cartDetail.getProduct();
				boolean productIsDeleted = product.isDeleted();
				
				// 삭제되지 않은 상품 구매시 에러소
				if(productIsDeleted) { throw new RuntimeException();}
				// 총 금액과 수량을 계산하여 Orders 에 삽입해야 된다.
				totalPrice += cartDetail.getProduct().getProductPrice() * cartDetail.getQuantity();
				quantity += cartDetail.getQuantity();
			}
			
			// Orders 에 삽입 후 orders_id 값을 받아와야 order_detail 에 데이터를 삽입할 수 있다.
			int oId = orderService.addOrder(conn, userId, totalPrice, quantity);
			// 각 cartDetail 를 삽입하되, 같은 위의 oId 를 삽입한다 -> 장바구니에서 여러 상품을 동시에 주문한다.
			for(Object cdId : cartDetailIdList) {
				cartDetailToOrderDetail(conn, userId, oId, Integer.parseInt((String)cdId));
				cartDetailService.removeCartDetailOneForOrder(conn, userId, Integer.parseInt((String)cdId));
			}
			
			conn.commit();
			
		} catch(Exception e) {
			try {
				conn.rollback();
		
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
	}
	
	// 장바구니 상품 하나(씩) 주문하기
	// 주문되면 장바구니에서 제거해야 된다.
	public String cartDetailToOrderDetail(Connection conn, String userId, int oId, int cartDetailId) throws Exception {		
		int rows = 0;
		String result = "";
		CartDetail cartDetail = cartDetailService.getCartDetailOne(conn, cartDetailId);
		
		// 장바구니 상품1을 주문한다. -> orders_detail 테이블에 삽입된다.
		rows = orderDetailDao.insertCartDetailToOrderDetail(conn, userId, oId, cartDetail);

		// 주문이 되면 장바구니에서 제거해야 된다.
		if(rows == 1) {
			result =  cartDetailId + "번 장바구니 상품이 주문완료되었습니다. \n";
		}
		else  result =  cartDetailId + "번 장바구니 상품 주문에 실패되었습니다. \n"; 		

		return result;
	}

	
	// 주문내역 상세보기
    public List<OrderDetailDto> orderDetailList(int orderId) {
    	Connection conn = null;
		List<OrderDetailDto> list = null;
		
		try {
			conn = ds.getConnection();
			//트랜잭션를 위한 자동커밋 기능 OFF
			conn.setAutoCommit(false);
			
			list = orderDetailDao.selectOrderDetails(conn, orderId);
			
			conn.commit();
			
		} catch (Exception e) {
			try { conn.rollback();} catch (SQLException e1) {}
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return list;
    }

}
