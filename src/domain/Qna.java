package domain;
import java.util.List;

import dto.QReply;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Qna {
   private int qnaId;
   private String qnaTitle;
   private String qnaContent;
   private String qnaDate;
   private String userId;
   private int productId;
   private List<QReply> replyList;
}