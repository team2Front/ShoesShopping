package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.QnaDao;
import domain.Qna;
import dto.QnaList;
import util.PagingVo;

public class QnAService {
	private QnaDao qnaDao;
	private DataSource ds;
	
	public QnAService(ServletContext application) {
		this.qnaDao = (QnaDao) application.getAttribute("qnaDao");
		ds = (DataSource) application.getAttribute("dataSource");
	}
    
    //큐엔에이 전체 글 수 구하기
   public int countAllQnas(int productId) {
	   int result = 0;
	   Connection conn = null;
	   try {
			conn = ds.getConnection();
			result = qnaDao.selectCount(conn, productId);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
      return result;
   }

    
    //1. 큐엔에이 간단히 보기
    public List<QnaList> showQnaList(int productId, PagingVo pvo)  {//qna 간단히 보기
    	List<QnaList> result = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = qnaDao.selectQnaList(conn, productId, pvo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
		
		return result;
        
   }
    //2. 큐엔에이 자세히 보기 showQnaOne(원하는 큐엔에이 번호)
    public Qna showQnaOne(int qnaId, int productId) throws SQLException { // qna 하나씩 보기
    	Qna result = null;
		Connection conn = null;
		try {
			conn = ds.getConnection();
			result = qnaDao.selectQna(conn, qnaId, productId);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
		
		return result;
    }
    
    //3. 큐엔에이 작성하기 writeQna(큐엔에이 번호, 큐엔에이 제목, 큐엔에이 내용, 글쓴이, 상품 번호)
    public String writeQna(Qna qna) throws SQLException {
    	Connection conn = null;
    	String result = "";
		try {
			conn = ds.getConnection();
			int r = qnaDao.insertQna(conn,qna);
			result = "게시물이 등록되지 않았습니다";
			if(r==1) {
		         result = "게시물이 등록되었습니다";
		    }
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			try{conn.close();}catch(Exception e) {}
		}
        return result;
    }
    
    //4. 큐엔에이 삭제하기 deleteQna(큐엔에이 번호, 글쓴이)
    public String deleteQna(Qna qna)throws IOException, SQLException {
    	Connection conn = null;
    	conn = ds.getConnection();
    	int r = qnaDao.deleteQna(conn, qna);
       String result = "해당 ID가 작성한 게시글이 아닙니다";
        if(r==1) {
           result = "게시글이 삭제되었습니다";
        }        
        return result;
         
     }
    
    public String adDeleteQna(Qna qna)throws IOException, SQLException {
    	Connection conn = null;
    	conn = ds.getConnection();
    	int r = qnaDao.adDeleteQna(conn, qna);
    	String result = "해당 번호의 게시글이 없습니다";
        if(r==1) {
           result = "게시글이 삭제되었습니다";
        }        
        return result;
         
     }
    

   
   
   
    
}