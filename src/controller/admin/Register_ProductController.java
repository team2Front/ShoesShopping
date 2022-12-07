package controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;

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
        	   
        	   /*String filePath = "shopping/resources/images/"+pbrand+"/"+savedName;*/
        	   String filePath = "C:Temp/download/"+savedName;
        	   System.out.println(filePath);
        	   
        	   filePart.write(filePath);
        	   
   			}
           product.setProductImage(productImages);
		}

		String message=productService.registerProduct(product);
		System.out.println(message);
		
		response.sendRedirect("/WEB-INF/views/admin/register_product.jsp");
	}

}