package controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import domain.Product;
import domain.Review;
import service.ProductService;
import service.ReviewService;

@WebServlet(name = "review.WriteReviewController", urlPatterns="/review/WriteReviewController")
@MultipartConfig(maxFileSize=1024*1024*10, maxRequestSize=1024*1024*20)
public class WriteReviewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		ProductService productService = (ProductService) request.getServletContext().getAttribute("productService");
		
		Product product = productService.showOneProduct(productId);
		
		request.setAttribute("product", product);
		
		request.getRequestDispatcher("/WEB-INF/views/review/write_review.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ReviewService 객체 가져오기
		ReviewService reviewService = (ReviewService) request.getServletContext().getAttribute("reviewService");
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		String user_id = (String) request.getSession().getAttribute("loginId");
		
		// 문자파트
		Review review = new Review();
		review.setReviewTitle(request.getParameter("reviewTitle"));
		review.setReviewContent(request.getParameter("reviewContent"));
		review.setUserId(user_id);
		review.setStarScore(Integer.parseInt(request.getParameter("star")));
		
		// 파일 파트
		Part filePart = request.getPart("reviewattach");
		if(!filePart.getSubmittedFileName().equals("")) {
			String fileName = filePart.getSubmittedFileName();
			String savedName = fileName;
			String fileType = filePart.getContentType();
			
			review.setRfileName(fileName);
			review.setRsavedName(savedName);
			review.setRfileType(fileType);
			
			String filePath = "C:/OTI/Project2_Images/review/" + savedName;
			
			filePart.write(filePath);
			
			reviewService.writeReview(review, productId);
		}
		
		response.sendRedirect("../mypage/MyReviewController");
	}
}
