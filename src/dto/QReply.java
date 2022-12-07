package dto;

import lombok.AllArgsConstructor; 
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QReply {
	private int replyId;
	private String replyContent;
	private String replyDate;
	private String userId;
	private int qnaId;
}
