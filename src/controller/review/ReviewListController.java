package controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ReviewList;
import service.ReviewService;
import util.PagingVo;

@WebServlet(name = "review.ReviewListController", urlPatterns="/review/ReviewListController")
public class ReviewListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId")); //일단 producId를 받아오는 값이 없으므로..임의의값..!

		//pageNo 얻기
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo == null) {
			strPageNo = "1";
		}
		int pageNo = Integer.parseInt(strPageNo);
		
		//ReviewService 객체 얻기
		ServletContext application = request.getServletContext();
		ReviewService reviewService = (ReviewService) application.getAttribute("reviewService");
		
		//페이징 대상이 되는 전체 행의 수 얻기
		int totalRows = reviewService.countAllReviews(productId);
		
		//페이징 객체
		PagingVo pager = new PagingVo(totalRows, pageNo);
		
		//pageNo에 해당하는 게시물 가져오기
		List<ReviewList> reviewList = reviewService.showReviewList(productId, pager);
		
		//리뷰id를 세션에 저장
		HttpSession session = request.getSession();
		
		//JSP에서 사용할 수 있도록, Request 범위에 저장
		request.setAttribute("pager", pager);
		request.setAttribute("reviewList", reviewList);
		
		request.getRequestDispatcher("/WEB-INF/views/review/reviewList.jsp").forward(request, response);
	}
}