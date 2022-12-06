package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.User;
import service.UserService;

@WebServlet(name = "user.LoginSessionController", urlPatterns="/user/LoginSessionController")
public class LoginSessionController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login/loginForm.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("uid");
		String userPassword = request.getParameter("upassword");
		
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		User user = new User();
		
		user.setUserId(userId);
		user.setUserPassword(userPassword);
		
		String loginuser = userService.login(user);
		
		
		if(!(loginuser.equals(""))) {
			// 세션 객체 가져오기
			HttpSession session = request.getSession();
			
			// 세션에 데이터(객체)를 저장
			session.setAttribute("loginId", userId);
			session.setAttribute("loginPassword", userPassword);
			session.setAttribute("loginType", loginuser);
			
			response.sendRedirect("../main/MainController");
		} else {
			request.getRequestDispatcher("/WEB-INF/views/login/loginForm.jsp").forward(request, response);
		}
	}
}
