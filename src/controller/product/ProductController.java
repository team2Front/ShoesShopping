package controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Product;
import service.ProductService;

@WebServlet(name = "product.ProductController", urlPatterns = "/product/ProductController")
public class ProductController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int productId = Integer.parseInt(request.getParameter("productId"));
		int productId = 98;
		ProductService productService = (ProductService) request.getServletContext().getAttribute("productService");
		Product product = productService.showOneProduct(productId);
		
		request.setAttribute("product", product);
		
		request.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(request, response);
	}
}
