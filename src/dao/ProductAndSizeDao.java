package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductAndSizeDao {

	public int insertProductSizes(Connection conn, int pid, List<Integer> sizeList) throws Exception {
		// 상품 id ,그 상품의 사이즈들을 리스트로 받아와서 각각 Product_size 테이블에 삽입한다.
		PreparedStatement pstmt = null;
		int sum = 0;
		int result = 0;
		
			for(int psize : sizeList) {
				
				String sql = "insert into product_size(product_id, size_id) values (?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				pstmt.setInt(2, (psize));
				sum += pstmt.executeUpdate();
			}
			if(sizeList.size() == sum) {
				result = 1;
			}
			conn.close();
			
			return result;
			
		
	}
	
	// 해당상품의 전체 사이즈  리스트 리턴 
	public List<Integer> selectProductSizes(Connection conn, int productId) throws Exception {
		String sql = "select size_id from product_size where product_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  productId);
		
		ResultSet rs = pstmt.executeQuery();
		List<Integer> sizeList = new ArrayList<>();
		while(rs.next()) {
			sizeList.add(rs.getInt("size_id"));	
			
        }
		pstmt.close();
		
		return sizeList;
	}
	
	// 해당 상품의 해당 사이즈 유효한지 체크
	public boolean selectProductSize(Connection conn, int productId, int size) throws Exception {
		String sql = "select size_id from product_size where product_id=? and size_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);
		pstmt.setInt(1, size);
		
		boolean result = false;

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			result = true;
		}
		
		else throw new RuntimeException();
		
		return result;

	}
}
