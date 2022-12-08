package domain;
import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
	private int ordersId;
	private String ordersDate;
//	private String userId;
	private boolean ordersIsDeleted;
	private int totalPrice;
	private int quantity;
	private List<OrderDetailDto> ordersDetailList;
	

	public Orders(int oId, List<OrderDetailDto> list) {
		this.ordersId = oId;
		this.ordersDate = new Date(System.currentTimeMillis()).toString();
		this.ordersIsDeleted = false;
		int price = 0;
		int quantity = 0;
		for(OrderDetailDto od : list) {
			price += od.getProduct().getProductPrice() * od.getQuantity();
			quantity += od.getQuantity();
		}
		
		this.totalPrice = price;
		this.quantity = quantity;
		this.ordersDetailList = list;
	}
}
