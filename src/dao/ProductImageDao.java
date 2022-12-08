package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.ProductImage;

public class ProductImageDao {
	
	public ProductImage selectMainImage(Connection conn, int productId) throws Exception {
		System.out.println("[ProductImageDao>selectMainImage]메소드 실행, pid: "+productId);
		String sql = " select p.product_id, filename, filetype, savedname, mainimage, company_name " 
					+ " from product_image i, product p, company c"
					+ " where p.product_id = i.product_id and c.company_id = p.company_id and mainimage = '1' and p.product_id = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);

		ResultSet rs = pstmt.executeQuery();
		ProductImage productImage = new ProductImage();
		if (rs.next()) {
			productImage.setFileName(rs.getString("filename"));
			productImage.setFileType(rs.getString("filetype"));
			productImage.setSavedName(rs.getString("savedname"));
			productImage.setCompanyName(rs.getString("company_name"));
		}
		pstmt.close();
		
		return productImage;
	}
	
	public List<String> selectSubImage(Connection conn, int productId) throws Exception {
		System.out.println("[ProductImageDao>selectSubImage]메소드 실행, pid: "+productId);
		String sql = "select p.product_id, filename, filetype, savedname, mainimage  " + 
				"                    from product_image i, product p " + 
				"                    where p.product_id = i.product_id and  mainimage = '0' and p.product_id =  ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productId);

		ResultSet rs = pstmt.executeQuery();
		List<String> pImageList = new ArrayList<>();;
		while (rs.next()) {
			pImageList.add(rs.getString("filename"));
		}
		
		if(pImageList.size()<5) {
			for(int i=pImageList.size()+1; i<=5; i++) {
				pImageList.add("이미지준비중.jpg");
			}
		}
		
		System.out.println("[ProductImageDao>selectSubImage] pImageList: "+pImageList);
		pstmt.close();
		
		return pImageList;
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
