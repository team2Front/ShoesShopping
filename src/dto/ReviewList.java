package dto;

import java.util.Date; 

import domain.Product;
import domain.Review;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewList {
   private int reviewId;
   private String reviewTitle;
   private Date reviewDate;
   private String userId;
   private Product product;
   private Review review;
}