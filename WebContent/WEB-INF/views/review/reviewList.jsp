<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="${pageContext.request.contextPath}/resources/javascript/review_qna.js"></script>

<div id="mainDiv" class="content">
   <div id="reviewList">
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
         	<c:forEach var="reviewList" items="${reviewList}">
         		<!-- 리뷰목록 -->
	         	<tr>
         			<td style="vertical-align: text-top;">${reviewList.reviewId}</td>
         			<td style="text-align: left; padding-left: 80px; width:813.31px;">
         				<span class="font-weight-bold" style="font-size: 15px;">
         					별점:
         					<c:choose>
         						<c:when test="${reviewList.review.starScore == 5}">⭐⭐⭐⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 4}">⭐⭐⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 3}">⭐⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 2}">⭐⭐</c:when>
         						<c:when test="${reviewList.review.starScore == 1}">⭐</c:when>
         					</c:choose>
         				</span>
         				<span class="pl-1 small text-muted">
	         				[상품] ${reviewList.product.productName} | ${reviewList.product.company} <br>
         				</span>
         				<span class="pl-1 small text-warning font-weight-bold">
	         				[ 아이디: ${reviewList.userId} ] <br>
         				</span>
         				<span class="font-weight-bold" style="font-size: 20px;">
	         				 ${reviewList.reviewTitle} <br>
         				</span>

			         	<!-- 리뷰 상세 -->
		         		<div id="reviewDetail" style="display:none;">
		         			<hr class="mt-3 mb-3">
		         			<!-- 리뷰내용 -->
		         			<div>
			                	<div style="float: left;"><img src="${pageContext.request.contextPath}/resources/images/review/${reviewList.review.rsavedName}" width="150">&nbsp;&nbsp;</div>
			                	<div>${reviewList.review.reviewContent}</div>
		         			</div>
		         			<div style="clear: both;"></div>
		         			<!-- 좋아요버튼 -->
		         			<span id="goodBtn">
			         			<a class="btn btn-outline-danger btn-sm mt-3" onclick="good(${reviewList.reviewId})">
			         				좋아요  <b>${reviewList.review.heartCount}</b>
			         			</a>
		         			</span>
		         			<span>
			         			<a id ="replyBtn" class="btn btn-outline-dark btn-sm mt-3">
			         				댓글보기
			         			</a> 
		         			</span>
		         		</div>
		         		
	         			<!-- 댓글목록  -->
	         			<div id="replyList" style="display:none;">
	         				<hr class="mt-3 mb-3">
	         				<b >댓글</b>
		         			<c:forEach var="reply" items="${reviewList.review.replyList}">
		         				<div>
		         					${reply.replyContent}
		         				</div>
		         			</c:forEach>
	         			</div>
         			</td>
         			<td style="vertical-align: text-top;"><fmt:formatDate value="${reviewList.reviewDate}" pattern="yyyy.MM.dd"/></td>
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
