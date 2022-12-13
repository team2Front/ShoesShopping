package controller.mypage;

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


@WebServlet(name = "mypage.MyReviewController", urlPatterns = "/mypage/MyReviewController")
public class MyReviewController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 객체 가져온 후, 로그인ID 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");
		
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
		int totalRows = reviewService.countAllMyReviews(userId);
		
		//페이징 객체
		PagingVo pager = new PagingVo(totalRows, pageNo);
		
		//pageNo에 해당하는 게시물 가져오기
		List<ReviewList> reviewList = reviewService.showMyReviews(userId, pager);
		
		//JSP에서 사용할 수 있도록, Request 범위에 저장
		request.setAttribute("pager", pager);
		request.setAttribute("reviewList", reviewList);
		
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_myReview.jsp").forward(request,response);
	}

}
