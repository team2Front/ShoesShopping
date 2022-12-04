package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.OrderDao;
import domain.Orders;
import lombok.NoArgsConstructor;
import util.PagingVo;

@NoArgsConstructor
public class OrderService {
	//field
	private ServletContext application;
	private DataSource ds;
	private OrderDao orderDao; 
	
	//constructor
	public OrderService(ServletContext application) {
		this.application = application;
		this.orderDao = (OrderDao) application.getAttribute("orderDao");
		
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jbc/java");
			
			//트랜잭션을 위한 커넥션
			Connection conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	// order 테이블 전체 count
	public int countAll(String userId) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			result = orderDao.selectCount(conn, userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return result;
	}
	
	// 모든 주문 조회 - 페이징 처리
	public List<Orders> showOrders(String userId, PagingVo pvo) {
		Connection conn = null;
		//int all = countAll(userId); //얘를 쓰는 이유를 모르겠음..ㅜ
		List<Orders> list = null;
		
		try {
			conn = ds.getConnection();
			orderDao.selectOrder(conn, userId, pvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return list;
	}		
	
	// 주문을 등록하고 등록된 id 값을 받아와서 리턴한다.
	public int addOrder(Connection conn, String uId, int totalPrice, int quantity) throws SQLException {
		return orderDao.insertOrder(conn, uId, totalPrice, quantity);
	}

	
	// 주문 취소
    public String cancelOrders(List<Integer> list) {
    	Connection conn = null;
    	String result = null;
    	int row = 0;
       
    	try {
	        for(int oId : list) {
	        	conn = ds.getConnection();
        		row = orderDao.deleteOrders(conn, oId);
        		if(row==1) {
        			result += oId + "번 주문 취소를 성공하였습니다. \n";
        		} else {
        			result += oId + "번 주문 취소를 실패하였습니다. \n";
        		}
	        }
    	} catch(Exception e) {
    		e.printStackTrace();
    	} finally {
			try { conn.close();} catch (SQLException e) {}
		}

    	return result;
    }
	
}
