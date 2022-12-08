package controller.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.OrderDto;
import service.CartDetailService;
import service.OrdersDetailService;

// 장바구니 -> 주문할 때
@WebServlet(name = "order.DirectOrderController", urlPatterns = "/order/DirectOrderController")
public class DirectOrderController extends HttpServlet {
       
	// 상품상세->주문으로 넘어가는 컨트롤러
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

		
		OrdersDetailService ordersDetailService = (OrdersDetailService) request.getServletContext().getAttribute("ordersDetailService");
		
		OrderDto orderDto = new OrderDto(loginId,productId, color, size, quantity); 
		
		ordersDetailService.addProductToOrder(orderDto);
		
	}
	

	
}
