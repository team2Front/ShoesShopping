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

	// method: select문 - 아이디 중복 여부 판별
	public boolean selectUserId(Connection conn, String id) throws Exception {
		String sql = "select user_id from users where user_id=? ";
		boolean result = false;
		System.out.println("~~~~~~~~~ sa   " + result);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		result = rs.next();
		pstmt.close();
		System.out.println("~~~~~~~~~    " + result);
		return result;
	}

	// method: select문 - 핸드폰 번호 중복 여부 확인
	public boolean selectPnCheck(Connection conn, String pn) throws Exception {
		String sql = "select phone_number from users where phone_number=? ";
		boolean result = false;

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pn);
		ResultSet rs = pstmt.executeQuery();
		result = rs.next();
		pstmt.close();

		return result;
	}

	// method: select문 - 비밀번호 확인
	public boolean selectPwCheck(Connection conn, String loginId, String pw) throws Exception {
		String sql = "select user_id, user_password from users where user_id = ? and userpassword=?";
		boolean result = false;

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginId);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		result = rs.next();
		pstmt.close();

		return result;
	}

	// method: select문 - 로그인
	public String selectLogin(Connection conn, User user) throws Exception {
		String sql = "select user_id, USER_TYPE from users where user_id=? and user_password=?";
		String type = "";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getUserPassword());
		ResultSet rs = pstmt.executeQuery();
		// 로그인 성공이면 user_type 리턴
		if (rs.next()) {
			type = rs.getString("USER_TYPE");
		} else {
			// 로그인 실패면 null 리턴
			type = ""; // 로그인 실패
		}
		pstmt.close();

		return type;
	}

	// method: select문 - 사용자 정보 목록
	public User selectUserInfo(Connection conn, String id) throws Exception {
		String sql = "";
		sql += "select user_id, user_password, user_name, user_address, phone_number, filename, filetype, savedname ";
		sql += "from users ";
		sql += "where userid=? ";

		User user = null;

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			user = new User();
			user.setUserId(rs.getString("user_id"));
			user.setUserPassword(rs.getString("user_password"));
			user.setUserName(rs.getString("user_name"));
			user.setUserAddress(rs.getString("user_address"));
			user.setPhoneNumber(rs.getString("phone_number"));
			user.setFilename(rs.getString("filename"));
			user.setFiletype(rs.getString("filetype"));
			user.setSavedname(rs.getString("savedname"));
		}

		rs.close();
		pstmt.close();

		return user;
	}

	// method: insert문 - 사용자 정보를 DB에 등록
	public int insertRegisterUser(Connection conn, User user) throws Exception {
		String sql = "";
		sql += "insert into users(user_id, user_name, user_password, user_email, user_address, phone_number) ";
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
		sql += "insert into users(user_id, user_name, user_password, user_email, user_address, phone_number, user_type) ";
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

	// method: update문 - 사용자 정보 DB에서 수정
	public int updateEditUser(Connection conn, User user) throws Exception {
		String sql = "";
		sql += "update users ";
		sql += "set user_name=?, user_password=?, user_address=?, phone_number=?, filename=?, filetype=?, savedname=? ";
		sql += "where user_id=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getUserPassword());
		pstmt.setString(3, user.getUserAddress());
		pstmt.setString(4, user.getPhoneNumber());
		pstmt.setString(5, user.getFilename());
		pstmt.setString(6, user.getFiletype());
		pstmt.setString(7, user.getSavedname());
		pstmt.setString(8, user.getUserId());

		int rows = pstmt.executeUpdate();

		pstmt.close();

		return rows;
	}

	// method: delete문 - 사용자정보 DB에서 삭제
	public int deleteRemoveUser(Connection conn, String id) throws Exception {
		String sql = "delete from users where user_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		int rows = pstmt.executeUpdate();

		pstmt.close();

		return rows;
	}
}
