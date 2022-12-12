package controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dto.ProductImage;
import dto.RegisterProduct;
import service.ProductService;

//상품 등록 컨트롤러~
@WebServlet(name = "admin.Register_ProductController", urlPatterns="/admin/Register_ProductController")
@MultipartConfig(maxFileSize=1024*1024*10, maxRequestSize=1024*1024*20)
public class Register_ProductController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/register_product.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//ProductService
		ProductService productService = (ProductService) request.getServletContext().getAttribute("productService");
		
		//문자 파트~
		RegisterProduct product = new RegisterProduct();
		System.out.println(request.getParameter("pgender"));
		System.out.println(request.getParameter("pname"));
		System.out.println(request.getParameter("pbrand"));
		System.out.println(request.getParameter("pprice"));
		System.out.println(request.getParameter("pcategory"));
		System.out.println(request.getParameterValues("pcolor"));
		
		String productName = request.getParameter("pname");
		product.setProductName(request.getParameter("pname"));
		product.setProductPrice(Integer.parseInt(request.getParameter("pprice")));
		String pbrand = request.getParameter("pbrand");
		product.setCompany(Integer.parseInt(pbrand));
		product.setCategory(Integer.parseInt(request.getParameter("pcategory")));
		product.setGender(request.getParameter("pgender"));
		
		//리스트 파트~
		String[] sizeList = request.getParameterValues("psize");
		List<String> sizeArr = Arrays.asList(sizeList);
		List<Integer> sizeIntArr = new ArrayList<>();
		sizeArr.stream().forEach(a->{
			sizeIntArr.add(Integer.parseInt(a));
			System.out.println("[Register_ProductController]sizeList: "+ a);
		});
		product.setSizeList(sizeIntArr);
		
		String[] colorList = request.getParameterValues("pcolor");
		List<String> colorArr = Arrays.asList(colorList);
		List<Integer> colorIntArr = new ArrayList<>();
		colorArr.stream().forEach(a->{
			colorIntArr.add(Integer.parseInt(a));
			System.out.println("[Register_ProductController]colorList: "+ a);
		});
		product.setColorList(colorIntArr);
		
		//파일 파트~
		List<ProductImage> productImages = new ArrayList<>();
		//모든 파트를 가져온다
		Collection<Part> parts =request.getParts();
		
		//이미지를 DTO에 SET하는 코드
		int pid=0;
		for (Part filePart : parts) {
			//name이 attach인 경우에만 실행
           if(!filePart.getName().equals("attach")) continue;
           
           if(!filePart.getSubmittedFileName().equals("")) {
        	   String fileName = filePart.getSubmittedFileName(); //사용자가 업로드한 파일이름
        	   String savedName = new Date().getTime()+"-"+fileName; //내가 저장할 파일이름
        	   String fileType = filePart.getContentType(); //파일 타입
        	   
        	   ProductImage productImage = new ProductImage();
        	   productImage.setFileName(fileName);
        	   productImage.setSavedName(savedName);
        	   productImage.setFileType(fileType);
        	   
        	   productImages.add(productImage);
   			}
           product.setProductImage(productImages);
		}
		
		//**********상품등록하고 pid받는 코드***********
		pid = productService.registerProduct(product);
		System.out.println("[상품 등록 완료] pid: "+ pid);
		
		//이미지를 로컬에 저장하는 코드
		 for (Part filePart : parts) {
			 if(!filePart.getName().equals("attach")) continue;
			 if(!filePart.getSubmittedFileName().equals("")) {
				 String fileName = filePart.getSubmittedFileName();
				 String brandName="";
	        	   switch(pbrand) {
		        	   case "1" : brandName = "adidas"; break;
		        	   case "2" : brandName = "vans"; break;
		        	   case "3" : brandName = "converse"; break;
		        	   case "4" : brandName = "newbalance"; break;
		        	   case "5" : brandName = "nike"; break;
	        	   }
	        	   
	        	   //프로젝트 경로 맞춰서 해봅시다~~~~
	        	   String path = "C:/OTI/Project2_Images/";
	        	   String filePath = path+brandName+"/"+pid+"/"+fileName;
	        	   File dir = new File(filePath);
	        	 
	        	   //폴더가 없다면 생성한다
	        	   if(!dir.exists()) {
	        		   try {
	  	        		 Files.createDirectories(Paths.get(filePath));
	  	        	  	System.out.println("성공적으로 생성됨");
	  	        	  	filePart.write(filePath);
	  	        	 }catch(Exception e) {
	  	        		 System.out.println("생성 실패 "+filePath);
	  	        	 }
	        	   //아니라면
	        	   }else {
	        		   filePart.write(filePath);
	        		   System.out.println(filePath+"에 이미지를 넣었습니다.");
	        	   }
	        	   
			 }
         }
		 
		 
		response.sendRedirect("/shopping/main/MainController");
	}

}