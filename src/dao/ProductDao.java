package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import domain.Product;
import dto.ProductList;
import dto.RegisterProduct;
import util.PagingVo;

public class ProductDao {
	ProductAndSizeDao productAndSizeDao;
	ProductAndColorDao productAndColorDao;
	CategoryDao categoryDao;
	ProductImageDao productImageDao;
	

	public ProductDao(ServletContext application) {
		this.productAndSizeDao = (ProductAndSizeDao) application.getAttribute("productAndSizeDao");
		this.productAndColorDao = (ProductAndColorDao) application.getAttribute("productAndColorDao");
		this.categoryDao = (CategoryDao) application.getAttribute("categoryDao");
		this.productImageDao = (ProductImageDao) application.getAttribute("productImageDao");
	}

	// 상품의 총수량
	public int selectCountAll(Connection conn) throws Exception {
		String sql = "select count(product_id) from product where is_deleted = '0'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		int cnt = 1;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		return cnt;
	}

	// 모든 상품 목록(간단히 보기)
	public List<ProductList> selectProductList(Connection conn, PagingVo pvo) throws Exception {
		ProductList productList = null;

		int endRn = pvo.getEndRowNo(); // 페이지의 끝행 번호
		int startRn = pvo.getStartRowNo();// 페이지의 시작 행 번호

		String sql = ""+
				" select rm, product_id, product_name, company_id, category_id, product_sex, product_price, filename " + 
				"								           from( " + 
				"												select rownum as rm, product_id, product_name, company_id, category_id, product_sex, product_price, filename   " + 
				"												from (select  p.product_id, product_name, company_id, category_id, product_sex, product_price, filename " + 
				"								                       from product p, product_image i where i.product_id= p.product_id and is_deleted = '0' and mainimage = '1' " + 
				"								                    order by product_id) " + 
				"								                 where rownum <= ? )  " + 
				"								    where rm >= ?";

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
			productList.setFileName(rs.getString("filename"));
			list.add(productList);
		}
		pstmt.close();
		return list;
	}

	// companyId로 회사명 가져오기
	public String selectFindCompany(Connection conn, int companyId) throws Exception {
		String sql = "select company_name from company where company_id=? ";
		String cname = "";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, companyId);

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			cname = rs.getString("company_name");
		}
		pstmt.close();
		
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
		pstmt.close();
		
		return cname;
	}

	
	// 상품하나만 가져오기 정은
	public Product selectProductOne(Connection conn, int productId) throws Exception {
      PreparedStatement pstmt = null;
      Product product = null;
      
      String sql = "select product_id, product_name, product_price, category_id, company_id, product_sex, is_deleted from product where product_id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, productId);
      ResultSet rs = pstmt.executeQuery();
      
      if (rs.next()) {
         int pid = rs.getInt("product_id");
         product = new Product();
         product.setProductId(pid);
         product.setProductName(rs.getString("product_name"));
         product.setDeleted(rs.getBoolean("is_deleted"));
         product.setProductPrice(rs.getInt("product_price"));
         product.setProductSex(rs.getString("product_sex"));
         product.setCompany(selectFindCompany(conn, rs.getInt("company_id")));
         product.setCategory(categoryDao.findCategoty(conn, rs.getInt("category_id")));
         product.setColorList(productAndColorDao.selectProductColors(conn, pid));
         product.setSizeList(productAndSizeDao.selectProductSizes(conn, pid));
         product.setMainImage(productImageDao.selectMainImage(conn, pid));
         product.setImageList(productImageDao.selectSubImage(conn, pid));
      }
      pstmt.close();
      
      return product;
   }

	
	

	// 트랜잭션
	public void selectCheckColor(Connection conn, List<Integer> colorList) throws Exception {
		PreparedStatement pstmt = null;
		for (Integer i : colorList) {
			String sql = "select color_id from color where color_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			ResultSet rs = pstmt.executeQuery();

			if (!rs.next()) {
				throw new RuntimeException("컬러 없는 상품입니다.");
			}
		}
	}

	public void selectCheckSize(Connection conn, List<Integer> sizeList) throws Exception {
		PreparedStatement pstmt = null;

		for (Integer i : sizeList) {
			String sql = "select size_id from ssize where size_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			ResultSet rs = pstmt.executeQuery();

			if (!rs.next()) {
				throw new RuntimeException("사이즈 없는 상품입니다.");
			}
		}
	}

	// Product테이상품 등록하기
	public int insertProduct(Connection conn, RegisterProduct ap) throws Exception {
		System.out.println("[ProductDao > insertProduct] 메소드 실행");
		int pid = 0;
		
		String sql = "insert into product" + "(product_id, product_name, product_price, category_id, company_id , product_sex) "
				+ "values (product_seq.nextval,?,?,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, ap.getProductName());
		pstmt.setInt(2, ap.getProductPrice());
		pstmt.setInt(3, ap.getCategory());
		pstmt.setInt(4, ap.getCompany());
		pstmt.setString(5, ap.getGender());
		int r = pstmt.executeUpdate();

		if (r == 1) {
			// ResultSet rs = pstmt.getGeneratedKeys();
			sql = "select product_id from product where product_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ap.getProductName());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				pid = rs.getInt("product_id");
				// pid = rs.getInt(1);
			}
		}
		pstmt.close();
		
		return pid;
	}

	// 상품 삭제하기
	public int deleteProduct(Connection conn, int pId) throws Exception {
		String sql = "update product set is_deleted = '1' where product_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pId);
		int rows = pstmt.executeUpdate();
		
		pstmt.close();
		
		return rows;
	}

}
