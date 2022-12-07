package controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;
import org.json.JSONArray;

import domain.CartDetail;
import service.CartDetailService;
import service.OrdersDetailService;

// 주문 완료 컨트롤러
@WebServlet(name = "order.OrderConfirmController", urlPatterns = "/order/OrderConfirmController")
public class OrderConfirmController extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		HttpSession session = request.getSession();
		List<Object> orderDetailList = (List<Object>) session.getAttribute("orderDetailList");
		session.removeAttribute("orderDetailList");
		System.out.println(orderDetailList);
		
		OrdersDetailService ordersDetailService = (OrdersDetailService) request.getServletContext().getAttribute("ordersDetailService");
//		ordersDetailService.addCartDetailsToOrder((String) session.getAttribute("loginId"), orderDetailList);
		ordersDetailService.addCartDetailsToOrder("winter", orderDetailList);
		
//		response.sendRedirect("/mypage/MyOrderController");
		
		
		
		
	}	
}
