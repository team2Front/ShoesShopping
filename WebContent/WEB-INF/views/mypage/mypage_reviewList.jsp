<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script src="${pageContext.request.contextPath}/resources/javascript/review_qna.js"></script>

<style>
	#writeReplyDiv {
		position: relative;
		width: 400px;
	}
	
	#writeReplyDiv input {
		width: 100%;
	  	border: 1px solid #bbb;
	  	border-radius: 8px;
	  	font-size: 14px;
	}
	
	#writeReplyDiv i {
		position : absolute;
  		width: 17px;
  		top: 28px;
  		right: 12px;
  		margin: 0;
	}
	
</style>

<div id="mainDiv" class="content">
   <h1 class="title m-5">나의 리뷰 목록</h1>
   <div id="reviewList">
      <table class="table table-hover">
         <thead class="table-dark">
	         <tr>
	            <th scope="col" style="width:100px">NO</th>
	            <th scope="col">리뷰내용</th>
	            <th scope="col" colspan="3">날짜</th>
	         <tr>
         </thead>
         <tbody>
         	<c:forEach var="item" items="${reviewList}">
         		<!-- 리뷰목록 -->
	         	<tr>
         			<td style="vertical-align: text-top;">${item.reviewId}</td>
         			<td style="text-align: left; padding-left: 80px; width:813.31px;">
         				<span class="font-weight-bold" style="font-size: 15px;">
         					별점:
         					<c:choose>
         						<c:when test="${item.review.starScore == 5}">⭐⭐⭐⭐⭐</c:when>
         						<c:when test="${item.review.starScore == 4}">⭐⭐⭐⭐</c:when>
         						<c:when test="${item.review.starScore == 3}">⭐⭐⭐</c:when>
         						<c:when test="${item.review.starScore == 2}">⭐⭐</c:when>
         						<c:when test="${item.review.starScore == 1}">⭐</c:when>
         					</c:choose>
         				</span>
         				<span class="pl-1 small text-muted">
	         				[상품] ${item.product.productName} | ${item.product.company} | ${item.product.productPrice}원 <br>
         				</span>
         				<span class="pl-1 small text-warning font-weight-bold">
	         				[ID:${item.userId}] <br>
         				</span>
         				<span class="font-weight-bold" style="font-size: 20px;">
	         				 ${item.reviewTitle} <br>
         				</span>

			         	<!-- 리뷰 상세 -->
		         		<div id="reviewDetail" style="display:none;">
		         			<hr class="mt-3 mb-3">
		         			<!-- 리뷰내용 -->
		         			<div>
		         				<c:if test="${item.review.rsavedName != null}">
			 	               		<div style="float: left;"><img src="/Project2_Images/review/${item.review.rsavedName}" width="150">&nbsp;&nbsp;</div>
				                	<div>${item.review.reviewContent}</div>
		         				</c:if>
		         				<c:if test="${item.review.rsavedName == null}">
				                	<div>${item.review.reviewContent}</div>
		         				</c:if>
		         			</div>
		         			<div style="clear: both;"></div>
		         			<!-- 좋아요버튼 -->
		         			<span id="goodBtn${item.reviewId}">
			         			<button class="btn btn-outline-danger btn-sm mt-3" onclick="good(${item.reviewId})">
			         				좋아요 <b>${item.review.heartCount}</b>
			         			</button>
		         			</span>
		         			<span id ="replyBtn${item.reviewId}">
			         			<a class="btn btn-outline-dark btn-sm mt-3" onclick="replyList(${item.reviewId})">
			         				댓글보기
			         			</a> 
		         			</span>
		         			<!-- 댓글  -->
		         			<div id="replyList${item.reviewId}" style="display:none;">
	         					<hr class="mt-3 mb-2">
								
								<!-- 댓글작성 -->
								<form id="writeReplyForm" name="writeReplyForm" method="post" class="d-flex">
					      			<div id="writeReplyDiv" class="form-group form-floating">
					      				<label class="font-weight-bold" for="writeReply${item.reviewId}"></label>
					      				<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="writeReply${item.reviewId}" name="writeReply"/>
										<i class="bi bi-pencil-fill"></i>
									</div>
									<button type="button" onclick="writeReplyFun(${item.reviewId})" class="btn btn-warning btn-sm ml-1 mt-4" style="height:35px;"><b>작성</b></button>
								</form>
								
								<!-- 댓글목록 -->
								<c:if test="${!empty item.review.replyList}">
									<c:forEach var="reply" items="${item.review.replyList}">
										<div class="mb-3">
											<div>${reply.replyContent}</div>
											<span class="small text-success font-weight-bold">${reply.userId}&nbsp;&nbsp;</span>
											<span class="small text-muted"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy.MM.dd"/></span> 
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${empty item.review.replyList}">
									<div id="noReplyDiv${item.reviewId}" style="display:block;  ">작성된 댓글이 없습니다!</div>
								</c:if>
								
								<!-- 새로 작성한 댓글 -->
								<div id="addReply${item.reviewId}" class="mb-3">
									<!-- 여기에 추가될거지롱~ -->
								</div>
         					</div>
		         		</div>
         			</td>
         			<td style="vertical-align: text-top;"><fmt:formatDate value="${item.reviewDate}" pattern="yyyy.MM.dd"/></td>
	         	</tr>
         	</c:forEach>
         	
         	<!-- 네비게이터 -->
         	<tr>
         		<td colspan="6" class="text-center">
         			<div>
						<a href="${pageContext.request.contextPath}/mypage/MyReviewController?pageNo=1" class="btn btn-warning btn-sm">처음</a>		         			
						
						<c:if test="${pager.groupNo > 1}">
							<a href="${pageContext.request.contextPath}/mypage/MyReviewController?pageNo=${pager.startPageNo-1}" class="btn btn-outline-warning btn-sm">이전</a>		         			
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
							<c:if test="${pager.pageNo != i}">
								<a href="${pageContext.request.contextPath}/mypage/MyReviewController?pageNo=${i}" class="btn btn-outline-secondary btn-sm">${i}</a>		         			
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a href="${pageContext.request.contextPath}/mypage/MyReviewController?pageNo=${i}" class="btn btn-secondary btn-sm">${i}</a>		         			
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo < pager.totalGroupNo}">
							<a href="${pageContext.request.contextPath}/mypage/MyReviewController?pageNo=${pager.endPageNo+1}" class="btn btn-outline-warning btn-sm">다음</a>		         			
						</c:if>
						
						<a href="${pageContext.request.contextPath}/mypage/MyReviewController?pageNo=${pager.totalPageNo}" class="btn btn-warning btn-sm">맨끝</a>		         			
         			</div>
         		</td>
         	</tr>
         </tbody>
      </table>
      
      <!-- 로그인되어있지 않고 댓글을 작성하려는 경우 뜨는 모달창(로그인폼)  -->
	  <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	     <div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 로그인 폼 -->
					<div style="width: 400px; margin: auto; margin-top: 30px">
						<img src="../resources/images/sashoes_logo.png" style="width: 100%" />
					</div>
					<div class="card mt-2" style="width: 400px; margin: auto;">
						<div class="card-header" style="text-align:center"><h4 style="margin:auto"></h4></div>
						<div class="card-body">
							<form method="post">
								<div class="form-group">
									<label for="uid">아이디</label> <input type="text" class="form-control"
										id="uid" name="uid">
								</div>
								<div class="form-group">
									<label for="upassword">Password</label> 
									<input type="password" class="form-control" id="upassword" name="upassword">
								</div>
								<button type="button" onclick="loginComplete()" class="btn btn-warning" style="width: 100%">로그인</button>
							</form>
							<div class="form-group">
								<button type="submit" class="btn btn-dark mt-3" style="width: 49%" onclick="location.href='${pageContext.request.contextPath}/user/JoinFormController'">
									회원 가입
								</button>
								<button type="submit" class="btn btn-dark mt-3" style="width: 49%" onclick="location.href='${pageContext.request.contextPath}'">
									홈으로
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<%-- <a class="btn btn-warning" id="modalY" href="${pageContext.request.contextPath}/user/LoginSessionController">로그인</a> --%>
					<!-- <button class="btn btn-outline-dark" type="button" data-dismiss="modal">아니요</button> -->
				</div>
			</div>
		  </div>
	  </div> 
      
   </div>
</div>		
