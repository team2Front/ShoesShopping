package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.OrderDao;
import domain.Orders;
import lombok.NoArgsConstructor;
import util.PagingVo;

@NoArgsConstructor
public class OrderService {
	//field
	private DataSource ds;
	private OrderDao orderDao; 
	private OrderDao myorderDao;
	
	//constructor
	public OrderService(ServletContext application) {
		this.ds = (DataSource) application.getAttribute("dataSource");
		this.orderDao = (OrderDao) application.getAttribute("orderDao");
		this.myorderDao = (OrderDao) application.getAttribute("myOrderDao");
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
			list = orderDao.selectOrder(conn, userId, pvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return list;
	}		
	
	public List<Orders> myshowOrders(String userId, PagingVo pvo) {
		Connection conn = null;
		//int all = countAll(userId); //얘를 쓰는 이유를 모르겠음..ㅜ
		List<Orders> list = null;
		
		try {
			conn = ds.getConnection();
			list = myorderDao.selectOrder(conn, userId, pvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close();} catch (SQLException e) {}
		}
		
		return list;
	}		
	
	// 주문을 등록하고 등록된 id 값을 받아와서 리턴한다.
	public int addOrder(Connection conn, String uId, int totalPrice, int quantity) throws Exception {
		int oId =  orderDao.insertOrder(conn, uId, totalPrice, quantity);
		return oId;
	}

	
	// 주문 취소
	public int cancelOrders(int ordersId) {
		Connection conn = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			row = orderDao.deleteOrders(conn, ordersId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (SQLException e) {}
		}

		return row;
	}
	
}
