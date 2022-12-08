package controller.product;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProductImage;
import service.ProductService;


@WebServlet(name = "product.ProductImageController", urlPatterns ="/product/ProductImageController")
public class ProductImageController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		System.out.println("[productImageController > doGet] productId: "+productId);
		/*
		ProductService productService = (ProductService) request.getServletContext().getAttribute("productService");
		List<ProductImage> pImgList = productService.showSubImage(productId);
		
		String fileName = productImage.getFileName();
		String companyName = productImage.getCompanyName();
		String filePath = "C:/OTI/Project2_Images/" + companyName+"/"+productId+"/"+fileName;
		String contentType = productImage.getFileType();
		System.out.println("[MainImageController]filePath: "+filePath);
		// HTTP 응답에 Content-Type 헤더를 추가
		response.setContentType(contentType);
		
		//이미지가 존재하지 않는다면 경로를 '이미지 준비중'으로 변경
		File file = new File(filePath);
		if(!file.exists()) {
			filePath = "C:/OTI/Project2_Images/이미지준비중.jpg";
		}
		
		// Browser의 종류 얻기
		String userAgent = request.getHeader("User-Agent");
		if (userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			// IE일 경우
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			// Chrome, Edge, FireFox, Safari일 경우
			fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		request.setAttribute("productImage", productImage);

		// HTTP 응답 본문에 파일 데이터 출력하기
		ServletOutputStream sos = response.getOutputStream();
		Path path = Paths.get(filePath);
		Files.copy(path, sos);
		sos.flush();
		sos.close();
		*/
	}

}

