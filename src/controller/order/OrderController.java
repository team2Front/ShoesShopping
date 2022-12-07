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

import org.json.JSONArray;

import domain.CartDetail;
import service.CartDetailService;
import service.OrdersDetailService;

// 장바구니 -> 주문할 때
@WebServlet(name = "order.OrderController", urlPatterns = "/order/OrderController")
public class OrderController extends HttpServlet {
       
	// 장바구니->주문으로 넘어가는 컨트롤러
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String arrDid = request.getParameter("arrDid");
		//선택된 cartDetail ID가 담긴 배열
		JSONArray cartDetailIdArr = new JSONArray(arrDid);			
		List<Object> orderDetailList = new ArrayList<>();
		
		for(Object cdId : cartDetailIdArr) { 
			orderDetailList.add(cdId);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("orderDetailList", orderDetailList);
		request.getRequestDispatcher("/WEB-INF/views/order/orderForm.jsp").forward(request, response);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession();
		List<Object> orderDetailList = (List<Object>) session.getAttribute("orderDetailList");		
		
		CartDetailService cartDetailService = (CartDetailService) request.getServletContext().getAttribute("cartDetailService");
		
		List<CartDetail> list = new ArrayList<>();
		
		int totalPrice = 0;
		int totalQuantity = 0;
		for(Object cdId : orderDetailList) { 
			totalQuantity++;
			CartDetail cd = cartDetailService.getCartDetail(Integer.parseInt((String) cdId));
			totalPrice += cd.getQuantity() * cd.getProduct().getProductPrice();
			
			list.add(cd);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("totalQuantity", totalQuantity);
		request.setAttribute("totalPrice", totalPrice);
//		OrdersDetailService ordersDetailService = (OrdersDetailService) request.getServletContext().getAttribute("ordersDetailService");
//		ordersDetailService.addCartDetailsToOrder((String) session.getAttribute("loginId"), orderDetailList);
		
		
		request.getRequestDispatcher("/WEB-INF/views/order/orderForm.jsp").forward(request, response);
		
	}
	
}
