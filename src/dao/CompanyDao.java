package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyDao {
	//아이디를 이름으로 리턴
	public String selectFindCompany(Connection conn, int companyId) throws Exception {
		String sql = "select company_name from company where company_id=?";
		String cname="";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, companyId);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			cname =  rs.getString("company_name");
			conn.close();
	
		} else {
			cname = "없";
		}
		
		return cname;
	}

}
