package service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import dao.ProductAndColorDao;
import domain.Color;

public class ProductAndColorService {
	private ServletContext application;
	private DataSource ds;
	private ProductAndColorDao productAndColorDao;
	
	public ProductAndColorService(ServletContext application) {
		this.application = application;
		this.productAndColorDao = (ProductAndColorDao) application.getAttribute("productAndColorDao");
		ds = (DataSource) application.getAttribute("dataSource");
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
		Connection conn = null;
		boolean result = false;
		
		try {
			conn = ds.getConnection();
			result = productAndColorDao.selectProductColor(conn, productId, colorId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { conn.close(); } catch (Exception e) {}
		}

		return result;
	}
}
