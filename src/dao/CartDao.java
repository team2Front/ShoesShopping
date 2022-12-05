package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.CartDto;


public class CartDao {
	// 데이터베이스와 연동하여 데이터를 추출한다.
	// DTO 를 리턴한다.	
	
	//장바구니 생성
	public int insertCart(Connection conn, String userId) throws Exception {
		String sql = "insert into cart(user_id, total_price, total_quantity) values (?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userId);
		pstmt.setInt(2, 0);
		pstmt.setInt(3, 0);

		int rows = pstmt.executeUpdate();
		return rows;
	}

	// 장바구니 조회 
	public CartDto selectCart(Connection conn, String userId) throws Exception {
		String sql = "select total_price, total_quantity from cart where user_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, userId);
	    
	    ResultSet rs = pstmt.executeQuery();
	    CartDto cartDto = null;
		while(rs.next()) {
			int price = rs.getInt("total_price");
			int quantity = rs.getInt("total_quantity");
			
			cartDto = new CartDto(price, quantity, null);
		}
		
	   return cartDto;
	}
	
	
	
	// 장바구니 수정
	public void updateCart(Connection conn, String userId, int price, int quantity) throws Exception {
    	//cart 에 정보 수하기
		System.out.println("!!! " + conn);
		System.out.println(userId);
		System.out.println(price);
		System.out.println(quantity);
		
		String sql = "update cart set total_price=?, total_quantity=? where user_id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price);           
			pstmt.setInt(2, quantity);
		    pstmt.setString(3, userId);
		    
		   int rows = pstmt.executeUpdate();
		   System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~   " + rows);
	}

}
