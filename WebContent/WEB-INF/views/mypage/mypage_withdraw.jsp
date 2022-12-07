<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>

		<script src="../resources/javascript/mypage.js"></script>
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
			
			.ubtn {
				width: 100px;
				font-size: 11px;
				text-align: center;
			}
			
		</style>
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
	<body>
		<!-- 메인페이지 -->
		<div class="shoesmain d-flex" >
			<div class="col-xs-2"> 
				<!-- 마이페이지_사이드바 -->
				<div id="mypage_sidebar"  class="text-center">		
					 <div class="" id="mypageDiv" style="height:45px; text-align:center; padding-top:10px; ">
						 <a href="/shopping/mypage/MainController" class="h5" style="color: black; text-decoration: none;"><b>마이 페이지</b></a>
					 </div>
					<div id="mypage_sidemenu">
						 <a href="/shopping/mypage/MainController" class="list-group-item text-center h7">나의 정보</a>
						 <a href="/shopping/mypage/MyOrderController" role="button" class="list-group-item text-center h7">주문 내역</a>
						 <a href="/shopping/mypage/MyReviewController" role="button"  class="list-group-item text-center h7">나의 리뷰</a>
						 <a href="#" role="button"  class="list-group-item text-center h7">나의 QnA</a>
						 <a href="/shopping/mypage/MyWithdrawController" class="list-group-item text-center h7">회원 탈퇴</a>
					 </div>
					
				</div>
			</div>
			
			<!-- main -->
			<div class="col-xs-10">
				<div id="mainDiv" class="card my-3">
					<div class="card-header" style="background-color: LightGray;">
						<strong style="font-size: 35px;">회원탈퇴</strong>
					</div>
					<div class="card-body">
		   			 	<form id="pwForm" action="#">
		   			 		<strong>비밀번호 </strong>
		   			 		<input type="password" id="userPw" class="mx-2" name="userPw"/>
		   			 		<button class="btn btn-secondary" type="button" onclick="pass()" data-toggle="modal" data-target="#withdrawUser"> 확인 </button>
		   			 	</form>
					</div>
				</div>
			</div>
		</div>
		
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	