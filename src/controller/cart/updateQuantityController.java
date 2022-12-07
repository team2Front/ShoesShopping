package controller.cart;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CartDto;
import service.CartDetailService;
import service.CartService;


@WebServlet(name = "cart.updateQuantityController", urlPatterns = "/cart/updateQuantityController")
public class updateQuantityController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userId = (String) request.getAttribute("loginId");
		String userId = "winter";
		int cartDetailId = Integer.parseInt(request.getParameter("cartDetailId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
				
		CartDetailService cartDetailService = (CartDetailService) request.getServletContext().getAttribute("cartDetailService");
		String test = cartDetailService.updateCartDetailQuantity(userId, cartDetailId, quantity);
		System.out.println(test);
		response.sendRedirect("CartController");
	}

}
