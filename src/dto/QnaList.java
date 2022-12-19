package dto;


import java.util.Date;

import domain.Product;
import domain.Qna;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaList {
	 private int qnaId;
	 private String qnaTitle;
	 private Date qnaDate;
	 private String userId;
	 private Product product;
	 private Qna qna;
}
