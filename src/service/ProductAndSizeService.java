package service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import dao.ProductAndSizeDao;

public class ProductAndSizeService {
	ProductAndSizeDao productAndSizeDao;
	
	public ProductAndSizeService(ServletContext application) {
		this.productAndSizeDao = (ProductAndSizeDao) application.getAttribute("productAndSizeDao");
	}

	

	public void addProductSizes(int pid, List<Integer> sizeList) throws SQLException {
		// 상품 id ,그 상품의 사이즈들을 리스트로 받아와서 각각 Product_size 테이블에 삽입한다.
		productAndSizeDao.insertProductSizes(pid, sizeList);

	}
	
	// 해당상품의 전체 사이즈  리스트 리턴 
	public List<Integer> findProductSizeList(int productId) throws SQLException {
		return productAndSizeDao.selectProductSizes(productId);
    }
	// 유저가 선택한 색상이 상품에 있는지 확인
		public boolean checkSize(int productId, int size) throws SQLException {
			List<Integer> list = findProductSizeList(productId);
			
			boolean result = false;
			for(int s : list) {
				if(s == size) {
					result = true;
					break;
				}
			}
			return result;
		
		}
	

}
