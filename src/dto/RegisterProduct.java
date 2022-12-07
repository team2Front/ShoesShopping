package dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
public class RegisterProduct {
	private String productName;
	private int productPrice;
	private String productSex;
	private int category;
	private int company;
	private String gender;
	private List<Integer> colorList;
	private List<Integer> sizeList;
	private List<ProductImage> productImage;
}

