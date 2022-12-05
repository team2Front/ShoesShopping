<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	<script src="../resources/javascript/review_qna.js"></script>
		
	</head>

	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>	
		<div class="container-fluid row">
			<!-- 사이드바  -->
			<div class="shoesmain-1 col-sm-2"> 
				<div id="mypage_sidebar"  class="text-center">		
					<div class="m-3">
						<i class="bi bi-person-circle"></i><span>  환영합니다</span>
					</div>
					 <div class="" id="mypageDiv" style="height:45px; text-align:center; padding-top:10px; ">
						 <a href="mypage_main.html" class="h5" style="color: black; text-decoration: none;"><b>마이 페이지</b></a>
					 </div>
					<div id="mypage_sidemenu">
						 <a href="mypage_main.html" class="list-group-item text-center h7">나의 정보</a>
						<a role="button" onclick="requestMyOrder()" class="list-group-item text-center h7">주문 내역</a>
						 <a role="button" onclick="requestMyReview()" class="list-group-item text-center h7">나의 리뷰</a>
						 <a href="#" class="list-group-item text-center h7">회원 탈퇴</a>
					 </div>
				</div>
			</div>
			
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
						
						<form method="post" action="WriteReviewController" enctype="multipart/form-data">
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
											<li class="brand"> <strong>브랜드: </strong> 아디다스</li>
											<li class="name"> <strong>상품명: </strong> 가젤</li>
											<li class="option"> <strong>색상: </strong> 검정</li>
											<li class="option"> <strong>사이즈: </strong> 250</li>
										</ul>
									</td>
							      </tr>
							      
							      <tr>
							      	<td>사진</td>
							        <td colspan="2" >
								       <div align="left" class="form-group filebox">
											<input class="upload-name" value="파일선택" disabled="disabled">
											
							        		<label class="btn btn-outline-secondary btn-sm" for="rattach">사진 첨부</label>
											<input type="file" id="rattach" name="rattach" class="upload-hidden" style="display: none;"/>
										</div>
						        	</td>
							      </tr>
							      
							      <tr>
							      	<td>별점</td>
							        <td id="review-point" colspan="2">
								        <div class="star-block d-flex justify-content-left" style="width:800px; margin: 20px auto 20px auto;">
								        	<div class="input-group">
										        <select class="form-select" id="star">
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
										        <textarea id="review-content" class="form-control" placeholder="Leave a comment here"></textarea>
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
