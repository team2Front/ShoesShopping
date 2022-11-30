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
		<!-- 공통 css -->
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
	
	<body>
	  <div class="banner d-flex justify-content-between align-items-center">  
	    <div class="p-2"><a href="/shopping/mypage/MainController" ><img src="../resources/images/sashoes_Logo2.png" style="width:170px; "/></a></div>
	    
	    <div class="p-2">
		    <div class="row">
		    	<input class="search col-10 search-txt" type="text" placeholder="검색어를 입력해 주세요">
				<button class="search_button col-2 btn-primary" type="submit">찾기</button>
		    </div>
		</div>
		
		<!--------------------------------------------------------- 회원가입 창 --------------------------------------->
	    <div class="p-2">
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
			            <img class="card-img-top rounded img-fluid" src="images/research/research-1.jpg">
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
		<a href="home.html" ><img src="../resources/images/sashoes_Logo2.png" style="width:170px; "/></a>
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
		<div class="shoesmain-1 col-xs-2"> 
			<div id="mypage_sidebar" class="text-center">		
				<div class="m-3">
					<i class="bi bi-person-circle"></i><span>  환영합니다</span>
				</div>
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
		<div class="shoesmain-2 col-xs-10">
			<!-- 기본회원정보 -->
			<div id="mainDiv" class="card my-3">
				<div class="card-header" style="background-color: LightGray;">
					<strong style="font-size: 35px;">기본 회원정보</strong>
					<span class="ml-3" style="color: DimGray; font-size: 25px;"><b>필수</b></span>
				</div>
				<div class="card-body">
					<table class="table table-striped">
					    <tbody>
					      <tr>
					        <td class="pt-5">사진</td>
					        <td id="userPhoto" class="py-0">
					        	<div id="profile" class="d-flex align-items-center" style="height:120px;">
									<i class="bi bi-person-square " style="font-size: 6rem; color: Silver;"></i>
					        		<small id="photoHelp" class="form-text text-muted my-0 mx-3" >회원님을 알릴 수 있는 사진을 등록해주세요.
					        												   			 <br>등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</small>
					        	</div>
 								<!-- 사진변경 버튼 누르면 생김 -->
 								<div class="mb-2">
 									<label id="choicePhoto" class="pbtn btn btn-light my-0" for="input-file" style="display: none;">업로드</label>
									<input type="file" id="input-file" style="display:none;"/> 
 									<button id="orginPhoto" class="pbtn btn btn-light" onclick="defaultPhoto()" style="display: none;">기본이미지로 변경</button>
 								</div>
				        	</td>
					        <td class="pt-5">
					        	<div><button id="changePhoto" class="ubtn btn btn-secondary btn-sm" onclick="changePhoto()">사진변경</button></div>
					        	<div><button id="cancelPhoto" class="ubtn btn btn-light btn-sm" onclick="cancelPhoto()" style="display: none;">취소</button></div>
				        	</td>
					      </tr>
					      <tr>
					        <td>아이디</td>
					        <td id="userId"><strong>로그인한 아이디</strong></td>
					        <td></td>
					      </tr>
					      <tr>
					        <td>비밀번호</td>
					        <td>
					        	<div id="defaultPw"><strong>*******</strong></div>
					        	<div id="modifyPw" style="display: none; font-style: oblique; font-size: 10px;">
				        			<div><label class="mr-4">현재 비밀번호</label><input type="password"></div>
				        			<div><label class="mr-4">신규 비밀번호</label><input type="password"></div>
				        			<div><label style="margin-right: 15px;">비밀번호 재입력</label><input type="password"></div>
					        	</div>
				        	</td>
					        <td>
					        	<div><button id="changePw" class="ubtn btn btn-secondary btn-sm" onclick="changePwDiv()">비밀번호 변경</button></div>
					        	<div><button id="cancelPw" class="ubtn btn btn-light btn-sm" onclick="cancelPwDiv()" style="display: none;">취소</button></div>
				        	</td>
					      </tr>
					      <tr>
					        <td>이름</td>
					        <td id="userName"><strong>입력했던 이름</strong></td>
					        <td><button id="changeName" class="ubtn btn btn-secondary btn-sm">이름 변경</button></td>
					      </tr>
					      <tr>
					        <td>닉네임</td>
					        <td id="userNickName"><strong>입력했던 닉네임</strong></td>
					        <td><button id="changeName" class="ubtn btn btn-secondary btn-sm">닉네임 변경</button></td>
					      </tr>
					      <tr>
					        <td>주소</td>
					        <td id="userAddress"><strong>입력했던 주소</strong></td>
					        <td><button id="changeAddress" class="ubtn btn btn-secondary btn-sm">주소 변경</button></td>
					      </tr>
					      <tr>
					        <td>핸드폰번호</td>
					        <td id="userPhoneNum"><strong>010-****-1234</strong></td>
					        <td><button id="changePhone" class="ubtn btn btn-secondary btn-sm">핸드폰번호 변경</button></td>
					      </tr>
					    </tbody>
				  	</table>
			  	</div>
			</div>
			<!-- 추가회원정보 -->
			<div id="mainDiv" class="card" style="margin-top: 50px;">
				<div class="card-header" style="background-color: LightGray;">
					<strong style="font-size: 35px;">추가 회원정보</strong>
					<span class="ml-3" style="color: DimGray; font-size: 25px;"><b>선택</b></span>
				</div>
				<div class="card-body">
					<table class="table table-striped">
					    <tbody>
					      <tr>
					        <td style="width:140.03px;">생년월일</td>
					        <td id="userName" style="width:645.63px;"><strong>2022.11.25</strong></td>
					        <td><button id="changeName" class="ubtn btn btn-secondary btn-sm">변경</button></td>
					      </tr>
					      <tr>
					        <td>주소</td>
					        <td id="userAddress"><strong>키/몸무게</strong></td>
					        <td><button id="changeAddress" class="ubtn btn btn-secondary btn-sm">변경</button></td>
					      </tr>
					      <tr>
					        <td>성별</td>
					        <td id="userGender"><strong>입력했던 성별</strong></td>
					        <td><button id="changeAddress" class="ubtn btn btn-secondary btn-sm">변경</button></td>
					      </tr>
					    </tbody>
				  	</table>
			  	</div>
			</div>
			
		</div>
	</div>
	</body>
</html>