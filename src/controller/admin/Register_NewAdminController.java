package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserService;

@WebServlet(name = "admin.Register_NewAdminController", urlPatterns="/admin/Register_NewAdminController")
public class Register_NewAdminController extends HttpServlet {
	//클라이언트가 요청할때 마다 실행
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/register_newAdmin.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		User user = new User();
		
		user.setUserName(request.getParameter("adminName"));
		user.setUserId(request.getParameter("adminId"));
		user.setUserPassword(request.getParameter("adminPw"));
		user.setPhoneNumber(request.getParameter("adminPhone"));
		user.setUserEmail(request.getParameter("adminEmail"));
		user.setUserAddress(request.getParameter("addr1") + " " + request.getParameter("addr2"));
		user.setUserType("ADMIN");
		
		boolean idcheck = userService.idCheck(user.getUserId());
		boolean phonenumbercheck = userService.pnCheck(user.getPhoneNumber());
		
		int createuser = 0;
		String errorcode = "";
		if((!idcheck) && (!phonenumbercheck)) {
			userService.registerAdmin(user);
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
			request.getRequestDispatcher("/WEB-INF/views/admin/register_newAdmin.jsp").forward(request, response);
		}
	}
}