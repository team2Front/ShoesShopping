package controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Orders;
import service.OrderService;
import util.PagingVo;


@WebServlet(name = "mypage.MyOrderController", urlPatterns = "/mypage/MyOrderController")
public class MyOrderController extends HttpServlet {

//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_myOrder.jsp").forward(request,response);
//	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = (String) request.getSession().getAttribute("loginId");
		
		// PageNo 얻기
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo == null) {
			strPageNo = "1";
		}
		int pageNo = Integer.parseInt(strPageNo);
		
		// OrderService 객체 얻기
		ServletContext application = request.getServletContext();
		OrderService orderService = (OrderService) application.getAttribute("orderService");
		
		// 페이징 대상이 되는 전체 행수 얻기
		int totalOrderNum = orderService.countAll(loginId);
		
		// Pager 생성
		PagingVo pagingVo = new PagingVo(totalOrderNum, pageNo);
		
		// 해당 PageNo에 해당하는 게시물 가져오기
		List<Orders> orderList = orderService.myshowOrders(loginId, pagingVo);
		
		
		
		System.out.println(orderList);
		
		request.setAttribute("pager", pagingVo);
		request.setAttribute("orderList", orderList);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_myOrder.jsp").forward(request, response);
		
	}

}
