package domain;
import java.util.Date; 
import java.util.List;

import dto.RReply;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Review {
   private int reviewId;
   private String reviewTitle;
   private String reviewContent;
   private Date reviewDate;
   private String userId;
   private int starScore;
   private int heartCount;
   private String rfileName;
   private String rfileType;
   private String rsavedName;
   private Product product;
   private List<RReply> replyList;
}