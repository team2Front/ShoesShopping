package controller.qna;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Qna;
import service.QnAService;

@WebServlet(name = "qna.WriteQnAController", urlPatterns="/qna/WriteQnAController")
public class WriteQnAController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ReviewService 객체 가져오기
		QnAService qnaService = (QnAService) request.getServletContext().getAttribute("qnaService");
		
//		int productId = Integer.parseInt(request.getParameter("productId"));
		
		// 세션 객체 가져온 후, 로그인ID 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");
		
		if(userId == null) {
			response.getWriter().println(0);
		} else {
			//input된 데이터 DTO에 담기
			Qna qna = new Qna();
			System.out.println(qna.getProductId());
			qna.setQnaTitle(request.getParameter("qnaTitle"));
			qna.setQnaContent(request.getParameter("qnaContent"));
			qna.setQnaDate(new Date());
			
			qnaService.writeQna(qna);
			
			response.getWriter().println(1);
		}
	}
}
