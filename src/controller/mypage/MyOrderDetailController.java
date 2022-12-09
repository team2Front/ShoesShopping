package controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.OrderDetailDto;
import service.OrdersDetailService;


@WebServlet(name = "mypage.MyOrderDetailController", urlPatterns = "/mypage/MyOrderDetailController")
public class MyOrderDetailController extends HttpServlet {

//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_myOrder.jsp").forward(request,response);
//	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		System.out.println(orderId);
		OrdersDetailService ordersDetailService = (OrdersDetailService) request.getServletContext().getAttribute("ordersDetailService");
		
		List<OrderDetailDto> orderDetailList = ordersDetailService.orderDetailList(orderId);
		
		request.setAttribute("orderDetailList", orderDetailList);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_myOrderDetail.jsp").forward(request, response);
	}
	
}
