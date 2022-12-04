package service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.ProductAndColorDao;
import domain.Color;

public class ProductAndColorService {
	private DataSource ds;
	private ProductAndColorDao productAndColorDao;
	
	public ProductAndColorService(ServletContext application) {
		this.productAndColorDao = (ProductAndColorDao) application.getAttribute("productAndColorDao");
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addProductColors(int pid, List<Integer> colorList) {
		Connection conn = null;
		try {
			conn = ds.getConnection();
			productAndColorDao.insertProductColors(conn, pid, colorList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch(Exception e) {}
		}
	}

	// 해당상품의 전체 색상 리스트 리턴
	public List<Color> findProductColors(int productId) {
		Connection conn = null;
		List<Color> colorList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			colorList = productAndColorDao.selectProductColors(conn, productId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}
		return colorList;

	}
	
	// 유저가 선택한 색상이 상품에 있는지 확인
	public boolean checkColor(int productId, int colorId) {

		List<Color> list = findProductColors(productId);

		boolean result = false;
		for (Color c : list) {
			if (c.getColor_id() == colorId) {
				result = true;
				break;
			}
		}

		return result;
	}
}
