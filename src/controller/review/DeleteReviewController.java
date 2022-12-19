package controller.review;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Review;
import service.ReviewService;

@WebServlet(name = "review.DeleteReviewController", urlPatterns="/review/DeleteReviewController")
public class DeleteReviewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		// 세션 객체 가져온 후, 로그인ID 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");

		// 컨테이너에서 서비스 객체 가져오기
		ServletContext application = request.getServletContext();
		ReviewService reviewService = (ReviewService) application.getAttribute("reviewService");
		
		int result = reviewService.deleteReview(reviewId, userId);
		
		//ajax로 요청한 값을 응답으로 돌려줌
		response.getWriter().println(result);
	}

}