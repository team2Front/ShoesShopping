package controller.cart;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CartDto;
import service.CartService;


@WebServlet(name = "cart.CartController", urlPatterns = "/cart/CartController")
public class CartController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext appication = request.getServletContext();
		CartService cartService = (CartService) appication.getAttribute("cartService");
		CartDto cartDto = cartService.showCart("winter");
		int rows = cartDto.getCartDetailDtoList().size();
				
		request.setAttribute("cart", cartDto);
		request.setAttribute("rows", rows);
		request.getRequestDispatcher("/WEB-INF/views/cart/cartDetail.jsp").forward(request, response);
	}



}
