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
		//UserService 객체 생성
		UserService boardService = (UserService) request.getServletContext().getAttribute("userService");
		
		//UserDTO
		User user = new User();
		user.setUserId(request.getParameter("adminId"));
		user.setUserPassword(request.getParameter("adminPw"));
		user.setUserName(request.getParameter("adminName"));
		/*board.setBtitle(request.getParameter("btitle"));
		board.setBcontent(request.getParameter("bcontent"));
		board.setBwriter(request.getParameter("bwriter"));
		
		
		boardService.write2(board);
		
		response.sendRedirect("ContentController");*/
		
		
		request.getRequestDispatcher("/WEB-INF/views/admin/register_newAdmin.jsp").forward(request, response);
	}

}