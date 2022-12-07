package controller.cart;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import dto.CartDto;
import service.CartDetailService;
import service.CartService;


@WebServlet(name = "cart.DeleteController", urlPatterns = "/cart/DeleteController")
public class DeleteController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = (String) request.getSession().getAttribute("loginId");		
		int cartDetailId = Integer.parseInt(request.getParameter("cartDetailId"));
		
		System.out.println("!!!!!!!!!!!!        " + cartDetailId);
		CartDetailService cartDetailService = (CartDetailService) request.getServletContext().getAttribute("cartDetailService");
		cartDetailService.removeCartDetailOne(loginId, cartDetailId);
		
		response.sendRedirect("CartController");
	}

}
