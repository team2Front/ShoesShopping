<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="../resources/css/common.css">
		<script src="../resources/javascript/mypage.js"></script>
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
	
	<body>
	  <div class="banner d-flex justify-content-between">  
	    <div class="p-2"><a href="home.html" ><img src="../images/sashoes_logo.png" style="width:150px; height: 100px"/></a></div>
	    
	    <div class="p-2">
		    <div class="row">
		    	<input class="search col-10 search-txt" type="text" placeholder="검색어를 입력해 주세요">
				<button class="search_button col-2 btn-primary" type="submit">찾기</button>
		    </div>
		</div>
		
	    <div class="p-2">
	    <!--------------------------------------------------------- 로그인 창 --------------------------------------->
	    	<a href="#" data-toggle="modal" data-target="#myModal">로그인</a>
	    	<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
			    <div class="modal-dialog modal-xl modal-dialog-centered">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">사진제목</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			</div>
			
			 <!--------------------------------------------------------- 회원가입 창 --------------------------------------->
	    	<a href="#" data-toggle="modal" data-target="#myModal">회원가입</a>
	    	<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
			    <div class="modal-dialog modal-xl modal-dialog-centered">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">사진제목</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			</div>
	    </div>	    
	  </div>
	<!-- navbar -->
	<div id="navbar" class="shadow-sm">
		<a href="home.html" ><img src="../images/sashoes_logo.png" style="width:100px"/></a>
		<div class="btn-group pl-10">
			<button type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
				MEN
			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">남성 운동화</a>
				<a class="dropdown-item" href="#">남성 스니커즈</a>
				<a class="dropdown-item" href="#">남성 샌들</a>
			</div>
		</div>
		<div class="btn-group">
			<button type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
				WOMEN
			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">여성 운동화</a>
				<a class="dropdown-item" href="#">여성 스니커즈</a>
				<a class="dropdown-item" href="#">여성 샌들</a>
			</div>
		</div>
		<div class="btn-group">
			<button type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
				KIDS
			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">아이 운동화</a>
				<a class="dropdown-item" href="#">아이 스니커즈</a>
				<a class="dropdown-item" href="#">아이 샌들</a>
			</div>
		</div>	
	</div>
	
	<!-- 메인페이지 -->
	<div class="shoesmain d-flex" >
		<div class="col-xs-2"> 
			<!-- 마이페이지_사이드바 -->
			<div id="mypage_sidebar"  class="text-center">		
				<div class="m-3">
					<i class="bi bi-person-circle"></i><span>  환영합니다</span>
				</div>
				 <div class="" id="mypageDiv" style="height:45px; text-align:center; padding-top:10px; ">
					 <a href="mypage_main.html" class="h5" style="color: black; text-decoration: none;"><b>마이 페이지</b></a>
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
	   			 		<input type="password" id="userPw" class="mx-2" name="userPw" onfocusout="checkUserPass()"/>
	   			 		<button class="btn btn-secondary" type="button" onclick="pass()" data-toggle="modal" data-target="#withdrawUser"> 확인 </button>
	   			 	</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 회원탈퇴여부 -->
   	<div class="modal fade" id="withdrawUser">
	    <div class="modal-dialog modal-sm modal-dialog-centered">
	      <div class="passModal modal-content">
	      
	        <!-- Modal body -->
	        <div class="modal-body">
	        	회원탈퇴를 진행하시겠습니까?
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button class="btn btn-secondary" data-dismiss="modal">탈퇴</button>
	          <button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
	        </div>
	        
	      </div>
	    </div>
	</div>		
			
	</body>
</html>