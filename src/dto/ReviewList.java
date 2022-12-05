package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewList {
   private int reviewId;
   private String reviewTitle;
   private String reviewDate;
   private String userId;
   private int productId;
}