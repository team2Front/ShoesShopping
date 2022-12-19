<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script src="${pageContext.request.contextPath}/resources/javascript/review_qna.js"></script>

<!-- QnA 작성 -->
<div style="float:right">
	<button class="btn btn-lg btn-dark m-3" data-toggle="modal" data-target="#qna_creative"> Q & A 작성 </button>
	<div class="modal fade" id="qna_creative">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4> Q & A </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form id="writeQnAForm" name="writeQnAForm" method="post">
						<div style="width:400px;">
	      					<label class="font-weight-bold" for="writeQnATitle">제목</label>
	      					<input type="text" class="form-control" placeholder="제목을 입력해주세요" id="writeQnATitle" name="writeQnATitle"/>
	      				</div>
	      				<div class="mt-3" style="width:400px;">
	      					<label class="font-weight-bold" for="writeQnAContent">내용</label>
	      					<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="writeQnAContent" name="writeQnAContent" style="height:300px;"/>
<%-- 						<button type="button" onclick="writeReplyFun(${item.reviewId})" class="btn btn-warning btn-sm ml-1 mt-4" style="height:35px;"><b>작성</b></button> --%>
						</div>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" onclick="writeQnAFun()" class="btn bg-warning" data-dismiss="modal">작성</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- QnA 목록  -->
<div id="mainDiv" class="content">
   <div id="reviewList">
      <div id="review-list-header">
      </div>
      <table class="table table-hover">
         <thead class="table-dark">
	         <tr>
	            <th scope="col" style="width:100px">NO</th>
	            <th scope="col">QnA 내용</th>
	            <th scope="col" colspan="3">날짜</th>
	         <tr>
         </thead>
         <tbody>
         	<c:forEach var="item" items="${qnaList}">
         		<!-- QnA 목록 -->
	         	<tr>
         			<td style="vertical-align: text-top;">${item.qnaId}</td>
         			<td style="text-align: left; padding-left: 80px; width:813.31px;">
         				<span class="pl-1 small text-muted">
	         				[상품] ${item.product.productName} | ${item.product.company} <br>
         				</span>
         				<span class="pl-1 small text-warning font-weight-bold">
	         				[ID:${item.userId}] <br>
         				</span>
         				<span class="font-weight-bold" style="font-size: 20px;">
	         				 ${item.qnaTitle} <br>
         				</span>

			         	<!-- 리뷰 상세 -->
		         		<div id="reviewDetail" style="display:none;">
		         			<hr class="mt-3 mb-3">
		         			<!-- 리뷰내용 -->
		         			<div>
			                	<div>${item.qna.qnaContent}</div>
		         			</div>
		         			<div style="clear: both;"></div>
		         			
		         			<!-- 답변내역 -->
		         			<div>
		         				<c:forEach var="reply" items="${item.qna.replyList}">
		         					<div class="mb-3">
		         						<hr>
		         						<div class="text-white bg-dark"><c:if test="${reply != null}">${reply.replyContent}</c:if></div>
	         						</div>
	         					</c:forEach>
	         				</div>
		         		</div>
         			</td>
         			<td style="vertical-align: text-top;">
         				<div><fmt:formatDate value="${item.qnaDate}" pattern="yyyy.MM.dd"/></div>
       					<div>
	       					<c:if test="${empty item.qna.replyList}"><b class="text-danger">[답변 대기중]</b></c:if>
    	   					<c:if test="${!empty item.qna.replyList}"><b class="text-success">[답변 완료]</b></c:if>
       					</div>
       				</td>
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
