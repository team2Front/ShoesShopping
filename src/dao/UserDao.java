package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

import domain.User;
import dto.UserInfo;

public class UserDao {
   
   public UserDao(ServletContext application) {
	   
   }
	   
   //method: select문 - 아이디 중복 여부 판별
   public boolean selectUserId(Connection conn, String id) throws Exception {
      String sql = "select userid from users where userid=? ";
      boolean result = false;
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      ResultSet rs = pstmt.executeQuery();
      result = rs.next();
      pstmt.close();

      return result;
   }
   
   //method: select문 - 핸드폰 번호 중복 여부 확인
   public boolean selectPnCheck(Connection conn, String pn) throws Exception {
      String sql = "select phonenumber from users where phonenumber=? ";
      boolean result = true;
 	  
      PreparedStatement pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, pn);
	  ResultSet rs = pstmt.executeQuery();
	  result = rs.next();
	  pstmt.close();
 
	  return result;
   }
   
   //method: select문 - 비밀번호 확인
   public boolean selectPwCheck(Connection conn, String loginId, String pw) throws Exception {
      String sql = "select user_id, user_password from users where user_id = ? and user_password=?";
      boolean result = true;
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, loginId);
      pstmt.setString(2, pw);
      ResultSet rs = pstmt.executeQuery();
      result = rs.next();
      pstmt.close();

      return result; 
   }
   
   //method: select문 - 로그인
   public String selectLogin(Connection conn, User user) throws Exception {
      String sql = "select userid, usertype from users where userid=? and userpassword=?";
      String type = "";

	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, user.getUserId());
	  pstmt.setString(2, user.getUserPassword());
	  ResultSet rs = pstmt.executeQuery();
	  //로그인 성공이면 user_type 리턴
	  if (rs.next()) {
	     type = rs.getString("usertype"); 
	  } else { 
	     //로그인 실패면 null 리턴
	     type = ""; //로그인 실패
	  }
	  pstmt.close();
	  
	  return type;
   }
   
   //method: select문 - 사용자 정보 목록
   public UserInfo selectUserInfo(Connection conn, String id) throws Exception {
	  String sql = "select user_name, phone_number, user_address from users where user_id =?";
	  UserInfo userInfo = new UserInfo();
	  
	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, id);
	  ResultSet rs = pstmt.executeQuery();
	     
	  if(rs.next()) {
		  userInfo = new UserInfo(rs.getString("user_name"),
		  rs.getString("phone_number"),
          rs.getString("user_address")
          );
     }
     pstmt.close();

     return userInfo;
   }
   
   //method: insert문 - 사용자 정보를 DB에 등록
   public int insertRegisterUser(Connection conn, User user) throws Exception {
      String sql = "";
      sql += "insert into users(userid, username, userpassword, useremail, useraddress, phonenumber) ";
      sql += "values (?, ?, ?, ?, ?, ?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, user.getUserId());
      pstmt.setString(2, user.getUserName());
      pstmt.setString(3, user.getUserPassword());
      pstmt.setString(4, user.getUserEmail());
      pstmt.setString(5, user.getUserAddress());
      pstmt.setString(6, user.getPhoneNumber());
      
      int rows = pstmt.executeUpdate();
      
      pstmt.close();
      
      return rows;
   }
   
   // method: insert문 - 관리자 정보를 DB에 등록
   public int insertRegisterAdmin(Connection conn, User user) throws Exception {
	      String sql = "";
	      sql += "insert into users(userid, username, userpassword, useremail, useraddress, phonenumber, usertype) ";
	      sql += "values (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getUserName());
		pstmt.setString(3, user.getUserPassword());
		pstmt.setString(4, user.getUserEmail());
		pstmt.setString(5, user.getUserAddress());
		pstmt.setString(6, user.getPhoneNumber());
		pstmt.setString(7, user.getUserType());

		int rows = pstmt.executeUpdate();
			
		pstmt.close();
		
		return rows;
	}
   
   
   //method: update문 - 사용자 정보 DB에서 수정
   public boolean updateEditUser(Connection conn, User user, int num) throws Exception {
      boolean result = true;
      int rows = 0;

      switch(num) {
	      case 1:
	         String sql = "update users set user_name=? where user_id=?";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, user.getUserName());
	         pstmt.setString(2, user.getUserId());
	         rows = pstmt.executeUpdate();
	         
	         if(rows == 1) {
	        	 result = true; //정보 수정 성공
	         }else {
	        	 result = false; //정보 수정 실패
	         }
	         pstmt.close();
	
	         break;
	         
	      case 2:
	         sql = "update users set phone_number=? where user_id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, user.getPhoneNumber());
	         pstmt.setString(2, user.getUserId());
	         rows = pstmt.executeUpdate();
	         
	         if(rows == 1) {
	        	 result = true; //정보 수정 성공
	         }else {
	        	 result = false; //정보 수정 실패
	         }
	         pstmt.close();

	         break;
	         
	      case 3:
	         sql = "update users set user_address=? where user_id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, user.getUserAddress());
	         pstmt.setString(2, user.getUserId());
	         rows = pstmt.executeUpdate();
	         
	         if(rows == 1) {
	            result = true; //정보 수정 성공
	         }else {
	            result = false; //정보 수정 실패
	         }
	         pstmt.close();

	         break;
	   }
      
      return result;
   }
   
   //method: delete문 - 사용자정보 DB에서 삭제
   public int deleteRemoveUser(Connection conn, String id) throws Exception {
      String sql = "delete from users where userid = ?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      
      int rows = pstmt.executeUpdate();
      
      pstmt.close();
      
      return rows;
   }
}



