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
	            <th scope="col">NO</th>
	            <th scope="col" style="width:330px">상품 정보</th>
	            <th scope="col" colspan="3">작성내용</th>
	            <th></th>
	         <tr>
         </thead>
         <tbody>
         	<!-- 리뷰목록 -->
         	<c:forEach var="review" items="${reviewList}">
	         	<tr>
         			<td>${review.reviewId}</td>
         			<td>
         				<b>상품명: </b> ${review.product.productName}
         				<b>상품가격: </b> ${review.product.productPrice}
         				<b>브랜드: </b> ${review.product.company}
       				</td>
         			<td>
         				<b>리뷰제목: </b> ${review.reviewTitle} <br>
         				<b>ID: </b> ${review.userId}
         			</td>
         			<td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/></td>
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
