package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import domain.Color;

public class ColorDao {	
	// 색상 번호로 색상을 찾고 객체로 반환
	public Color selectColor(Connection conn, int colorId) throws Exception {
		String sql = "select color_id, color_name from color where color_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,  colorId);
		
		ResultSet rs = pstmt.executeQuery();
		
		Color cl = null;
		while(rs.next()) {
			cl = new Color(rs.getInt("color_id"), rs.getString("color_name"));

	    }
		pstmt.close();
		
		return cl;
	}
}
