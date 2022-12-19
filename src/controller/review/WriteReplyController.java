package controller.review;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dto.RReply;
import service.ReplyService;

@WebServlet(name = "review.WriteReplyController", urlPatterns="/review/WriteReplyController")
public class WriteReplyController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		ReplyService replyService = (ReplyService) application.getAttribute("replyService");
		
		// 세션 객체 가져온 후, 로그인ID 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");
		
		if(userId == null) {
			response.getWriter().println(0);
		} else {
			//input된 데이터 DTO에 담기
			RReply rreply = new RReply();
			rreply.setUserId(userId);
			rreply.setReviewId((Integer.parseInt(request.getParameter("reviewId"))));
			rreply.setReplyContent(request.getParameter("writeReply"));
			rreply.setReplyDate(new Date());
			
			replyService.writeReviewReply(rreply); //댓글 등록!
			
			//댓글DTO를 json형식으로 가공하여 요청에 대한 응답을 보냄
			JSONObject root = new JSONObject();
			root.put("userId", userId);
			root.put("replyContent", rreply.getReplyContent());
			root.put("replyDate", rreply.getReplyDate());
			String json = root.toString();
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(json);
		}
		
	}
}