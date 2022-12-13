package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.ReviewDao;
import domain.Product;
import domain.Review;
import dto.ReviewList;
import util.PagingVo;

public class ReviewService {
   private ReviewDao reviewDao;
   private ProductService productService;
   private DataSource ds;
   
   public ReviewService(ServletContext application) {
	   this.reviewDao = (ReviewDao) application.getAttribute("reviewDao");
	   this.productService = (ProductService) application.getAttribute("productService");
	   ds = (DataSource) application.getAttribute("dataSource");
   }
   
   //method: [상품 페이지] - 해당 상품의 리뷰 목록
   public List<ReviewList> showReviewList(int productId, PagingVo pvo) {
	   List<ReviewList> lists = new ArrayList<>();
	   Connection conn = null;
	   
	   try {
			conn = ds.getConnection();
			lists = reviewDao.selectReviewList(conn, productId, pvo);
			
			Product product = productService.showOneProduct(productId);
			
			for(ReviewList list : lists) {
				list.setProduct(product);
			}
			
			//System.out.println(lists);
			
	   }catch(Exception e) {
			e.printStackTrace();
	   }finally {
			try{conn.close();}catch(Exception e) {}
	   }
	   
	   return lists;
   }
   
   
   //method: [마이페이지] - 나의 리뷰 목록 (간단히 보기)
   public List<ReviewList> showMyReviews(String userId, PagingVo pvo) {
      List<ReviewList> myLists = null;
      ReviewList list = new ReviewList();
      Connection conn = null;
      
      try {
    	  conn = ds.getConnection();
    	  myLists = reviewDao.selectMyReviewList(conn, userId, pvo);
			
    	  for(int i=0; i<myLists.size(); i++) {
    		  int productId = myLists.get(i).getProductId();
    		  Product product = productService.showOneProduct(productId);
    		  myLists.get(i).setProduct(product);
    	  }
			
      }catch(Exception e) {
    	  e.printStackTrace();
      }finally {
    	  try{conn.close();}catch(Exception e) {}
      }
      
      return myLists;
   }

   // 2. 리뷰 자세히 보기 showReviewOne(원하는 리뷰 번호)
   public Review showReviewOne(int reviewId) {
      Review review = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			review = reviewDao.selectReview(conn, reviewId);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();} catch(Exception e) {}
		}
      return review;
   }
   
   //method: [상품 페이지] - 해당 상품 리뷰 총 개수
   public int countAllReviews(int productId) {
	  int result = 0;
	  Connection conn = null;
	  
	  try {
		  conn = ds.getConnection();
		  result = reviewDao.selectCount(conn, productId);
	  } catch (Exception e) {
		  e.printStackTrace();
	  } finally {
			try{conn.close();} catch(Exception e) {}
	  }
	  
      return result;
   }
   
 //method: [마이페이지] - 나의 리뷰 총 개수 (페이징 처리)
   public int countAllMyReviews(String userId) {
	   int result = 0;
	   Connection conn = null;
	   try {
	   conn=  ds.getConnection();
	   result = reviewDao.selectMyCount(conn, userId);
	   }catch(Exception e) {
			e.printStackTrace();
	   }finally {
			try{conn.close();}catch(Exception e) {}
	   }
      return result;
   }
   
   //리뷰 작성
   public int writeReview(Review review, int productId){
		Connection conn = null;
		int result = 0;
		try {
			System.out.println("writeReviewService입니다.");
			conn = ds.getConnection();
			result = reviewDao.insertReview(conn, review, productId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
   
/*   //리뷰 작성
   public String writeReview(Review review) throws SQLException {
	   Connection conn = null;
	   int r = 0;
	   String result = "";
	   try {
		   conn = ds.getConnection();
		   r = reviewDao.insertReview(conn, review);
		   if (r == 1) {
			   result = "게시물이 등록되었습니다";
		   }
	   } catch (RuntimeException e) {
		   throw new RuntimeException();
	   }
	   
	   return result;
   }
*/
   // 4. 리뷰 삭제하기 deleteReview(리뷰 번호, 글쓴이)
   public  String deleteReview(Review review) throws IOException, SQLException {
	  Connection conn = null;
	  int r =0;
	  String result ="";
	  try {
		   conn=  ds.getConnection();
		   r =  reviewDao.deleteReview(conn, review);
		   result = "해당 ID가 작성한 리뷰가 아닙니다";
		   if (r == 1) {
		      result = "게시물이 삭제되었습니다";
		   }
	   }catch(Exception e) {
			e.printStackTrace();
	   }finally {
			try{conn.close();}catch(Exception e) {}
	   }
      
      return result;
   }
   
   //관리자용 리뷰 게시글 삭제
   public String adDeleteReview(Review review) throws IOException, SQLException {
	   Connection conn = ds.getConnection();  
	   int r = 0;
	   String result="";
	   try {
		   conn=  ds.getConnection();
		   r = reviewDao.adDeleteReview(conn, review);
		   result = "해당 게시글이 존재하지 않습니다";
	        if (r == 1) {
	            result = "게시물이 삭제되었습니다";
	        }
		   }catch(Exception e) {
				e.printStackTrace();
		   }finally {
				try{conn.close();}catch(Exception e) {}
		   }
		 return result;
      }

   // 5. 리뷰에 좋아요 누르기 heartCountUp (원하는 리뷰 번호)
   public int heartCountUp(int reviewId) {
	   Connection conn=null;
	   int result = 0;
	   try {
		   conn=  ds.getConnection();
		   result = reviewDao.updateReviewHeartCount(conn, reviewId);
	   }catch(Exception e) {
			e.printStackTrace();
	   }finally {
			try{conn.close();}catch(Exception e) {}
	   }
      return result;
   }

   // 5. 리뷰에 좋아요 누르기 취소 CancelheartCountUp (원하는 리뷰 번호)
   public int CancelheartCountUp(int reviewId) {
	   Connection conn=null;
	   int result = 0;
	   try {
		   conn=  ds.getConnection();
		   result = reviewDao.updateCancelReviewHeartCount(conn, reviewId);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   try{conn.close();}catch(Exception e) {}
	   }
	   return result;
   }

}