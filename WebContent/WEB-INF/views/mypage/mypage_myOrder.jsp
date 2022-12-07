<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		<style>
			#navbar {
				margin: 0 auto;
				height: 50px;
				border-top: 1px groove gray;
				border-bottom: 1px groove gray;
				padding-left:100px;
			}
			
			.shoesmain {
				width: 1400px;
				margin:0 auto !important;
			}
			
			#mypage_sidebar {
				background-color:#F5F5F5;
				top: 250px;
				bottom: 150px;
				right: 10px; 
				width: 200px; 
				height:1000px;
				margin-left: 15px;
				padding-top:30px; 
				padding-bottom:30px;
				font-size:13px;
			    align-self: flex-start;
			    top: 0;
			}
			
			#mainDiv{
				width: 1000px;
				margin-left: 92px;
			}
			
			#mypage_sidemenu>a{
				border:none;
				color:black;
				background-color: #F5F5F5;
			}
			
			#mypage_sidemenu>a:hover{
				background-color: #708090;
				color:white;
				text-decoration: none;
			}
			
			/* 메인내용 */
			/* .table-striped>tbody>tr:nth-child(odd)>td, 
			.table-striped>tbody>tr:nth-child(odd)>th {
   					background-color: LightGray; 
			 } */
			
			.btn {
				margin: 2px 2px;
			}
			
			.ubtn {
				width: 100px;
				font-size: 11px;
				text-align: center;
			}
			
			.image-block>img{
				width:100px;
			}
			.buttons{
				align-content: center;
			}
			
			li{
			text-align: left;
			list-style: none;
			}
			
			.n-row{
				display: flex;
				padding:10px;
			}
			.table td, th{
			text-align: center;
    		vertical-align: middle;
   			 }
			
			
			.pbtn {
				font-size: 5px;
			}
			
			.btn-light {
				border: 1px solid gray;
			}

		</style>

		
		<!-- orderList -->
		<script>
			function claimHandler1(){
				console.log("환불 요청");
			}
			function claimHandler2(){
				console.log("후기 작성");
			}
		</script>
		
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
	<body>
	
	<!-- 메인페이지 -->
	<div class="shoesmain d-flex" >
		<div class="shoesmain-1 col-xs-2"> 
		
		<%@ include file="/WEB-INF/views/fragment/mypage_sidebar.jsp" %>
		
		</div>
		
		<!-- main -->
		<div class="shoesmain-2 col-xs-10">
			
			<div id="mainDiv" class="content">
				<h1 class="title m-5">주문/배송 조회</h1>
				<div id="orderhistory">
					<table class="table table-hover">
						<thead class="table-dark">
						<tr>
							<th scope="col">NO</th>
							<th scope="col">상품정보</th>
							<th scope="col">주문일자</th>
							<th scope="col">주문번호</th>
							<th scope="col">주문금액(수량)</th>
							<th scope="col" colspan="2">주문상태</th>
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
							<td>2022.11.10</td>
							<td>202211100417370001</td>
							<td>50000원<br>
								<span class="txt-default">1개</span>
							</td>
							<td style="text-align:center; padding:20px;">배송 완료
							<div id="buttons" class="d-flex flex-column">
								<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">환불 요청</button>
								<a role="button" href="write_review.html" class="btn btn-secondary btn-sm" >후기 작성</a>
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
							<td>2022.11.11</td>
							<td>202211100417370002</td>
							<td>74700원<br>
								<span class="txt-default">1개</span>
							</td>
							<td style="text-align:center; padding:20px;">배송 완료
								<div id="buttons" class="d-flex flex-column">
									<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">환불 요청</button>
									<a role="button" href="write_review.html" class="btn btn-secondary btn-sm" >후기 작성</a>
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
							<td>2022.11.11</td>
							<td>202211100417370003</td>
							<td>70000원<br>
								<span class="txt-default">1개</span>
							</td>
							<td style="text-align:center; padding:20px;">배송 완료
								<div id="buttons" class="d-flex flex-column">
									<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">환불 요청</button>
									<a role="button" href="write_review.html" class="btn btn-secondary btn-sm" >후기 작성</a>
								</div>
							</td>
						</tr>
						</tbody>
						
					</table>
				</div>
			</div>
			
		</div>
	</div>
	</body>
</html>