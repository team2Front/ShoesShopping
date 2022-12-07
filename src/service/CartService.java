package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.CartDao;
import dao.CartDetailDao;
import domain.CartDetail;
import dto.CartDetailDto;
import dto.CartDto;

public class CartService {
	private DataSource ds;
	private CartDao cartDao;
    private CartDetailDao cartDetailDao;
    
    public CartService(ServletContext application) {
    	this.ds = (DataSource) application.getAttribute("dataSource");
    	this.cartDao = (CartDao) application.getAttribute("cartDao");
    	this.cartDetailDao = (CartDetailDao) application.getAttribute("cartDetailDao");
    }
    
    // 회원가입시 유저 당 카트 생성 
    public void createCart(Connection conn, String userId) throws Exception {
    
	cartDao.insertCart(conn, userId);
		
    }
    
	//장바구니에 담긴 상품들 ,총 수량, 총 금액 보여준다.
    public CartDto showCart(String userId) {
    	Connection conn = null;
    	CartDto cartDto = null;
    	
    	try {		
    		conn = ds.getConnection();
    		conn.setAutoCommit(false);
			cartDto = cartDao.selectCart(conn, userId);
			CartDetailDto cdto = new CartDetailDto();
			//cart detail 정보 가져오기
			List<CartDetail> cdList = cartDetailDao.selectCartDetails(conn,userId);
			
			List<CartDetailDto> list = cdto.toCartDetailDtoList(cdList);
			cartDto.setCartDetailDtoList(list);
			
    	}  catch (Exception e) {
			try {
 				conn.rollback();
 			} catch (SQLException e1) {}
		} finally {
			if(conn!=null) try { conn.close();}catch(Exception e) { }
		}
    		
	   return cartDto;
    	
    }
		
	//장바구니의 총 수량, 금액  수정
   public void refreshCart(Connection conn, String userId, int totalPrice, int quantity){
	   // 기존의 수량, 가격 가져오기
	   CartDto cd;
		try {
			cd = showCart(userId);
			int p = cd.getTotalPrice();
			int q = cd.getTotalQuantity();
			
			// 수량, 가격 변경싴키기
			int np = p + totalPrice;
			int nq = q + quantity;
	
			cartDao.updateCart(conn, userId, np, nq);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
   }

}
