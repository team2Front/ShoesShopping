package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "user.LogoutSessionController", urlPatterns="/user/LogoutSessionController")
public class LogoutSessionController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// 세션에 저장된 데이터(객체)를 제거
		session.removeAttribute("loginId");
		session.removeAttribute("loginPassword");
		session.removeAttribute("loginType");
		
		response.sendRedirect("../main/MainController");
	}
}
