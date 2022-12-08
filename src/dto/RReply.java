package dto;
 
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RReply {
	private int replyId;
	private String replyContent;
	private Date replyDate;
	private String userId;
	private int reviewId;
}
