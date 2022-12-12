package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductList;
import util.PagingVo;

public class PfilteringDao {
	// 1) 카테고리
	public int selectCountCategory(Connection conn, int cateId) throws Exception {
		// 선택한 카테고리상품의 총수량
		String sql = "select count(product_id) from product  where category_id=? and is_deleted = '0'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cateId);
		ResultSet rs = pstmt.executeQuery();

		int cnt = 0;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		
		return cnt;
		
	}
	
	//필터링한 상품 수량
		public int selectCountFiltered(Connection conn, int fcolor, int fsize, String fprice) throws Exception {
			System.out.println("[selectCountFiltered]");
			int a = 0;
			int b = 0;
			switch(fprice) {
			case "fprice1": 
				a = 0;
				b = 50000;
			case "fprice2":
				a = 50000;
				b = 80000;
				
			case "fprice3":
				a = 80000;
				b = 100000;
			case "fprice4":
				a = 100000;
				b = 150000;
			case "fprice5":
				a = 150000;
				b = 300000;
			}
			String sql = "select count(product_id) " + 
					"from( " + 
					"select p.product_id " + 
					"from product p, product_color c, product_size s  " + 
					"where p.product_id = c.product_id and s.product_id = p.product_id and is_deleted = '0'  " + 
					"and color_id=? and size_id = ? and product_price >= ? and product_price <= ? " + 
					"group by p.product_id " + 
					") ";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fcolor);
			pstmt.setInt(2, fsize);
			pstmt.setInt(3, a);
			pstmt.setInt(4, b);
			ResultSet rs = pstmt.executeQuery();

