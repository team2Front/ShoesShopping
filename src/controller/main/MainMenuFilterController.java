package controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProductList;
import service.ProductService;
import util.PagingVo;


@WebServlet(name = "main.MainMenuFilterController", urlPatterns = "/main/MainMenuFilterController")
public class MainMenuFilterController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pageNo 얻기
		String strPageNo = request.getParameter("pageNo");
		if(strPageNo == null) {
			strPageNo="1";
		}
		int company_id = Integer.parseInt(request.getParameter("company_id"));
		String product_sex = request.getParameter("product_sex");
			
		int countCompany =0;
		PagingVo pager = null;
		int pageNo = Integer.parseInt(strPageNo);
		List<ProductList> pageList = null;
		
		//Productservice 객체 얻기
		ServletContext application = request.getServletContext();
		ProductService productService = (ProductService) application.getAttribute("productService");
		//페이징 대상이 되는 전체 행 수 얻기
		
		countCompany = productService.countCompanyCatogory(company_id,product_sex);
		
		//Pager 생성
		pager = new PagingVo(countCompany, pageNo, 15);
		
		//해당 pageNo에 해당하는 게시물 가져오기
		try {
		 pageList = productService.showCompanyCategory(pager, company_id,product_sex);
		}catch(Exception e) {
			
		}
		System.out.println(pageList);
		//jsp에서 사용할 수 있도록 request 범위에 저장
		request.setAttribute("pager", pager);
		request.setAttribute("pageList", pageList);
		
		request.getRequestDispatcher("/WEB-INF/views/main/home.jsp").forward(request, response);
	}

}
