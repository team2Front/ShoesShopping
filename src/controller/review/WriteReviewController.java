package controller.review;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import domain.Product;
import domain.Review;
import service.ReviewService;

@WebServlet(name = "review.WriteReviewController", urlPatterns="/review/WriteReviewController")
@MultipartConfig(maxFileSize=1024*1024*10, maxRequestSize=1024*1024*20)
public class WriteReviewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*//review 100개 생성하기
		ReviewService reviewService = (ReviewService) request.getServletContext().getAttribute("reviewService");
		for(int i=0; i<100; i++) {
			Review review = new Review();
			Product product = new Product();
			
			review.setReviewTitle("리뷰제목" + i);
			review.setReviewContent("리뷰내용" + i);
			review.setReviewDate(new Date());
			review.setUserId("song");
			review.setStarScore(5);
			reviewService.writeReview(review);
			//boardService.write2(board);
		}*/
		
		request.getRequestDispatcher("/WEB-INF/views/review/write_review.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ReviewService 객체 가져오기
		ReviewService reviewService = (ReviewService) request.getServletContext().getAttribute("ReviewService");
		
		//문자파트
		Review review = new Review();
		review.setReviewTitle(request.getParameter("reviewTitle"));
		
		//파일 파트
		Part filePart = request.getPart("rattach");
		if(!filePart.getSubmittedFileName().equals("")) {
			String fileName = filePart.getSubmittedFileName();
			String savedName = new Date().getTime() + "-" + fileName;
			String fileType = filePart.getContentType();
			
			review.setRfileName(fileName); //첨부된 파일이름을 저장
			review.setRsavedName(savedName);
			review.setRfileType(fileType);
			
			String filePath = "C:/Temp/download/" + savedName;
			filePart.write(filePath);
		}
		
		reviewService.writeReview(review);
		
		response.sendRedirect("ContentController");
	
	}
}
