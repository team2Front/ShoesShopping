<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	<script src="../resources/javascript/review_qna.js"></script>
	</head>

	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>	
		<div class="container-fluid row">
			
			<%@ include file="/WEB-INF/views/fragment/mypage_sidebar.jsp"%>
			
			<!-- main -->
			<div class="shoesmain-2 col-sm-10">
				<div id="mainDiv" class="card my-3">
					<div id="review-list-header" class="card-header" style="background-color: LightGray;">
						<strong style="font-size: 35px;">리뷰 작성</strong>
					</div>
					
					<div class="card-body">
						<ul class="n-info-txt" style="margin-left: 0px; padding-left: 0px;">
							<li>SaShoes에서 상품을 구매해주셔서 감사합니다</li>
							<li>리뷰 작성은 판매자에게 큰 힘이 됩니다!^-^)/</li>
							<br/>
							<li><u>아래의 해당사항에 하나라도 해당될 경우,  관리자에 의해 삭제될 수 있습니다.</u></li>
							<br/>
							<li>[해당사항]</li>
							<li> - 상품과 관련없거나 문자 및 기호의 단순 나열, 반복된 내용의 후기</li>
							<li> - 개인정보 및 광고, 비속어가 포함된 내용의 후기 (비노출 대상)</li>
						</ul>
						
						<form method="post" action="WriteReviewController?productId=${product.productId}" enctype="multipart/form-data">
							<table class="table">
							    <thead class="table-dark">
							      <tr>
							        <th style="width:400px;">상품정보/리뷰쓰기</th>
							        <th></th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							      	<td>상품정보</td>
							      	<td>
							      		<!-- 이부분은 product 객체를 받아올 수 있도록 해야함! -->
								      	<ul class="info" style="margin-left: 0px; padding-left: 0px;">
											<li class="name"> <strong>상품명: </strong>${product.productName}</li>
											<li class="option"> <strong>회사: </strong>${product.company}</li>
										</ul>
									</td>
							      </tr>
							      
							      <tr>
							      	<td>사진</td>
							        <td colspan="2" >
								       <div align="left" class="form-group filebox">
											<input type="file" id="reviewattach" name="reviewattach" class="from-control-file"/>
										</div>
						        	</td>
							      </tr>
							      
							      <tr>
							      	<td>별점</td>
							        <td id="review-point" colspan="2">
								        <div class="star-block d-flex justify-content-left" style="width:800px; margin: 20px auto 20px auto;">
								        	<div class="input-group">
										        <select class="form-select" id="star" name="star" onchange="starFn()">
										            <option selected>-- 선택하기 --</option>
										            <option value="1">⭐</option>
										            <option value="2">⭐⭐</option>
										            <option value="3">⭐⭐⭐</option>
										            <option value="4">⭐⭐⭐⭐</option>
										            <option value="5">⭐⭐⭐⭐⭐</option>
										        </select>
										    </div>
								        </div>
								    </td>
							      </tr>
							      
							      <tr>
							      	<td>상품평</td>
							        <td id="review-content" colspan="2">
							        	<div class="mypost">
									        <div class="form-floating mb-3">
									            <label for="reviewTitle">제목</label>
									            <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" placeholder="title">
									        </div>
									        <div class="form-floating mb-5">
										        <label for="floatingTextarea2">내용</label>
										        <textarea id="reviewContent" class="form-control" placeholder="Leave a comment here" name="reviewContent"></textarea>
										    </div>
									    </div>
							        </td>
							      </tr>
							    </tbody>
						  	</table>
						  	
						  	<button type="submit" class="btn btn-warning">게시물쓰기</button>
					  	</form>
				  	</div>
				</div>
			</div>
		</div>
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	
