package dto;
 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RReply {
	private int replyId;
	private String replyContent;
	private String replyDate;
	private String userId;
	private int reviewId;
	
}
