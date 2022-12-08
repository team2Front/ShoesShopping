package dto;

import lombok.Data;

@Data
public class ProductImage {
	private int productId;
	private String companyName;
	private String fileName;
	private String fileType;
	private String savedName;
	private String mainImage;
}
