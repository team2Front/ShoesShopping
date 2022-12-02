package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionProvider;

public class CompanyDao {
	//아이디를 이름으로 리턴
	public String selectFindCompany(int companyId) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "select company_name from company where company_id=?";
		String cname="";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, companyId);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cname =  rs.getString("company_name");
				conn.close();
		
			}else cname = "없";
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			pstmt.close();
			conn.close();
		}
		return cname;
	}

}
