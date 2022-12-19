package dto;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import domain.CartDetail;
import domain.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDetailDto {
	// 장바구니 상세보기 보여주기 위한 dto
	private int cart_detail_id;
	private Product product;
	private int size_id;
	private String color_name;
	private int quantity;
	private int totalPrice;
	
	public CartDetailDto cartDetailToCartDetailDto(CartDetail cd) {
		int price = cd.getQuantity() * cd.getProduct().getProductPrice();
		
		return new CartDetailDto(cd.getCart_detail_id(),cd.getProduct(), cd.getSize_id(),
				cd.getColor().getColor_name(), cd.getQuantity(), price);
	}
	
	
	public List<CartDetailDto> toCartDetailDtoList(List<CartDetail> cdList) {
		List<CartDetailDto> list = new ArrayList<>();
		
		for(CartDetail cd : cdList) {
			list.add(cartDetailToCartDetailDto(cd));
		}
		
		return list;
	}

}
