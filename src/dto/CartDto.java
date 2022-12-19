package dto;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import domain.Cart;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
	private int totalPrice;
	private int totalQuantity;
	
	private List<CartDetailDto> cartDetailDtoList;
	
	public CartDto cartToDto(Cart cart) {
		CartDetailDto cd = new CartDetailDto();
		return new CartDto(cart.getTotalPrice(), cart.getTotalQuantity(), cd.toCartDetailDtoList(cart.getCartDetailList()));
	}

	
}
