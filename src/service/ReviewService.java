package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.ReviewDao;
import domain.Review;
import dto.ReviewList;
import util.PagingVo;

public class ReviewService {
   private ReviewDao reviewDao;
   private DataSource ds;
   
   public ReviewService(ServletContext application) {
	   this.reviewDao = (ReviewDao) application.getAttribute("reviewDao");
	   ds = (DataSource) application.getAttribute("dataSource");
   }
   
   //method: [상품 페이지] - 해당 상품의 리뷰 목록
   public List<ReviewList> showReviewList(int productId, PagingVo pvo) {
	   List<ReviewList> list = null;
	   Connection conn = null;
	   
	   try {
			conn = ds.getConnection();
			list = reviewDao.selectReviewList(conn, productId, pvo);
	   }catch(Exception e) {
			e.printStackTrace();
	   }finally {
			try{conn.close();}catch(Exception e) {}
	   }
	   
	   return list;
   }
   
   
   //method: [마이페이지] - 나의 리뷰 목록 (간단히 보기)
   public List<ReviewList> showMyReviews(String userId, PagingVo pvo) throws SQLException {
      List<ReviewList> list = null;
      Connection conn = null;
		try {
			conn = ds.getConnection();
			list = reviewDao.selectMyReviewList(conn, userId, pvo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
      return list;
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
   public int countAllMyReviews(String userId) throws SQLException {
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
   public String writeReview(Review review){
		Connection conn = null;
	      int r = 0;
	      String result = "";
	      
	      try {
	    	 conn = ds.getConnection();
	         r = reviewDao.insertReview(conn, review);
	         if (r == 1) {
	            result = "게시물이 등록되었습니다";
	         }
	      } catch (Exception e) {
	    	  result = "게시물이 등록되지 않았습니다";
	    	  e.printStackTrace();
	      } finally {
				try{conn.close();}catch(Exception e) {}
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
   public  String adDeleteReview(Review review) throws IOException, SQLException {
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
   public String heartCountUp(int reivewId) throws SQLException {
	   Connection conn=null;
	   int r = 0;
	   String result="";
	   try {
		   conn=  ds.getConnection();
		   r = reviewDao.updateReviewHeartCount(conn, reivewId);
		   result = "좋아요를 누를 게시글이 없습니다";
		   if (r == 1) {
		     result = "좋아요를 눌렀습니다";
		   }
		   }catch(Exception e) {
				e.printStackTrace();
		   }finally {
				try{conn.close();}catch(Exception e) {}
		   }
      return result;
   }

}