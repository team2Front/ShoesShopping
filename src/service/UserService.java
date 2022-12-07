package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.UserDao;
import domain.User;
import dto.UserInfo;

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
	public int pwCheck(String loginId, String pw) {
		Connection conn = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			
			if (userDao.selectPwCheck(conn, loginId, pw)) {
				result = 1; // 비밀번호 일치
			} else {
				result = 0; // 비밀번호 불일치
			}
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
			cartService.createCart(user.getUserId());
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
	}

	// method: 관리자 등록(추가)
	public String registerAdmin(User user) {
		Connection conn = null;
		String result = null;
		
		try {
			conn = ds.getConnection();
			
			if (userDao.insertRegisterAdmin(conn, user)) {
				result = "회원가입이 완료되었습니다.";
			} else {
				result = "회원가입에 실패하였습니다.";
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

	// method: 로그인
	public String login(User user) {
		Connection conn = null;
		String type = "";
		
		try {
			conn = ds.getConnection();
			
			if (userDao.selectLogin(conn, user) != null) {
				type = userDao.selectLogin(conn, user); // 로그인 성공
			} else {
				type = null; // 로그인 실패
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}

		return type;
	}

	// method: 비밀번호 맞음 -> 회원정보 목록
	public UserInfo userInfo(String id) {
		Connection conn = null;
		UserInfo userInfo = new UserInfo();
		
		try {
			conn = ds.getConnection();
			userInfo = userDao.selectUserInfo(conn, id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return userInfo;
	}

	//method: 회원정보 수정
	public boolean editUserInfo(User user, int num) {
		Connection conn = null;
		boolean result = true;
		
		try {
			conn = ds.getConnection();
		
			if (userDao.updateEditUser(conn, user, num)) {
				result = true; // 정보수정 완료
			} else {
				result = false; // 정보수정 실패
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

	// method: 회원탈퇴
	public boolean removeUserInfo(String id) {
		Connection conn = null;
		boolean result = true;
		
		try {
			conn = ds.getConnection();

			if (userDao.deleteRemoveUser(conn, id)) {
				result = true; // 회원탈퇴 성공
			} else {
				result = false; // 회원탈퇴 실패
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}

}
