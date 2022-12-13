package dto;


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
	 private String qnaDate;
	 private String userId;
	 private int productId;
	 private Qna qna;
}
