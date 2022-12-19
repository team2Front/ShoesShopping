package dto;

import java.util.Date;

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
	private Date replyDate;
	private String userId;
	private int qnaId;
}
