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
	
		<!-- 메인페이지 -->
		<div class="shoesmain d-flex" >
			<div class="col-xs-2"> 
			
			<%@ include file="/WEB-INF/views/fragment/mypage_sidebar.jsp" %>
			
			</div>
			
			<!-- main -->
			<div class="col-xs-10">
				<div id="mainDiv" class="card my-3">
					<div class="card-header" style="background-color: LightGray;">
						<strong style="font-size: 35px;">회원탈퇴</strong>
					</div>
					<form method="post"	id="deleteUserForm" name="deleteUserForm" action="${pageContext.request.contextPath}/mypage/UserDeleteController?userId=${loginId}">
						<div class="card-body">
			   			 		<strong>비밀번호 </strong>
			   			 		<input type="password" id="userPw" class="mx-2" name="userPw"/>
			   			 		<input type="submit" class="btn-dark" value="확인"/>
						</div>
					</form>
				</div>
			</div>
		</div>
		
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	