			int cnt = 1;
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			pstmt.close();
			System.out.println("count: "+cnt);
			return cnt;
			
		}


	public List<ProductList> selectShowCategory(Connection conn, PagingVo pvo, int category) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호

		String sql = "select rm, product_id, product_name, company_id, category_id, product_sex, product_price  "
				+ "from( "
				+ "select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price "
				+ "from (" + "select  product_id, product_name, company_id, category_id, product_sex, product_price "
				+ "from product " + "where category_id = ? and is_deleted = '0' " + "order by product_id" + ")" + " where rownum <= ? ) "
				+ "where rm >= ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, category);
		pstmt.setInt(2, endRn);
		pstmt.setInt(3, startRn);

		ResultSet rs = pstmt.executeQuery();
		List<ProductList> list = new ArrayList<>();

		while (rs.next()) {
			productList = new ProductList();
			productList.setProductId(rs.getInt("product_id"));
			productList.setProductName(rs.getString("product_name"));
			productList.setCompanyName(selectFindCompany(conn, rs.getInt("company_id")));
			productList.setCategoryName(selectFindCategory(conn, rs.getInt("category_id")));
			productList.setProductSex(rs.getString("product_sex"));
			productList.setProductPrice(rs.getInt("product_price"));
			list.add(productList);
		}
		pstmt.close();
		
		return list;
	}

	// 2) 회사 기준
	public int selectCountCompany(Connection conn, int company) throws Exception {
		String sql = "select count(product_id) from product  where company_id=? and is_deleted = '0'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, company);
		ResultSet rs = pstmt.executeQuery();

		int cnt = 0;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		
		return cnt;
	}

	public List<ProductList> selectShowCompany(Connection conn, PagingVo pvo, int company) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호

		String sql = " select rm, product_id, product_name, company_id, category_id, product_sex, product_price, filename   " + 
				"				from( " + 
				"				select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price , filename " + 
				"				from ( " + 
				"                select  p.product_id, product_name, company_id, category_id, product_sex, product_price, filename " + 
				"				from product p, product_image i " + 
				"                where p.product_id = i.product_id and company_id = ? and is_deleted = '0'  " + 
				"                and mainimage=1 " + 
				"                order by product_id " + 
				"                ) " + 
				"                where rownum <= ? ) " + 
				"				where rm >= ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, company);
		pstmt.setInt(2, endRn);
		pstmt.setInt(3, startRn);

		ResultSet rs = pstmt.executeQuery();
		List<ProductList> list = new ArrayList<>();

		while (rs.next()) {
			productList = new ProductList();
			productList.setProductId(rs.getInt("product_id"));
			productList.setProductName(rs.getString("product_name"));
			productList.setCompanyName(selectFindCompany(conn, rs.getInt("company_id")));
			productList.setCategoryName(selectFindCategory(conn, rs.getInt("category_id")));
			productList.setProductSex(rs.getString("product_sex"));
			productList.setProductPrice(rs.getInt("product_price"));
			productList.setFileName(rs.getString("filename"));
			list.add(productList);
		}
		pstmt.close();
		
		return list;
	}

	// 3) 성별 기준
	public int selectCountSex(Connection conn, String sex) throws Exception {
		String sql = "select count(product_id) from product  where product_sex=? and is_deleted = '0'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sex);
		ResultSet rs = pstmt.executeQuery();

		int cnt = 0;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		
		return cnt;
	}

	public List<ProductList> selectShowSex(Connection conn, PagingVo pvo, String sex) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호

		String sql = "select rm, product_id, product_name, company_id, category_id, product_sex, product_price  "
				+ "from( "
				+ "select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price "
				+ "from (" + "select  product_id, product_name, company_id, category_id, product_sex, product_price "
				+ "from product " + "where product_sex = ? and is_deleted = '0' " + "order by product_id" + ")" + " where rownum <= ? ) "
				+ "where rm >= ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sex);
		pstmt.setInt(2, endRn);
		pstmt.setInt(3, startRn);

		ResultSet rs = pstmt.executeQuery();
		List<ProductList> list = new ArrayList<>();

		while (rs.next()) {
			productList = new ProductList();
			productList.setProductId(rs.getInt("product_id"));
			productList.setProductName(rs.getString("product_name"));
			productList.setCompanyName(selectFindCompany(conn, rs.getInt("company_id")));
			productList.setCategoryName(selectFindCategory(conn, rs.getInt("category_id")));
			productList.setProductSex(rs.getString("product_sex"));
			productList.setProductPrice(rs.getInt("product_price"));
			list.add(productList);
		}
		pstmt.close();
		
		return list;
	}
	// 4) 가격 기준

	public List<ProductList> selectShowPrice(Connection conn, PagingVo pvo, String price) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호

		String sql = "";
		if (price.equals("asc")) {
			sql = "select rm, product_id, product_name, company_id, category_id, product_sex, product_price  "
					+ "from( "
					+ "select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price "
					+ "from ("
					+ "select  product_id, product_name, company_id, category_id, product_sex, product_price "
					+ "from product where is_deleted = '0' " + "order by product_price " + ")" + " where rownum <= ? ) " + "where rm >= ?";
		} else {
			sql = "select rm, product_id, product_name, company_id, category_id, product_sex, product_price  "
					+ "from( "
					+ "select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price "
					+ "from ("
					+ "select  product_id, product_name, company_id, category_id, product_sex, product_price "
					+ "from product where is_deleted = '0' " + "order by product_price desc " + ")" + " where rownum <= ? ) "
					+ "where rm >= ?";
		}

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, endRn);
		pstmt.setInt(2, startRn);

		ResultSet rs = pstmt.executeQuery();
		List<ProductList> list = new ArrayList<>();

		while (rs.next()) {
			productList = new ProductList();
			productList.setProductId(rs.getInt("product_id"));
			productList.setProductName(rs.getString("product_name"));
			productList.setCompanyName(selectFindCompany(conn, rs.getInt("company_id")));
			productList.setCategoryName(selectFindCategory(conn, rs.getInt("category_id")));
			productList.setProductSex(rs.getString("product_sex"));
			productList.setProductPrice(rs.getInt("product_price"));
			list.add(productList);
		}
		pstmt.close();
		
		return list;
	}

	// 회사 아이디를 입력하면 회사 이름으로 출력해줌
	public String selectFindCompany(Connection conn, int companyId) throws Exception {
		String sql = "select company_name from company where company_id=?";
		String cname = "";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, companyId);

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			cname = rs.getString("company_name");

		}
		
		return cname;
	}

	// 아이디로 카테고리 명 가져오기
	public String selectFindCategory(Connection conn, int category) throws Exception {
		String sql = "select category_kind from category where category_id=?";
		String cname = "";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, category);

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			cname = rs.getString("category_kind");

		}
		
		return cname;
	}

	public List<ProductList> selectFiltered(Connection conn, PagingVo pvo, int color, int size, String price) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호
		
		int a = 0;
		int b = 0;
		switch(price) {
		case "fprice1": 
			a = 0;
			b = 50000; break;
		case "fprice2":
			a = 50000;
			b = 80000; break;
			
		case "fprice3":
			a = 80000;
			b = 100000; break;
		case "fprice4":
			a = 100000;
			b = 150000; break;
		case "fprice5":
			a = 150000;
			b = 300000; break;
		}

		String sql = ""+
				" select rm, product_id, product_name, company_id, category_id, product_sex, product_price ,filename  " + 
				" from(  " + 
				"    select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price, filename  " + 
				"    from ( " + 
				"            select  p.product_id, product_name, company_id, category_id, product_sex, product_price, filename  " + 
				"            from product p, product_color c, product_size s, product_image i " + 
				"            where p.product_id = c.product_id and p.product_id = s.product_id and p.product_id = i.product_id " + 
				"                and is_deleted = '0'  " + 
				"                and ? < product_price and product_price < ?  " + 
				"                and color_id = ?  " + 
				"                and size_id = ? " + 
				"				  and mainimage=1 "+		
				"                order by product_price " + 
				"            ) " + 
				"     where rownum <= ? )  " + 
				" where rm >= ? ";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, a);
		pstmt.setInt(2, b);
		pstmt.setInt(3, color);
		pstmt.setInt(4, size);
		pstmt.setInt(5, endRn);
		pstmt.setInt(6, startRn);

		ResultSet rs = pstmt.executeQuery();
		List<ProductList> list = new ArrayList<>();
		while (rs.next()) {
			productList = new ProductList();
			productList.setProductId(rs.getInt("product_id"));
			productList.setProductName(rs.getString("product_name"));
			productList.setCompanyName(selectFindCompany(conn, rs.getInt("company_id")));
			productList.setCategoryName(selectFindCategory(conn, rs.getInt("category_id")));
			productList.setProductSex( rs.getString("product_sex"));
			productList.setProductPrice(rs.getInt("product_price"));
			productList.setFileName(rs.getString("filename"));
			list.add(productList);
		}
		pstmt.close();
		return list;
	}

	public int selectCountCompanyCatogory(Connection conn, int company, String product_sex) throws Exception {
		String sql = "select count(product_id) from product  where company_id=? and product_sex=? and is_deleted = '0'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, company);
		pstmt.setString(2, product_sex);
		ResultSet rs = pstmt.executeQuery();

		int cnt = 0;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		
		return cnt;
	}

	public List<ProductList> selectShowCompanyCategory(Connection conn, PagingVo pvo, int company_id, String product_sex) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호

		String sql = " select rm, product_id, product_name, company_id, category_id, product_sex, product_price, filename   " + 
				"				from( " + 
				"				select rownum as rm, product_id,product_name, company_id, category_id, product_sex, product_price , filename " + 
				"				from ( " + 
				"                select  p.product_id, product_name, company_id, category_id, product_sex, product_price, filename " + 
				"				from product p, product_image i " + 
				"                where p.product_id = i.product_id and company_id = ? and product_sex = ? and is_deleted = '0'  " + 
				"                and mainimage=1 " + 
				"                order by product_id " + 
				"                ) " + 
				"                where rownum <= ? ) " + 
				"				where rm >= ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, company_id);
		pstmt.setString(2, product_sex);
		pstmt.setInt(3, endRn);
		pstmt.setInt(4, startRn);

		ResultSet rs = pstmt.executeQuery();
		List<ProductList> list = new ArrayList<>();

		while (rs.next()) {
			productList = new ProductList();
			productList.setProductId(rs.getInt("product_id"));
			productList.setProductName(rs.getString("product_name"));
			productList.setCompanyName(selectFindCompany(conn, rs.getInt("company_id")));
			productList.setCategoryName(selectFindCategory(conn, rs.getInt("category_id")));
			productList.setProductSex(rs.getString("product_sex"));
			productList.setProductPrice(rs.getInt("product_price"));
			productList.setFileName(rs.getString("filename"));
			list.add(productList);
		}
		pstmt.close();
		
		return list;
	}



}
