package controller.mypage;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import domain.User;
import service.UserService;


@WebServlet(name = "mypage.MainController", urlPatterns ="/mypage/MainController")
@MultipartConfig(maxFileSize=1024*1024*10, maxRequestSize=1024*1024*20)
public class MainController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		User user = userService.userInfo(userId);
		
		request.setAttribute("user", user);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_main.jsp").forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		String userId = (String) request.getSession().getAttribute("loginId");
		
		User user = new User();
		
		// 문자 파트
		user.setUserPassword(request.getParameter("userpassword"));
		user.setUserName(request.getParameter("uname"));
		user.setUserAddress(request.getParameter("addr1") + " " + request.getParameter("addr2"));
		user.setPhoneNumber(request.getParameter("phone"));
		user.setUserId(userId);
		
		boolean phonenumbercheck = userService.pnCheck(user.getPhoneNumber());
		
		int updateuser = 0;
		String errorcode = "";
		
		// 파일 파트
		Part filePart = request.getPart("userattach");
		if(!filePart.getSubmittedFileName().equals("")) {
			String fileName = filePart.getSubmittedFileName();
			String savedName = fileName;
			String fileType = filePart.getContentType();
			
			user.setFilename(fileName);
			user.setSavedname(savedName);
			user.setFiletype(fileType);
			
			String filePath = "C:/OTI/Project2_Images/user/" + userId + "/" + savedName;
			File dir = new File(filePath);
			
			// 폴더가 없다면 생성
			if(!dir.exists()) {
				try {
					Files.createDirectories(Paths.get(filePath));
					System.out.println("성공적으로 실행");
					filePart.write(filePath);
				} catch (Exception e) {
					System.out.println("생성 실패" + filePath);
				}
			} else {
				filePart.write(filePath);
				System.out.println(filePath+"에 이미지를 넣었습니다.");
			}
		}
		
		if(!phonenumbercheck) {
			int a = userService.editUserInfo(user);
			System.out.println(a);
		} else {
			updateuser = 1;
			errorcode = "핸드폰 번호가 중복되었습니다.";
		}
		request.setAttribute("user", user);
		
		if(updateuser == 0) {
			response.sendRedirect("../mypage/MainController?userId="+userId);
		} else {
			request.setAttribute("errorcode", errorcode);
			request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_main.jsp").forward(request, response);
		}
	}

}

