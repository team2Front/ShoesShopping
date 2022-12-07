package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductImageDao {
	
	public String selectMainImage(Connection conn, int productId) throws Exception {
		String sql = "select product_id, filename, filetype, savedname, mainimage from product_image where mainimage = '1' and product_id = ? ";
		String mainImage = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			mainImage = rs.getString("filename");
		}
		pstmt.close();
		
		return mainImage;
	}
	
	public List<String> selectSubImage(Connection conn, int productId) throws Exception {
		List<String> list = new ArrayList<>();
		String sql = "select product_id, filename, filetype, savedname, mainimage from product_image where mainimage = '0' and product_id = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String subImage = rs.getString("filename");
			list.add(subImage);
		}
		
		if(list.size()<5) {
			for(int i=list.size()+1; i<=5; i++) {
				String p = "이미지준비중.jpg";
				list.add(p);
			}
		}
		
		System.out.println("[productImageDao]"+list);
		pstmt.close();
		
		return list;
	}

}
