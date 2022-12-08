package controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import dto.RReply;
import service.ReplyService;
import service.ReviewService;

@WebServlet(name = "review.WriteReplyController", urlPatterns="/review/WriteReplyController")
public class WriteReplyController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		ReplyService replyService = (ReplyService) application.getAttribute("replyService");
		
		String hi = request.getParameter("writeReply");
		//String he = request.getParameter("reviewId");
		
		//System.out.println(he);
		System.out.println(hi);
	}
}