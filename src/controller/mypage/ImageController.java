package controller.mypage;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserService;


@WebServlet(name = "mypage.ImageController", urlPatterns ="/mypage/ImageController")
@MultipartConfig(maxFileSize=1024*1024*10, maxRequestSize=1024*1024*20)
public class ImageController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		UserService userService = (UserService) request.getServletContext().getAttribute("userService");
		
		User user = userService.userInfo(userId);
		
		request.setAttribute("user", user);
		
		String fileName = user.getFilename();
		String filePath = "C:/Temp/download/" + user.getSavedname();
		String contentType = user.getFiletype();
		
		// HTTP 응답에 Content-Type 헤더를 추가
		response.setContentType(contentType);

		// Browser의 종류 얻기
		String userAgent = request.getHeader("User-Agent");
		if (userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			// IE일 경우
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			// Chrome, Edge, FireFox, Safari일 경우
			fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}

		// HTTP 응답 본문에 파일 데이터 출력하기
		ServletOutputStream sos = response.getOutputStream();
		Path path = Paths.get(filePath);
		Files.copy(path, sos);
		sos.flush();
		sos.close();
		
	}

}

