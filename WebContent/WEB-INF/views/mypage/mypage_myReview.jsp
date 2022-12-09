<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
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
		
	</head>
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>

	<!-- 메인페이지 -->
	<div class="shoesmain d-flex" >
		<div class="shoesmain-1 col-xs-2"> 
			<%@ include file="/WEB-INF/views/fragment/mypage_sidebar.jsp"%>
		</div>
	</div>
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>