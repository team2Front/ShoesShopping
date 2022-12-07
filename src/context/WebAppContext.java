package context;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import dao.CartDao;
import dao.CartDetailDao;
import dao.CategoryDao;
import dao.ColorDao;
import dao.CompanyDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.PfilteringDao;
import dao.ProductAndColorDao;
import dao.ProductAndSizeDao;
import dao.ProductDao;
import dao.ProductImageDao;
import dao.QnaDao;
import dao.ReplyDao;
import dao.ReviewDao;
import dao.UserDao;
import service.CartDetailService;
import service.CartService;
import service.OrderService;
import service.OrdersDetailService;
import service.ProductAndColorService;
import service.ProductAndSizeService;
import service.ProductService;
import service.QnAService;
import service.ReplyService;
import service.ReviewService;
import service.UserService;

public class WebAppContext implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Web Application이 배치 완료 됨, ServletContext 가 생성 완료 됨");
		
		//Servlet Context 객체  얻기
		ServletContext application = sce.getServletContext();
		
		//ConnectionPool 객체 얻기
		DataSource dataSource = ConnectionProvider.getDataSource();
		application.setAttribute("dataSource", dataSource);
		
		// Servlet Context 객체에 데이터(객체) 저장하기 , 모든 쿨라이언트들이 사용 가능한 공유 객체가 된다.
		
		
		/*객체 순서: product -> cart -> user -> reply/review/qna -> order */
		
		//-------------------- Dao ------------------
		application.setAttribute("companyDao", new CompanyDao());
		application.setAttribute("categoryDao", new CategoryDao());
		application.setAttribute("pfilteringDao", new PfilteringDao());
		application.setAttribute("colorDao", new ColorDao());
		application.setAttribute("productAndColorDao",  new ProductAndColorDao(application));
		application.setAttribute("productAndSizeDao", new ProductAndSizeDao());
		application.setAttribute("productImageDao", new ProductImageDao());
		application.setAttribute("productDao", new ProductDao(application));
				
		
		application.setAttribute("cartDao", new CartDao());
		application.setAttribute("cartDetailDao", new CartDetailDao(application));
		
		application.setAttribute("userDao", new UserDao(application));
		
		application.setAttribute("orderDetailDao", new OrderDetailDao(application));
		application.setAttribute("orderDao", new OrderDao(application));
		
		application.setAttribute("qnaDao", new QnaDao(application));
		application.setAttribute("replyDao", new ReplyDao());

		application.setAttribute("reviewDao", new ReviewDao(application));
		
		
		//-------------------- 서비스 ------------------
		application.setAttribute("productAndColorService", new ProductAndColorService(application));
		application.setAttribute("productAndSizeService", new ProductAndSizeService(application));
		application.setAttribute("productService", new ProductService(application));
		
		application.setAttribute("cartService", new CartService(application));
		application.setAttribute("cartDetailService", new CartDetailService(application));
		
		application.setAttribute("userDao", new UserService(application));

		application.setAttribute("orderService", new OrderService(application));
		application.setAttribute("ordersDetailService", new OrdersDetailService(application));
		
		application.setAttribute("qnaService", new QnAService(application));
		application.setAttribute("reviewService", new ReviewService(application));
		application.setAttribute("replyService", new ReplyService(application));

	
	}
}
