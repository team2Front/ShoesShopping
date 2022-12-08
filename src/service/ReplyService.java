package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.ReplyDao;
import dto.QReply;
import dto.RReply;

public class ReplyService {
   private ReplyDao replyDao;
   private DataSource ds;
   
   public ReplyService(ServletContext application) {
	   this.replyDao = (ReplyDao) application.getAttribute("replyDao");
	   ds = (DataSource) application.getAttribute("dataSource");
   }
   
   //리뷰 댓글달기
   public String writeReviewReply(RReply rreply) throws SQLException {
	  String result = "";
	  Connection conn = null;
	  try {
			conn = ds.getConnection();
			int r = replyDao.insertReviewReply(conn, rreply);
	        if(r==1) {
	           result = "댓글이 등록되었습니다";           
	        } else {
	           result = "댓글이 등록되지 않았습니다";
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
       return result;
   }
   
   //QnA 댓글 달기
   public String writeQnaReply(QReply qreply) throws SQLException {
	   	String result = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
		  int r = replyDao.insertQnaReply(conn, qreply);
		  if(r==1) {
	           result = "댓글이 등록되었습니다";           
	        } else {
	           result = "댓글이 등록되지 않았습니다";
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
       return result;
   }
   
   //QnA댓글들 보여주기
   public List<QReply> showQnaReplys(int boardId) throws SQLException { //qna글에 해당하는 댓글 출력하기
	   	List<QReply> result = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = replyDao.selectQnaReply(conn, boardId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
	   
        return result;
      
   }
   
   //QnA댓글 삭제하기
   public String deleteQnaReply(QReply qreply) throws SQLException {
	   String result = "";
	   Connection conn = null;
		try {
			conn = ds.getConnection();
			int r = replyDao.deleteQnaReply(conn, qreply);
			if(r==1) {
		           result = "댓글이 삭제되었습니다";           
	        } else {
	           result = "해당 댓글 번호의 자신의 댓글이 존재하지 않습니다";
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
      return result;
   }
   
   //리뷰 댓글 삭제하기
   public String deleteReviewReply(RReply rreply) throws SQLException {
	   String result = "";
	   Connection conn = null;
		try {
			conn = ds.getConnection();
			int r = replyDao.deleteReviewReply(conn, rreply);
			if(r==1) {
		           result = "댓글이 삭제되었습니다";           
	        } else {
	           result = "해당 댓글 번호의 자신의 댓글이 존재하지 않습니다";
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
      return result;
   }
   
   //댓글 담은거 list로 출력   
   public List<RReply> showReviewReplys(int reviewId) { //qna글에 해당하는 댓글 출력하기
	   	List<RReply> result = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = replyDao.selectReviewReply(conn, reviewId);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
        return result;  
   }
   
   //리뷰대댓글 삭제하기 
   public String adDeleteReviewReply(RReply rreply) throws SQLException {
	   String result = null;
	   Connection conn = null;
		try {
			conn = ds.getConnection();
			int r = replyDao.adDeleteReviewReply(conn, rreply);
		    result = "해당하는 번호의 댓글이 없습니다";
		    if(r==1) {
		        result = "댓글이 삭제되었습니다";
		     }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
       return result;
   }
   
   //QnA대댓글 삭제하기
   public String adDeleteQnaReply(QReply qreply) throws SQLException {
	   String result = null;
	   Connection conn = null;
		try {
			conn = ds.getConnection();
			int r = replyDao.adDeleteQnaReply(conn, qreply);
		    result = "해당하는 번호의 댓글이 없습니다";
		    if(r==1) {
		        result = "댓글이 삭제되었습니다";
		     }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
       return result;
   }
   

   
   

}