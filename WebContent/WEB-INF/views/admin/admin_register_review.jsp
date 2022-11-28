<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- 추가코드 -->
		<link rel="stylesheet" href="../css/customCheckbox.css">
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="../css/shoescolors.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<style>
		</style>

	</head>
	<body>
		<!-- 배너 -->
		<div id="banner">
			<div style="width:500px; margin:0px auto;">
    			<a href="admin_home.html"><img src="../images/sashoes_logo.png" style="width:250px; height:100px;"/></a>
   				<span class="banner-font p-2">관리자</span>
			</div>	  	
	  	</div>

		<!-- 메인부분 -->
		<div id="mainDiv" class="content">
			<div id="review-list-header"><h1 class="title m-5">내 리뷰 조회</h1></div>
			<ul class="n-info-txt">
				<li>지금까지 고객님께서 작성하신 리뷰를 확인하실 수 있습니다</li>
				<li>리뷰 작성은 구매리스트를 통해 가능합니다</li>
			</ul>
			<div id="review-list">
				<div id="review-list-header">
				
				</div>
				<table class="table table-hover">
					<thead class="table-dark">
					<tr>
						<th scope="col">NO</th>
						<th scope="col" style="width:330px">상품정보</th>
						<th scope="col" colspan="3">작성내용</th>
						<th></th>
					<tr>
					</thead>
					<tbody class="table-group-divider">
					<tr>
						<th scope="row">1</th>
						<td>
							<div class="n-row">
								<a href="#" class="image-block"><img src="../images/반스_월버_노랑.jpg"/></a>
								<ul class="info">
									<li class="brand">반스</li>
									<li class="name">윌버 노랑</li>
									<li class="option">옵션: 노랑, 사이즈: 240</li>
								</ul>
							</div>
						</td>
						<td colspan="3">
							<div id="review-info">
								<ul id="review-detail">
									<li class="order-num">202211100417370001</li>
									<li class="review-stars">⭐⭐⭐⭐⭐</li>
									<li class="review-contents">좋아요~~~편하고 예뻐요!</li>
									<li class="review-comment">
										댓글 <span class="review-comment-reply-cnt">0개</span>
									</li>
								</ul>
							</div>
						</td>
						<td style="text-align:center;">
							<div id="buttons" class="d-flex flex-column">
								<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">수정하기</button>
								<button class="btn btn-secondary btn-sm" type="button" onclick="claimHandler2()">삭제하기</button>
							</div>
						</td>
					</tr>
					<!-- 주문 2 -->
					<tr>
					<th scope="row">2</th>
						<td>
							<div class="n-row">
								<a href="#" class="image-block"><img src="../images/컨버스_척테일러올스타코어_검정.jpg"/></a>
								<ul class="info">
									<li class="brand">컨버스</li>
									<li class="name">척테일러올스타코어</li>
									<li class="option">옵션: 검정, 사이즈: 240</li>
								</ul>
							</div>
						</td>
						<td colspan="3">
							<div id="review-info">
								<ul id="review-detail">
									<li class="order-num">202211100417370002</li>
									<li class="review-stars">⭐⭐⭐⭐⭐</li>
									<li class="review-contents">좋아요~~~편하고 예뻐요!</li>
									<li class="review-comment">
										댓글 <span class="review-comment-reply-cnt">0개</span>
									</li>
								</ul>
							</div>
						</td>
						<td style="text-align:center;">
							<div id="buttons" class="d-flex flex-column">
								<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">수정하기</button>
								<button class="btn btn-secondary btn-sm" type="button" onclick="claimHandler2()">삭제하기</button>
							</div>
						</td>
					</tr>
					
					<!-- 주문3 -->
					<tr>
					<th scope="row">3</th>
						<td>
							<div class="n-row">
								<a href="#" class="image-block"><img src="../images/아디다스_가젤.jpg"/></a>
								<ul class="info">
									<li class="brand">아디다스</li>
									<li class="name">가젤</li>
									<li class="option">옵션: 검정, 사이즈: 240</li>
								</ul>
							</div>
						</td>
						<td colspan="3">
							<div id="review-info">
								<ul id="review-detail">
									<li class="order-num">202211100417370003</li>
									<li class="review-stars">⭐⭐⭐⭐⭐</li>
									<li class="review-contents">좋아요~~~편하고 예뻐요!</li>
									<li class="review-comment">
										댓글 <span class="review-comment-reply-cnt">0개</span>
									</li>
								</ul>
							</div>
						</td>
						<td style="text-align:center;">
							<div id="buttons" class="d-flex flex-column">
								<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">수정하기</button>
								<button class="btn btn-secondary btn-sm" type="button" onclick="claimHandler2()">삭제하기</button>
							</div>
						</td>
					</tr>
					
					</tbody>
					
				</table>
			</div>
		</div>
	</body>
</html>