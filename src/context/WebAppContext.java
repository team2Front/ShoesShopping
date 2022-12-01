package context;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import dao.OrderDao;
import dao.OrderDetailDao;
import service.OrderService;

public class WebAppContext implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Web Application이 배치 완료 됨, ServletContext 가 생성 완료 됨");
		
		//Servlet Context 객체  얻기
		ServletContext application = sce.getServletContext();
		
		// Servlet Context 객체에 데이터(객체) 저장하기 , 모든 쿨라이언트들이 사용 가능한 공유 객체가 된다.
		
		//-------------------- Dao ------------------
		application.setAttribute("orderDetailDao", new OrderDetailDao(application));
		application.setAttribute("orderDao", new OrderDao(application));
		
		
		//-------------------- 서비스 ------------------
		application.setAttribute("orderDetailService", new OrderDetailService(application));
		application.setAttribute("orderService", new OrderService(application));
		
		
	
	}
}
