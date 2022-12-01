package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import dao.OrderDao;
import domain.Orders;
import lombok.NoArgsConstructor;
import util.PagingVo;

@NoArgsConstructor
public class OrderService {
	//field
	private ServletContext application;
	private OrderDao orderDao; 
	
	//constructor
	public OrderService(ServletContext application) {
		this.application = application;
		this.orderDao = (OrderDao) application.getAttribute("orderDao");
	}
	
	// order 테이블 전체 count
	public int countAll(String userId) {
		return orderDao.selectCount(userId);
	}
	
	// 모든 주문 조회 -  페이징 처
	public List<Orders> showOrders(String userId, PagingVo pvo) {
		int all = countAll(userId);
		return orderDao.selectOrder(userId, pvo);
	}		
	
	// 주문을 등록하고 등록된 id 값을 받아와서 리턴한다.
	public int addOrder(Connection conn, String uId, int totalPrice, int quantity) throws SQLException {
		return orderDao.insertOrder(conn, uId, totalPrice, quantity);
	}

	
	// 주문 취소
    public String cancelOrders(List<Integer> list) {
       String result = "";
       
       for(int oId : list) {
    	   int row = orderDao.deleteOrders(oId);
    	   if(row==1) {
    		   result += oId + "번 주문 취소를 성공하였습니다. \n";
    	   } else {
    		   result += oId + "번 주문 취소를 실패하였습니다. \n";
    	   }
    	   
       }
       return result;
    }
	
}
