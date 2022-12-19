package controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.OrderDto;
import service.CartDetailService;


@WebServlet(name = "cart.addCartController", urlPatterns = "/cart/addCartController")
public class addCartController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("add cart ~");
		System.out.println(request.getParameter("color"));
		System.out.println(request.getParameter("size"));
		System.out.println(request.getParameter("productId"));
		System.out.println(request.getParameter("quantity"));
		
		int color = Integer.parseInt((String)request.getParameter("color"));
		int size = Integer.parseInt((String)request.getParameter("size"));
		int productId = Integer.parseInt((String)request.getParameter("productId"));
		int quantity = Integer.parseInt((String)request.getParameter("quantity"));
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("loginId");
		
		OrderDto orderDto = new OrderDto(loginId,productId, color, size, quantity); 
		CartDetailService cartDetailService = (CartDetailService) request.getServletContext().getAttribute("cartDetailService");
		String s = cartDetailService.addCartDetail(orderDto);
		System.out.println(s);
		//		String userId = (String) request.getAttribute("loginId");
//		String userId = "winter";
//		int cartDetailId = Integer.parseInt(request.getParameter("cartDetailId"));
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//				
//		CartDetailService cartDetailService = (CartDetailService) request.getServletContext().getAttribute("cartDetailService");
//		String test = cartDetailService.updateCartDetailQuantity(userId, cartDetailId, quantity);
//		System.out.println(test);
//		response.sendRedirect("CartController");
	}

}
