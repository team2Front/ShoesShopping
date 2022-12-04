package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CategoryDao {
	
	public String findCategoty(Connection conn, int categoryId) throws Exception {
		String sql = "select category_kind from category where category_id=?";
		String category = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, categoryId);

		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			category = rs.getString("category_kind");
			conn.close();
		} else {
			category = "없음";
		}
		pstmt.close();
		
		return category;
	}
}
