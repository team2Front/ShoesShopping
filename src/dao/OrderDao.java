package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import domain.OrderDetailDto;
import domain.Orders;
import util.ConnectionProvider;
import util.PagingVo;

public class OrderDao {
	//field
	private static PreparedStatement pstmt;
	private ServletContext application;
	private OrderDetailDao orderDetailDao; 
		
	//constructor
	public OrderDao(ServletContext application) {
		this.application = application;
		this.orderDetailDao = (OrderDetailDao) application.getAttribute("orderDetailDao");
	}
	
	// order 테이블 전체 count
	public int selectCount(String userId) {
		Connection conn = ConnectionProvider.getConnection();
		int counts = 0;
		
		try {
			String sql = "select  count(orders_id) from orders where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  userId);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				counts = rs.getInt(1);
		      }
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return counts;
	}
	
	// 유저의 모든 주문들 조회 
	public List<Orders> selectOrder(String userId, PagingVo pvo) {
		Connection conn = ConnectionProvider.getConnection();
		List<Orders> orderList = new ArrayList<>();
		
		int endRn = pvo.getEndRowNo(); //페이지의 끝행 번호 
		int startRn = pvo.getStartRowNo();//페이지의 시작 행 번호
		
		try {
			String sql = "select rm, orders_id, orders_date, orders_is_deleted, total_price, quantity  "
					+ "from( "
					+ "select rownum as rm, orders_id, orders_date, orders_is_deleted, total_price, quantity "
					+ "from ("
					+ "select orders_id, orders_date, orders_is_deleted, total_price, quantity "
					+ "from orders "
					+ "where user_id=? "
					+ "order by orders_id"
					+ ")"
					+ " where rownum <= ? ) "
					+ "where rm >= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  userId);
			pstmt.setInt(2, endRn);
			pstmt.setInt(3, startRn);
			
//			String sql = "select orders_id, orders_date, orders_is_deleted, total_price, quantity from orders where user_id=?";
//			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int odId = rs.getInt("orders_id");
				String date = rs.getDate("orders_date").toString();
				boolean isDel = rs.getBoolean("orders_is_deleted");
				int price = rs.getInt("total_price");
				int q = rs.getInt("quantity");
				
				// 해당 order의 orderDetail 들을 가져온다.
				List<OrderDetailDto> odList = orderDetailDao.selectOrderDetails(odId);
				
				orderList.add(new Orders(odId, date, isDel, price, q, odList));
	        }		
		}catch(SQLException e) {
			e.printStackTrace();
		}	
		return orderList;
	}
	
	
	// 주문 등록하기 
	public int insertOrder(Connection conn, String uId, int totalPrice, int quantity) throws SQLException {		
		int oid = 0;
		
		String sql = "insert into orders (orders_id, orders_date, user_id, orders_is_deleted, total_price, quantity) values (order_seq.nextval,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql, new String[] {"orders_id"});
		
		pstmt.setDate(1, new java.sql.Date(System.currentTimeMillis()));
		pstmt.setString(2, uId);
		pstmt.setBoolean(3, false);
		pstmt.setInt(4, totalPrice);
		pstmt.setInt(5, quantity);
		
		int rows = pstmt.executeUpdate();
       
        if(rows ==  1) {
		 	ResultSet rs= pstmt.getGeneratedKeys(); // 삽입된 orders_id 값 가져오기 
		 	if(rs.next()) {
		 		oid = rs.getInt(1);
		 	}
        }				
		return oid;	
	}
		
   //주문 취소
   public int deleteOrders(int oId) {
      Connection conn = ConnectionProvider.getConnection();
      
      String sql = "update orders set orders_is_deleted=? where orders_id=?";
      int rows = 0;
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setBoolean(1, true);
         pstmt.setInt(2, oId);
         
         rows = pstmt.executeUpdate();
         
         conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return rows;
   }
}
