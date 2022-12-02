package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.CartDao;
import domain.CartDetail;
import dto.CartDetailDto;
import dto.CartDto;
import util.ConnectionProvider;

public class CartService {
	private DataSource ds;
	private CartDao cartDao;
    private CartDetailService cartDetailService;
    
    public CartService(ServletContext application) {
    	try {
		      InitialContext ic = new InitialContext();
		      ds = (DataSource) ic.lookup("java:comp/env/jdbc/java");
		      Connection conn = ds.getConnection();
		      conn.close();
		      }catch(Exception e) {
		         e.printStackTrace();
		      }
    	
    	this.cartDao = (CartDao) application.getAttribute("cartDao");
    	this.cartDetailService = (CartDetailService) application.getAttribute("cartDetailService");
    }
    
    // 회원가입시 유저 당 카트 생성 
    public void createCart(String userId) {
    	Connection conn = null;
    	try {
    		conn = ds.getConnection();
    		cartDao.insertCart(conn, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	//장바구니에 담긴 상품들 ,총 수량, 총 금액 보여준다.
    public CartDto showCart(String userId) {
    	Connection conn = null;
    	CartDto cartDto = null;
    	
    	try {		
    		conn = ds.getConnection();
			cartDto = cartDao.selectCart(conn, userId);
			CartDetailDto cdto = new CartDetailDto();
			//cart detail 정보 가져오기
			List<CartDetail> cdList = cartDetailService.findByUserId(conn,userId);
			
			List<CartDetailDto> list = cdto.toCartDetailDtoList(cdList);
			cartDto.setCartDetailDtoList(list);
			
    	} catch(Exception e) {   		
			e.printStackTrace();
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
