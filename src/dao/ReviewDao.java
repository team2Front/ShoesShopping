package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import domain.Product;
import domain.Review;
import dto.RReply;
import dto.ReviewList;
import util.PagingVo;

public class ReviewDao {
	private ReplyDao replyDao;
	private ProductDao productDao;
   
	public ReviewDao(ServletContext application) {
		this.replyDao = (ReplyDao) application.getAttribute("replyDao");
		this.productDao = (ProductDao) application.getAttribute("productDao");
	   }
   
	public int selectCount(Connection conn, int productId) throws SQLException {
		String sql = "select count(*) from review where product_id = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);
		ResultSet rs = pstmt.executeQuery();

		int cnt = 0;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		conn.close();
		return cnt;
	}

	// method: select문 - [마이페이지] 내가 작성한 리뷰 총개수
	public int selectMyCount(Connection conn, String userId) throws SQLException {
		String sql = "select count(*) from review where user_id = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int cnt = 0;

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		conn.close();
		return cnt;
	}

	public Review selectReview(Connection conn, int reviewId) throws SQLException {
		String sql = "select * from review where review_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewId);
		ResultSet rs = pstmt.executeQuery();

		List<RReply> replyList = replyDao.selectReviewReply(conn, reviewId);

		Review r1 = null;
		while (rs.next()) {
			r1 = new Review(rs.getInt("review_id"), rs.getString("review_title"), rs.getString("review_content"),
					rs.getDate("review_date"), rs.getString("user_id"), rs.getInt("star_score"),
					rs.getInt("heart_count"), rs.getString("filename"), rs.getString("filetype"),
					rs.getString("savedname"), replyList);
		}
		pstmt.close();

		return r1;

	}

	// method: select문 - [마이페이지] 내가 쓴 리뷰 목록
	public List<ReviewList> selectMyReviewList(Connection conn, String userId, PagingVo pvo) throws SQLException {
		int endRn = pvo.getEndRowNo();
		int startRn = pvo.getStartRowNo();
		List<ReviewList> list = new ArrayList<>();
		String sql = "select rm, review_id, review_title, review_date, user_id, product_id  " + "from ( "
				+ "select rownum as rm, review_id, review_title, review_date, user_id, product_id " + "from ("
				+ "select  review_id, review_title, review_content, review_date, user_id, product_id  " + "from review "
				+ "where user_id = ? " + "order by review_id" + ")" + " where rownum <= ? )" + "where rm >= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setInt(2, endRn);
		pstmt.setInt(3, startRn);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ReviewList rl = new ReviewList(rs.getInt("review_id"), rs.getString("review_title"),
							rs.getDate("review_date"), rs.getString("user_id"), rs.getInt("product_id"), new Product(), selectReview(conn, rs.getInt("review_id")));
			list.add(rl);
		}
		pstmt.close();
		conn.close();

		return list;
	}

	public int insertReview(Connection conn, Review review, int productId) throws Exception {
		String sql = "";
			sql += "insert into review (review_id, review_title, review_content, review_date, user_id, star_score, heart_count, product_id, filename, filetype, savedname) ";
			sql += "VALUES(Review_seq.NEXTVAL, ?, ?, sysdate, ?, ?, 0, ?, ?, ?, ?) ";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, review.getReviewTitle());
		pstmt.setString(2, review.getReviewContent());
		pstmt.setString(3, review.getUserId());
		pstmt.setInt(4, review.getStarScore());
		pstmt.setInt(5, productId);
		pstmt.setString(6, review.getRfileName());
		pstmt.setString(7, review.getRfileType());
		pstmt.setString(8, review.getRsavedName());

		int result = pstmt.executeUpdate();

		return result;
	}

   public int deleteReview(Connection conn, int reviewId, String userId) throws SQLException {
      String sql = "delete from review where review_id=? and user_id=?";
      // 유저아이디도 검사할 것
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, reviewId);
      pstmt.setString(2, userId);

      int r = pstmt.executeUpdate();

      // void로 처리할건지 String으로 처리할건지 곰곰히 생각해보기
      pstmt.close();
      conn.close();
      return r;

   }

   public int adDeleteReview(Connection conn, Review review) throws SQLException {
      String sql = "delete from review where review_id=? ";
      // 유저아이디도 검사할 것
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, review.getReviewId());

      int r = pstmt.executeUpdate();

      // void로 처리할건지 String으로 처리할건지 곰곰히 생각해보기
      pstmt.close();
      conn.close();
      return r;

   }

   // method: [상품 상세보기] - 리뷰 목록 
   public List<ReviewList> selectReviewList(Connection conn, int productId, PagingVo pvo) throws SQLException {
      int endRn = pvo.getEndRowNo();
      int startRn = pvo.getStartRowNo();
      List<ReviewList> list = new ArrayList<>();
      
      String sql = "select rm, review_id, review_title, review_date, user_id, product_id  " + "from ( "
            + "select rownum as rm, review_id, review_title, review_date, user_id, product_id " + "from ("
            + "select  review_id, review_title, review_content, review_date, user_id, product_id  " + "from review "
            + "where product_id = ? " + "order by review_id" + ")" + " where rownum <= ? )" + "where rm >= ?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, productId);
      pstmt.setInt(2, endRn);
      pstmt.setInt(3, startRn);
      ResultSet rs = pstmt.executeQuery();
      
      
      while (rs.next()) {
         ReviewList rl = new ReviewList(rs.getInt("review_id"), rs.getString("review_title"),
        		 						rs.getDate("review_date"), rs.getString("user_id"), rs.getInt("product_id"), 
        		 						new Product(), selectReview(conn, rs.getInt("review_id")));
    	 list.add(rl);
      }
      
      pstmt.close();
      //conn.close();

      return list;
   }

   public int updateReviewHeartCount(Connection conn, int reviewId) throws SQLException {
      String sql = "select heart_count from review where review_id=?";

      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, reviewId);
      ResultSet rs = pstmt.executeQuery();
      int r = 0;
      int heartCount = 0;
      
      if (rs.next()) {
         heartCount = rs.getInt("heart_count");
         sql = "update review set heart_count=? where review_id=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, heartCount + 1);
         pstmt.setInt(2, reviewId);
         r = pstmt.executeUpdate();
         
         if(r==1) {
        	 sql = "select heart_count from review where review_id=?";
        	 pstmt = conn.prepareStatement(sql);
        	 pstmt.setInt(1, reviewId);
        	 rs = pstmt.executeQuery();
        	 
        	 if(rs.next()) heartCount = rs.getInt("heart_count");
         }
      }
      pstmt.close();
      conn.close();
      
      return heartCount;
   }

   public int updateCancelReviewHeartCount(Connection conn, int reviewId) throws SQLException {
	   String sql = "select heart_count from review where review_id=?";
		
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, reviewId);
	   ResultSet rs = pstmt.executeQuery();
	   int r = 0;
	   int heartCount = 0;
	
	   if (rs.next()) {
		   heartCount = rs.getInt("heart_count");
		   sql = "update review set heart_count=? where review_id=?";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, heartCount - 1);
		   pstmt.setInt(2, reviewId);
		   r = pstmt.executeUpdate();
		
		   if(r==1) {
			   sql = "select heart_count from review where review_id=?";
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, reviewId);
			   rs = pstmt.executeQuery();
			
			   if(rs.next()) heartCount = rs.getInt("heart_count");
		   }
	   }
	   pstmt.close();
	   conn.close();
	
	   return heartCount;
	}

}