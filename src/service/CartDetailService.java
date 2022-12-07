package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.CartDetailDao;
import domain.CartDetail;
import domain.Product;
import dto.OrderDto;

public class CartDetailService {
	private DataSource ds;
	private CartDetailDao cartDetailDao;
	private ProductService productService;
	private ProductAndColorService productAndColorService;
	private ProductAndSizeService productAndSizeService;
	private CartService cartService;
	
	public CartDetailService(ServletContext application) {
		this.ds = (DataSource) application.getAttribute("dataSource");
		this.productService = (ProductService) application.getAttribute("productService");
		this.productAndColorService = (ProductAndColorService) application.getAttribute("productAndColorService");
		this.productAndSizeService = (ProductAndSizeService) application.getAttribute("productAndSizeService");
		this.cartDetailDao = (CartDetailDao) application.getAttribute("cartDetailDao");
		this.cartService = (CartService) application.getAttribute("cartService");
	}
	
	// 해당 상품을 장바구니에 넣는다.
	// 장바구니속 총 수량,총 금액을 수정한다.
    public String addCartDetail(OrderDto od) { 
    	Connection conn = null;
		String result = "";
    	
    	try {
    		conn = ds.getConnection();
			conn.setAutoCommit(false);			
			Product product = productService.showOneProduct(od.getProductId());	
    		// 주문한 상품 색상, 사이즈  확인 필요
			boolean colorCheck = productAndColorService.checkColor(product.getProductId(), od.getColor());
			boolean sizeCheck = productAndSizeService.checkSize(product.getProductId(), od.getSize());
			
			// 삭제되지 않은 상품 구매 , 색상, 컬러 확인 후 장바구니에 담을 수 있다.
			if(product.isDeleted() || !colorCheck || !sizeCheck) {

				return od.getProductId() + "번 상품을 장바구니에 담는데 실패했습니다."; 

			}
			
			// 장바구니에 상품을 담았으므로, 장바구니의 총 수량과 총 금액을 업데이트 해야된다.
			cartService.refreshCart(conn, od.getUserId(), product.getProductPrice() * od.getQuantity(), od.getQuantity());
			result = od.getProductId() + "번 상품이 장바구니에 담겼습니다.";
        	 		
        	conn.commit();
    	} catch(SQLException |RuntimeException e) {
    		try {
				conn.rollback();
				result = od.getProductId() + "번 상품을 장바구니에 담는데 실패했습니다."; 
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
    	} finally {
			if(conn!=null) try { conn.close();}catch(Exception e) { }
		}
		
    	return result;
	}
  
    
    // 장바구니에 담긴 내역들 list 로 Cart 에 전달하기
    public List<CartDetail> findByUserId(Connection conn, String userId) {
    	List<CartDetail> list = null;
		try {
			list = cartDetailDao.selectCartDetails(conn, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
    }
    
    //장바구니 항목 1삭제
    public void removeCartDetailOneForOrder(Connection conn, String userId, int cdId){    						
		try {
			CartDetail cd = getCartDetailOne(conn, cdId);
			int mp = cd.getProduct().getProductPrice() * cd.getQuantity();
			int mq = cd.getQuantity();
			cartDetailDao.removeCartDetailOne(conn, cdId);
			cartService.refreshCart(conn, userId, -mp, -mq);
			
		} catch (Exception e) {
			try {
				throw new Exception();
			} catch (Exception e1) {}
		}
    }
    
    
    
    
    //장바구니 항목 1삭제
    public String removeCartDetailOne(String userId, int cdId){  
    	Connection conn = null;
    	String result = "";
    	
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			CartDetail cd = getCartDetailOne(conn, cdId);
			int mp = cd.getProduct().getProductPrice() * cd.getQuantity();
			int mq = cd.getQuantity();
			
			int r = cartDetailDao.removeCartDetailOne(conn, cdId);
			
			if(r == 1) {
				cartService.refreshCart(conn, userId, -mp, -mq);
				result = cdId + "번 장바구니 상품이 삭제되었습니다."; 
			}
			conn.commit();
			
		} catch(Exception e) {

			e.printStackTrace();
			
			try {
				conn.rollback();
				result = cdId + "번 장바구니 상품이 삭제에 실패했습니다.!!!"; 
				throw new RuntimeException(e);


			} catch (SQLException e1) {
				e1.printStackTrace();
				e.printStackTrace();
			}
		} finally {
			if(conn!=null) try { conn.close();}catch(Exception e) { }
		}
		return result;
    }
    
    
    
    //cartDetail 객체 1개 반환
    public CartDetail getCartDetailOne(Connection conn, int cartDetailId) {
    	CartDetail cd = null;
		try {
			cd = cartDetailDao.selectCartDetail(conn, cartDetailId);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return cd;
    }
    
    // 주문서 컨트롤러에서 직접 호출하는 메소드 
    public CartDetail getCartDetail(int cartDetailId) {
    	Connection conn = null;
    	CartDetail cd = null;
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			cd = cartDetailDao.selectCartDetail(conn, cartDetailId);
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				conn.rollback();

			} catch (SQLException e1) {
				e1.printStackTrace();
				e.printStackTrace();
			}
		} finally {
			if(conn!=null) try { conn.close();}catch(Exception e) { }
		}
    	return cd;
    }

    //—————————— 카트 디케일 서비스의 updateCartDetailQuantity 메소드 ㅡㅡㅡㅡ 

 // 장바구니 상세내역의 수량 변경
     public String updateCartDetailQuantity(String userId, int cartDetailId, int quantity) {
     	Connection conn = null;
     	String str = "";
     	   	
     	try {
     		conn = ds.getConnection();
     		conn.setAutoCommit(false);
     		
     		// 변경 전 기존의 수량, 수량*상품금액 가져오기
     		CartDetail cd = getCartDetailOne(conn, cartDetailId);
     		
     		// 삭제된 상품인 경우 수량 변경 막기
     		if(cd.getProduct().isDeleted()) throw new RuntimeException();
     		int xquantity = cd.getQuantity();
     		int xtotalPrice = cd.getProduct().getProductPrice() * xquantity;
     		
     		// 새로 변경할 수량, 그에따른 가격
     		int q = quantity;
     		int p = cd.getProduct().getProductPrice() * q;
     		// 새로운 변경사항 반영하기 
     		cartDetailDao.updateQuantity(conn, cartDetailId, quantity);
     		// cart 의 총 수량, 금액 변경하기 
     		int rq = -xquantity + quantity;
     		int rp = -xtotalPrice + p;
     		cartService.refreshCart(conn, userId, rp, rq);
    
     		str = "수량 변경이 완료되었습니다. ";
     		conn.commit();
 			
 		} catch(Exception e) {
 			e.printStackTrace();
 			
 			try {
 				conn.rollback();
 	    		str = "수량 변경에 실패했습니다. ";
// 				throw new RuntimeException(e);

 			} catch (SQLException e1) {}
 		} finally {
 			if(conn!=null) try { conn.close();} catch(Exception e) { }
 		}
     	
 		return str;
     }
    

    
}
