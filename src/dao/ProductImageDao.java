package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductImage;

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
	
	//
	public int insertProductImages(Connection conn, int pid, List<ProductImage> productImages) throws Exception {
		System.out.println("[ProductImageDao > insert] 메소드 실행 imageList: "+ productImages);
		if(productImages.isEmpty()) return 0;
		
		
		for(int i=0; i<productImages.size(); i++) {
			ProductImage productImage = productImages.get(i);
			String fileName = productImage.getFileName();
			String fileType = productImage.getFileType();
			String savedName = productImage.getSavedName();
			//메인이미지로도 하나 저장해주기
			if(i==0) {
				insertMainImage(conn,pid,productImages); 
			}
			
			String sql = "insert into product_image (product_id,filename,filetype,savedname,mainimage,pimage_id) "
						+"values (?,?,?,?,0,product_img_seq.nextval) ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2,fileName);
			pstmt.setString(3, fileType);
			pstmt.setString(4, savedName);
			
			pstmt.executeUpdate();

			pstmt.close();
		}
		
		return 1;
	}
	
	//메인이미지 저장 메소드
	public void insertMainImage(Connection conn, int pid, List<ProductImage> productImages) throws Exception {
		ProductImage productImage = productImages.get(0);
		String fileName = productImage.getFileName();
		String fileType = productImage.getFileType();
		String savedName = productImage.getSavedName();
		
		String sql = "insert into product_image (product_id,filename,filetype,savedname,mainimage,pimage_id) "
				+"values (?, ?, ?, ?, 1, product_img_seq.nextval) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pid);
		pstmt.setString(2,fileName);
		pstmt.setString(3, fileType);
		pstmt.setString(4, savedName);
		
		pstmt.executeUpdate();

		pstmt.close();
	}
	

}
