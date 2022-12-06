<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="mainDiv" class="content">
   <div id="review-list">
      <div id="review-list-header">
      
      </div>
      <table class="table table-hover">
         <thead class="table-dark">
	         <tr>
	            <th scope="col" style="width:100px">NO</th>
	            <th scope="col">리뷰내용</th>
	            <th scope="col" colspan="3">날짜</th>
	         <tr>
         </thead>
         <tbody>
         	<!-- 리뷰목록 -->
         	<c:forEach var="reviewList" items="${reviewList}">
	         	<tr>
         			<td>${reviewList.reviewId}</td>
         			<td style="text-align: left; padding-left: 80px;">
         				<span class="font-weight-bold" style="font-size: 20px;">
         					별점:
         					<c:choose>
         						<c:when test="${reviewList.review.starScore == 5}">⭐⭐⭐⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 4}">⭐⭐⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 3}">⭐⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 2}">⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 1}">⭐</c:when>
         					</c:choose>
         				</span>
         				<span class="pl-1">
	         				[상품명] ${reviewList.product.productName} <br>
         				</span>
         				<b>브랜드: </b> ${reviewList.product.company}		  <br>
         				<b>리뷰제목: </b> ${reviewList.reviewTitle} <br>
         				<b>ID: </b> ${reviewList.userId}
         			</td>
         			<td><fmt:formatDate value="${reviewList.reviewDate}" pattern="yyyy.MM.dd"/></td>
	         	</tr>
         	</c:forEach>
         	
         	<!-- 네비게이터 -->
         	<tr>
         		<td colspan="6" class="text-center">
         			<div>
						<a onclick="productReview(1)" class="btn btn-warning btn-sm">처음</a>		         			
						
						<c:if test="${pager.groupNo > 1}">
							<a onclick="productReview(${pager.startPageNo-1})" class="btn btn-outline-warning btn-sm">이전</a>		         			
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
							<c:if test="${pager.pageNo != i}">
								<a onclick="productReview(${i})" class="btn btn-outline-secondary btn-sm">${i}</a>		         			
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a onclick="productReview(${i})" class="btn btn-secondary btn-sm">${i}</a>		         			
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo < pager.totalGroupNo}">
							<a onclick="productReview(${pager.endPageNo+1})" class="btn btn-outline-warning btn-sm">다음</a>		         			
						</c:if>
						
						<a onclick="productReview(${pager.totalPageNo})" class="btn btn-warning btn-sm">맨끝</a>		         			
         			</div>
         		</td>
         	</tr>
         </tbody>
      </table>
   </div>
</div>		
