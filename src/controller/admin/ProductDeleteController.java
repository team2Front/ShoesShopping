package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductService;

@WebServlet(name="admin.ProductDeleteController", urlPatterns="/admin/ProductDeleteController")
public class ProductDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		ProductService productservice = (ProductService) request.getServletContext().getAttribute("productService");
		
		productservice.deleteProduct(productId);
		
		response.sendRedirect("../main/MainController");
	}
	
}
