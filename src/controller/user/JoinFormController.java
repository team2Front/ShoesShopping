package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserService;

@WebServlet(name = "user.JoinFormController", urlPatterns="/user/JoinFormController")
public class JoinFormController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/joinForm.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		User user = new User();
		
		user.setUserName(request.getParameter("uname"));
		user.setUserId(request.getParameter("userid"));
		user.setUserPassword(request.getParameter("userpassword"));
		user.setPhoneNumber(request.getParameter("phone"));
		user.setUserEmail(request.getParameter("email"));
		user.setUserAddress(request.getParameter("addr1") + " " + request.getParameter("adrr2"));
		
		boolean idcheck = userService.idCheck(user.getUserId());
		System.out.println(idcheck);
		boolean passwordcheck = userService.pnCheck(user.getUserPassword());
		System.out.println(passwordcheck);
		
		
		response.sendRedirect("/WEB-INF/views/user/JoinFormController");
	}
}
