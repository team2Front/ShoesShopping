package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.PfilteringDao;
import dao.ProductAndColorDao;
import dao.ProductAndSizeDao;
import dao.ProductDao;
import domain.Product;
import dto.ProductList;
import dto.RegisterProduct;
import util.PagingVo;

public class ProductService {
	private ServletContext application;
	private DataSource ds;
	private ProductDao productDao;
	private PfilteringDao pfilteringDao;
	private ProductAndColorDao productAndColorDao;
	private ProductAndSizeDao productAndSizeDao;
	
	public ProductService(ServletContext application) {
		this.application = application;
		ds = (DataSource) application.getAttribute("dataSource");
		this.productDao = (ProductDao) application.getAttribute("productDao");
		this.pfilteringDao = (PfilteringDao) application.getAttribute("pfilteringDao");
		this.productAndColorDao = (ProductAndColorDao) application.getAttribute("productAndColorDao");
		this.productAndSizeDao = (ProductAndSizeDao) application.getAttribute("productAndSizeDao");
	}

	// 필터링 x
	// 상품 총수량
	public int countAllProducts() {
		System.out.println("[서비스] 카운트 올");
		Connection conn = null;
		int total = 0;
		try {
			conn = ds.getConnection();
			total = productDao.selectCountAll(conn);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return total;
	}

	// 상품 간단히 보기
	public List<ProductList> showProducts(PagingVo pvo) { 
		// List<ProductList>
		Connection conn = null;
		List<ProductList> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			list = productDao.selectProductList(conn, pvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return list;
	}

	// 필터링 o
	// 1) 카테고리 기준
	// 고른 카테고리 총 수량
	public int countCategory(int category) {
		Connection conn = null;
		int total = 0;
		try {
			conn = ds.getConnection();
			total = pfilteringDao.selectCountCategory(conn, category);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return total;
	}

	// 고른 카테고리 상품 간단히 보기
	public List<ProductList> showCategory(PagingVo pvo, int cate) {
		Connection conn = null;
		List<ProductList> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			list = pfilteringDao.selectShowCategory(conn, pvo, cate);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return list;
	}

	// 2) 회사 기준
	// 고른 회사 총 수량
	public int countCompany(int company) {
		Connection conn = null;
		int total = 0;
		try {
			conn = ds.getConnection();
			total = pfilteringDao.selectCountCompany(conn, company);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return total;
	}

	// 고른 회사 상품 간단히 보기
	public List<ProductList> showCompany(PagingVo pvo, int company) {
		Connection conn = null;
		List<ProductList> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			list = pfilteringDao.selectShowCompany(conn, pvo, company);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return list;
	}

	// 3) 성별 기준
	public int countSex(String sex) {
		Connection conn = null;
		int countsex = 0;
		try {
			conn = ds.getConnection();
			countsex = pfilteringDao.selectCountSex(conn, sex);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return countsex;
	}

	public List<ProductList> showSex(PagingVo pvo, String sex) {
		Connection conn = null;
		List<ProductList> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			list = pfilteringDao.selectShowSex(conn, pvo, sex);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return list;
	}

	// 4) 가격 기준
	public List<ProductList> showprice(PagingVo pvo, String price) {
		Connection conn = null;
		List<ProductList> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			list = pfilteringDao.selectShowPrice(conn, pvo, price);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return list;
	}

	// **********************************************************
	// 상품 상세보기
	public Product showOneProduct(int pid){
		Connection conn = null;
		Product product = null;
		try {
			conn = ds.getConnection();
			product = productDao.selectProductOne(conn, pid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return product;
	}

	// 관리자 버전
	// 상품 등록하기
	//트랜잭션 처리
	public String registerProduct(RegisterProduct ap) {
		Connection conn = null;
		int pid;
		String message = "";
		try {
			conn = ds.getConnection();
			// 자동 커밋 기능 끔
			conn.setAutoCommit(false);
			// 1) 상품 테이블 먼저 채우고 -> pid 리턴하기
			pid = productDao.insertProduct(conn, ap);
			System.out.println("pid" + pid);
			// 2) 객체에 담긴 컬러와 사이즈 리스트
			List<Integer> colorList = ap.getColorList();
			List<Integer> sizeList = ap.getSizeList();

			// 3)트랜잭션 검사
			productDao.selectCheckColor(conn, colorList);
			productDao.selectCheckSize(conn, sizeList);

			conn.commit();

			// 트랜잭션 통과되면 컬러 테이블 채우기 -> 사이즈 테이블 채우기
			int result1 = productAndColorDao.insertProductColors(conn, pid, colorList);

			int result2 = productAndSizeDao.insertProductSizes(conn, pid, sizeList);

			if (result1 + result2 != 2) {
				message = "상품 등록이 실패하였습니다";
			}

			// conn.commit();
			message = "상품 등록이 완료되었습니다.";

		} catch (RuntimeException | SQLException e) {
			try {
				System.out.println(e.getMessage());
				message = "상품 등록 실패되었습니다.";
				conn.rollback();
			} catch (SQLException e1) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (Exception e) {
			}
		}
		return message;

	}

	// 상품 삭제(관리자)
	// method: 상품 삭제(Only 관리자)
	public String deleteProduct(int num) {
		Connection conn = null;
		String result = "";
		try {
			conn = ds.getConnection();
			if (productDao.deleteProduct(conn, num)) {
				result = "상품이 삭제되었습니다.";
			} else {
				result = "상품 삭제에 실패했습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		
		return result;
	}
}
