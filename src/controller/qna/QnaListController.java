package controller.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.QnaList;
import dto.ReviewList;
import service.QnAService;
import service.ReviewService;
import util.PagingVo;

@WebServlet(name = "qna.QnaListController", urlPatterns="/qna/QnaListController")
public class QnaListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		//pageNo 얻기
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo == null) {
			strPageNo = "1";
		}
		int pageNo = Integer.parseInt(strPageNo);
		
		//ReviewService 객체 얻기
		ServletContext application = request.getServletContext();
		QnAService qnaService = (QnAService) application.getAttribute("qnaService");
		
		//페이징 대상이 되는 전체 행의 수 얻기
		
		int totalRows = qnaService.countAllQnas(productId);
		
		//페이징 객체
		PagingVo pager = new PagingVo(totalRows, pageNo);
		
		//pageNo에 해당하는 게시물 가져오기
		List<QnaList> qnaList = qnaService.showQnaList(productId, pager);
		System.out.println(qnaList);
		
		//JSP에서 사용할 수 있도록, Request 범위에 저장
		request.setAttribute("pager", pager);
		request.setAttribute("qnaList", qnaList);
		
		request.getRequestDispatcher("/WEB-INF/views/qna/qnaList.jsp").forward(request, response);
	}
}