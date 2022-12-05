package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import domain.CartDetail;
import domain.Color;
import domain.OrderDetailDto;
import domain.Product;
import dto.OrderDto;

public class OrderDetailDao {
	//field
	private OrderDao orderDao;
	private ColorDao colorDao;
	private ProductDao productDao;
	private ProductAndColorDao productAndColorDao;
	private ProductAndSizeDao productAndSizeDao;
	
	//constructor
	public OrderDetailDao(ServletContext application) {
		this.orderDao = (OrderDao) application.getAttribute("orderDao");
		this.colorDao = (ColorDao) application.getAttribute("colorDao");
		this.productDao = (ProductDao) application.getAttribute("productDao");
		this.productAndColorDao = (ProductAndColorDao) application.getAttribute("productAndColorDao");
		this.productAndSizeDao = (ProductAndSizeDao) application.getAttribute("productAndSizeDao");
	}
	
	// 주문1 에 해당하는 orderDetail들 조회하기 : 주문내역 상세보기 
	// 트랜잭션 처리되었던 메소드 새로 수정(아래에 기존 코드 복붙해놓음)
	public List<OrderDetailDto> selectOrderDetails (Connection conn, int orderId) throws Exception {
		List<OrderDetailDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		
		String sql = "select orders_detail_id, product_id, quantity, size_id, color_id from orders_detail where orders_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  orderId);
			
		ResultSet rs = pstmt.executeQuery();
			
		while(rs.next()) {
			int odId = rs.getInt("orders_detail_id");
			int pid = rs.getInt("product_id");
			Product product = productDao.selectProductOne(conn, pid);
			
			int qt = rs.getInt("quantity");
			int size = rs.getInt("size_id");
			int colorId = rs.getInt("color_id");
			Color color = colorDao.selectColor(conn, colorId);
			
			list.add(new OrderDetailDto(odId, qt, product, size, color.getColor_name()));
		}
		
		return list;
	}
	
	// 하나의 상품 구매하기
	// 트랜잭션 처리되었던 메소드 새로 수정(아래에 기존 코드 복붙해놓음)
	public int insertOrderDetail(Connection conn, OrderDto od) throws Exception {
		PreparedStatement pstmt = null;
		
		String userId = od.getUserId();
		int productId = od.getProductId();
		int color = od.getColor();
		int size = od.getSize();
		int quantity = od.getQuantity();
		int rows = 0;

		// 주문한 상품 삭제 여부 확인 필요
		Product product = productDao.selectProductOne(conn, productId);
		boolean colorCheck = productAndColorDao.selectProductColor(conn, productId, color);
		boolean sizeCheck = productAndSizeDao.selectProductSize(conn, productId, size);
		
		// 삭제되지 않은 상품 구매 
		if(!product.isDeleted() && colorCheck && sizeCheck) {
			// 주문한 총 금액 계산하
			int totalPrice = product.getProductPrice() * quantity;
			
			// order 테이블에 정보 삽입  orders_id 값 받아오기
			int oId = orderDao.insertOrder(conn, userId, totalPrice, quantity);
			
			//oder details 테이블에 데이터 삽입하기 
			String sql ="insert into orders_detail (orders_detail_id, product_id, orders_id, quantity, size_id, color_id) values(ordersDetail_seq.nextval, ?, ?, ?, ?, ?)";
			// orderId 받아오
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			pstmt.setInt(2, oId);
			pstmt.setInt(3, quantity);
			pstmt.setInt(4, size);
			pstmt.setInt(5, color);
			
			rows = pstmt.executeUpdate();
				
		} else throw new RuntimeException();
			
		return rows;
	}
	
	
	// 장바구니에서 상품1개 구매하기
	public int insertCartDetailToOrderDetail(Connection conn, String userId, int oId, CartDetail cd) throws Exception {
		//oder details 테이블에 데이터 삽입하기 
		PreparedStatement pstmt = null;
		String sql ="insert into orders_detail (orders_detail_id, product_id, orders_id, quantity, size_id, color_id) values(ordersDetail_seq.nextval, ?, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cd.getProduct().getProductId());
		pstmt.setInt(2, oId);
		pstmt.setInt(3, cd.getQuantity());
		pstmt.setInt(4, cd.getSize_id());
		pstmt.setInt(5, cd.getColor().getColor_id());
		
		int rows = 0;
		rows = pstmt.executeUpdate();
		return rows;
	}
	
}
