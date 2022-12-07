package controller.review;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewService;

@WebServlet(name = "review.heartController", urlPatterns="/review/heartController")
public class heartController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		ServletContext application = request.getServletContext();
		ReviewService reviewService = (ReviewService) application.getAttribute("reviewService");
		
		int heartCount = reviewService.CancelheartCountUp(reviewId);
		
		//ajax로 요청한 값을 응답으로 돌려줌
		response.getWriter().println(heartCount);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		ServletContext application = request.getServletContext();
		ReviewService reviewService = (ReviewService) application.getAttribute("reviewService");
		
		int heartCount = reviewService.heartCountUp(reviewId);
		
		//ajax로 요청한 값을 응답으로 돌려줌
		response.getWriter().println(heartCount);
	}
	
	
}