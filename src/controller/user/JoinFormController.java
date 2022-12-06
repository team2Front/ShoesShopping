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
		request.setCharacterEncoding("UTF-8");
		
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		User user = new User();
		
		user.setUserName(request.getParameter("uname"));
		user.setUserId(request.getParameter("userid"));
		user.setUserPassword(request.getParameter("userpassword"));
		user.setPhoneNumber(request.getParameter("phone"));
		user.setUserEmail(request.getParameter("email"));
		user.setUserAddress(request.getParameter("addr1") + " " + request.getParameter("addr2"));
		System.out.println(user.getUserAddress());
		
		boolean idcheck = userService.idCheck(user.getUserId());
		System.out.println(idcheck);
		boolean phonenumbercheck = userService.pnCheck(user.getPhoneNumber());
		System.out.println(phonenumbercheck);
		
		int createuser = 0;
		String errorcode = "";
		if((!idcheck) && (!phonenumbercheck)) {
			userService.registerUser(user);
		} else if (idcheck) {
			createuser = 1;
			errorcode = "아이디가 중복되었습니다.";
		} else if (phonenumbercheck) {
			createuser = 1;
			errorcode = "핸드폰 번호가 중복되었습니다.";
		}
		request.setAttribute("user", user);
		
		if(createuser == 0) {
			response.sendRedirect("../main/MainController");
		} else {
			request.setAttribute("errorcode", errorcode);
			request.getRequestDispatcher("/WEB-INF/views/user/joinForm.jsp").forward(request, response);
		}
	}
}
