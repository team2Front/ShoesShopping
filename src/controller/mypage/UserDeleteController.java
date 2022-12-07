package controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;


@WebServlet(name = "mypage.UserDeleteController", urlPatterns = "/mypage/UserDeleteController")
public class UserDeleteController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPw");
		
		UserService userservice = (UserService) request.getServletContext().getAttribute("userService");
		
		boolean result = userservice.pwCheck(userId, userPassword);
		
		if(result) {
			userservice.removeUserInfo(userId);
			session.removeAttribute("loginId");
			session.removeAttribute("loginPassword");
			session.removeAttribute("loginType");
			response.sendRedirect("../main/MainController");
		} else {
			request.getRequestDispatcher("/WEB-INF/views/user/mypage_withdraw.jsp").forward(request, response);
		}
	}
}
