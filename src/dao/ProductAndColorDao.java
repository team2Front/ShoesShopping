package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import domain.Color;

public class ProductAndColorDao {	
	ColorDao colorDao;

	public ProductAndColorDao(ServletContext application) {
		this.colorDao = (ColorDao) application.getAttribute("colorDao");
	}

	// 상품 id ,그 상품의 사이즈들을 리스트로 받아와서 각각 Product_size 테이블에 삽입한다.
	public int insertProductColors(Connection conn, int pid, List<Integer> colorList) throws Exception {
		System.out.println("[ProductAndColorDao > insert] 메소드 실행 colorList: "+ colorList);
		PreparedStatement pstmt = null;
		int row = 0;

		for (int colorId : colorList) {
			String sql = "insert into product_color (product_id, color_id) values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, colorId);
			row= pstmt.executeUpdate();
		}
		pstmt.close();
		return row;
	}

	// 해당상품의 전체 색상 리스트 리턴
	public List<Color> selectProductColors(Connection conn, int productId) throws Exception {
		String sql = "select color_id from product_color where product_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);

		ResultSet rs = pstmt.executeQuery();
		List<Color> colors = new ArrayList<>();
		while (rs.next()) {
			int cid = rs.getInt("color_id");
			colors.add(colorDao.selectColor(conn, cid));
		}
		pstmt.close();
		
		return colors;

	}
	
	// 해당 상품의 해당 색상 유효한지 체크
	public boolean selectProductColor(Connection conn, int productId, int colorId) throws Exception {
		String sql = "select color_id from product_color where product_id=? and color_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);
		pstmt.setInt(2, colorId);
		
		boolean result = false;

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			result = true;
		}
		
		else throw new RuntimeException();
		
		return result;

	}

}
