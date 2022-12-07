package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.UserDao;
import domain.User;

public class UserService {
	//field
	private DataSource ds;
	private UserDao userDao; 
	private CartService cartService;
	
	//constructor
	public UserService(ServletContext application) {
		this.userDao = (UserDao) application.getAttribute("userDao");
		this.cartService = (CartService) application.getAttribute("cartService");
		this.ds = (DataSource) application.getAttribute("dataSource");
	}
	
	// method: 아이디 중복여부 확인 (회원 여부 확인)
	public boolean idCheck(String id) {
		Connection conn = null;
		boolean result = false;
		
		try {
			conn = ds.getConnection();
			result = userDao.selectUserId(conn, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

	// method: 핸드폰 번호 중복여부 확인
	public boolean pnCheck(String pn) {
		Connection conn = null;
		boolean result = false;
		
		try {
			conn = ds.getConnection();
			result = userDao.selectPnCheck(conn, pn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

	// method: 비밀번호 확인
	public boolean pwCheck(String loginId, String pw) {
		Connection conn = null;
		boolean result = false;
		try {
			conn = ds.getConnection();
			result = userDao.selectPwCheck(conn, loginId, pw);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

	// method: 유저 등록(추가)`
	public void registerUser(User user) {
		Connection conn = null;
		
		try {
			conn = ds.getConnection();
			userDao.insertRegisterUser(conn, user);
			cartService.createCart(conn, user.getUserId());
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
	}

	// method: 관리자 등록(추가)
	public void registerAdmin(User user) {
		Connection conn = null;
		
		try {
			conn = ds.getConnection();
			userDao.insertRegisterAdmin(conn, user);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
	}

	// method: 로그인
	public String login(User user) {
		Connection conn = null;
		String type = "";
		try {
			conn = ds.getConnection();
			type = userDao.selectLogin(conn, user);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}

		return type;
	}

	// method: 비밀번호 맞음 -> 회원정보 목록
	public User userInfo(String id) {
		User user = null;
		Connection conn = null;
		
		try {
			conn = ds.getConnection();
			user = userDao.selectUserInfo(conn, id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return user;
	}

	//method: 회원정보 수정
	public int editUserInfo(User user) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			result = userDao.updateEditUser(conn, user);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		return result;
	}

	// method: 회원탈퇴
	public int removeUserInfo(String id) {
		Connection conn = null;
		int result = 0;
		try {
			conn = ds.getConnection();
			result = userDao.deleteRemoveUser(conn, id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

}
