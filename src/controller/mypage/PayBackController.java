package controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.OrderService;


@WebServlet(name = "mypage.PayBackController", urlPatterns = "/mypage/PayBackController")
public class PayBackController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		
		OrderService orderService = (OrderService) request.getServletContext().getAttribute("orderService");
		
		orderService.cancelOrders(ordersId);
		
		response.sendRedirect("../mypage/MyOrderController");
	}

}
