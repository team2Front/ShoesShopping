package service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.ProductAndSizeDao;

public class ProductAndSizeService {
	private ProductAndSizeDao productAndSizeDao;
	private DataSource ds;
	
	public ProductAndSizeService(ServletContext application) {
		this.productAndSizeDao = (ProductAndSizeDao) application.getAttribute("productAndSizeDao");
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	public void addProductSizes(int pid, List<Integer> sizeList) {
		// 상품 id ,그 상품의 사이즈들을 리스트로 받아와서 각각 Product_size 테이블에 삽입한다.
		Connection conn = null;
		try {
			conn = ds.getConnection();
			productAndSizeDao.insertProductSizes(conn, pid, sizeList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
	}
	
	// 해당상품의 전체 사이즈  리스트 리턴 
	public List<Integer> findProductSizeList(int productId) {
		Connection conn = null;
		List<Integer> list = new ArrayList<>();
		try {
			conn = ds.getConnection();
			list = productAndSizeDao.selectProductSizes(conn, productId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch(Exception e) {}
		}
		
		return list;
    }

	// 유저가 선택한 색상이 상품에 있는지 확인
	public boolean checkSize(int productId, int size) {
		List<Integer> list = findProductSizeList(productId);

		boolean result = false;
		for (int s : list) {
			if (s == size) {
				result = true;
				break;
			}
		}
		return result;
	}
}
