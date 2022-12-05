package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.OrderDetailDao;
import domain.Cart;
import domain.CartDetail;
import domain.OrderDetailDto;
import domain.Product;
import dto.OrderDto;
import util.ConnectionProvider;

public class OrdersDetailService {
	//field
	private ServletContext application;
	private DataSource ds;
	private OrderDetailDao orderDetailDao;
	private OrderService orderService;
	private ProductAndColorService productAndColorService;
	private ProductAndSizeService productAndSizeService;
	private CartDetailService cartDetailService;
		
	//constructor
	public OrdersDetailService(ServletContext application) {
		this.application = application;
		this.orderDetailDao = (OrderDetailDao) application.getAttribute("ordersDetailDao");
		this.orderService = (OrderService) application.getAttribute("orderService");
		this.productAndColorService = (ProductAndColorService) application.getAttribute("productAndColorService");
		this.productAndSizeService = (ProductAndSizeService) application.getAttribute("productAndSizeService");
		this.cartDetailService = (CartDetailService) application.getAttribute("cartDetailService");
		
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jbc/java");
			
			//트랜잭션을 위한 커넥션
			Connection conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	
	// 하나의 상품 구매하기 (하나의 orders_detail 생성하는 로직)
	public String addProductToOrder(OrderDto od) throws SQLException {
		Connection conn = null;
		int rows = 0;
		String result = "";
		
		try {
			conn = ds.getConnection();
			rows = orderDetailDao.insertOrderDetail(conn, od);
		
			if(rows == 1) {
				result = od.getProductId() + "번 상품 주문이 완료되었습니다.";
			}
			else result = od.getProductId() + "번 상품 주문에 실패되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}
	
	// 장바구니에서 구매하는 경우 1~여러개 가능 
	// 하나의 order id 를 가지는 orderDetails 들이 여러개 생긴다.
	public String addCartDetailsToOrder(String userId, List<Object> cartDetailIdList) {		
		Connection conn = null;
		String result = "";

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int totalPrice = 0;
			int quantity = 0;
			
			for(Object cdId : cartDetailIdList) {
				// 각 cartdetailId 값으로 cartDetail 객체를가져온다.
				CartDetail cartDetail = cartDetailService.getCartDetailOne(conn, Integer.parseInt((String)cdId));
	    
	    		// 주문한 상품 삭제 여부 확인 필요
				Product product = cartDetail.getProduct();
				boolean productIsDeleted = product.isDeleted();
//				boolean colorCheck = productAndColorService.checkColor(product.getProductId(), cartDetail.getColor().getColor_id());
//				boolean sizeCheck = productAndSizeService.checkSize(product.getProductId(), cartDetail.getSize_id());
				
				// 삭제되지 않은 상품 구매 , 색상, 컬러 확인 후 장바구니에 담을 수 있다.
				if(productIsDeleted) {
				
					return "주문에 실패했습니다. ";
				}
				
				// 총 금액과 수량을 계산하여 Orders 에 삽입해야 된다.
				totalPrice += cartDetail.getProduct().getProductPrice() * cartDetail.getQuantity();
				quantity += cartDetail.getQuantity();
			}
			
			// Orders 에 삽입 후 orders_id 값을 받아와야 order_detail 에 데이터를 삽입할 수 있다.
			int oId = orderService.addOrder(conn, userId, totalPrice, quantity);
			
			// 각 cartDetail 를 삽입하되, 같은 위의 oId 를 삽입한다 -> 장바구니에서 여러 상품을 동시에 주문한다.
			for(Object cdId : cartDetailIdList) {
				result += cartDetailToOrderDetail(conn, userId, oId, Integer.parseInt((String)cdId));
				cartDetailService.removeCartDetailOne(userId, Integer.parseInt((String)cdId));
			}
			
			conn.commit();
			
		} catch(Exception e) {
			try {
				result = "주문에 실패했습니q다. ";
				conn.rollback();
		
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		return result;
	}
	
	// 장바구니 상품 하나(씩) 주문하기
	// 주문되면 장바구니에서 제거해야 된다.
	public String cartDetailToOrderDetail(Connection conn, String userId, int oId, int cartDetailId) {		
		int rows = 0;
		String result = "";
		CartDetail cartDetail = cartDetailService.getCartDetailOne(conn, cartDetailId);
		
		// 장바구니 상품1을 주문한다. -> orders_detail 테이블에 삽입된다.
		try {
			rows = orderDetailDao.insertCartDetailToOrderDetail(conn, userId, oId, cartDetail);

			// 주문이 되면 장바구니에서 제거해야 된다.
			if(rows == 1) {
				result =  cartDetailId + "번 장바구니 상품이 주문완료되었습니다. \n";
			}
			else  result =  cartDetailId + "번 장바구니 상품 주문에 실패되었습니다. \n"; 		

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
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
