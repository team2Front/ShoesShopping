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
		<script>
			
		</script>
		<style>
			#navbar {
				margin: 0 auto;
				height: 50px;
				border-top: 1px groove gray;
				border-bottom: 1px groove gray;
				padding-left:100px;
			}
			
			.shoesmain{
				width: 1400px;
				margin:0 auto !important;
			}
			
			#mypage_sidebar {
				background-color:#F5F5F5;
				position: sticky; 
				top: 250px; 
				bottom: 150px;
				right: 10px; 
				width: 200px; 
				height:1000px;
				padding-top:30px; 
				padding-bottom:30px;
				font-size:13px;
			    align-self: flex-start;
			    top: 0;
			}
			
			#mainDiv{
				width:95%;
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
   			 
   			 /* 리뷰 작성창 */
   			 .mypost {
            width: 95%;
            max-width: 800px;
            margin: 20px auto 20px auto;

            box-shadow: 0px 0px 3px 0px black;
            padding: 20px;
	        }
	        
	
	        .mypost > button {
	            margin-top: 15px;
	        }
	        #review-content{
	        	height: 150px;
	        }
	        .mybtns {
	            display: flex;
	            flex-direction: row;
	            align-items: center;
	            justify-content: center;
	
	            margin-top: 20px;
	        }
	        .mybtns > button {
	            margin-right: 10px;
	        }
		</style>
		
		
		
		
	</head>
	
	<body>
	  <div class="banner d-flex justify-content-between">  
	    <div class="p-2"><a href="home.html" ><img src="../resources/images/sashoes_logo.png" style="width:150px; height: 100px"/></a></div>
	    
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
			
			 <!--------------------------------------------------------- 로그인 창 --------------------------------------->
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
		<a href="home.html" ><img src="../resources/images/sashoes_logo.png" style="width:100px"/></a>
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
		<div class="shoesmain-1 col-md-2"> 
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
		<div class="shoesmain-2 col-md-10">
			<div id="mainDiv" class="card">
				<div id="review-list-header"><h1 class="title mx-5 mt-5 mb-3">리뷰 작성하기</h1></div>
					<ul class="n-info-txt mb-3">
						<li>SaShoes에서 구매해주셔서 감사합니다</li>
						<li>리뷰 작성은 판매자에게 큰 힘이 됩니다!^-^)/</li>
					</ul>
					<ul>
						<li>아래에 해당할 경우 관리자에 의해 삭제될 수 있습니다.</li>
						<li> - 상품과 관련없거나 문자 및 기호의 단순 나열, 반복된 내용의 후기</li>
						<li> - 개인정보 및 광고, 비속어가 포함된 내용의 후기 (비노출 대상)</li>
					</ul>
					
					<table class="table">
					    <!-- <thead class="table-dark">
					      <tr>
					        <th></th>
					        <th></th>
					        <th></th>
					      </tr>
					    </thead> -->
					    <tbody>
					      <tr>
					        <td colspan="2" >
					        <div class="image-block d-flex justify-content-left" style="width:800px; margin: 20px auto 20px auto;">
					        	<img src="../resources/images/아디다스_가젤.jpg"/>
					        	<ul class="info">
									<li class="brand">아디다스</li>
									<li class="name">가젤</li>
									<li class="option">옵션: 검정, 사이즈: 240</li>
								</ul>
					        </div>
				        	</td>
					        
					      </tr>
					      <tr>
					      	
					        <td id="review-point" colspan="2">
						        <div class="star-block d-flex justify-content-left" style="width:800px; margin: 20px auto 20px auto;">
						        	<div class="input-group">
								        <label class="input-group-text" for="inputGroupSelect01">별점</label>
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
					        <td id="review-content" colspan="2">
					        	<label for="goods_text" class="lable">상품에 대한 평가를 작성해주세요.</label>
					        	<div class="mypost">
							        <div class="form-floating mb-3">
							            <label for="floatingInput">제목</label>
							            <input type="text" class="form-control" id="review-title" placeholder="title">
							        </div>
							        <div class="form-floating mb-5">
								        <label for="floatingTextarea2">내용</label>
								        <textarea id="review-content" class="form-control" placeholder="Leave a comment here"></textarea>
								    </div>
								    <div class="mybtns">
								        <button onclick="posting()" type="button" class="btn btn-dark">기록하기</button>
								        <button onclick="close_box()" type="button" class="btn btn-outline-dark">닫기</button>
								    </div>
							    </div>
					        </td>
					      </tr>
					    </tbody>
				  	</table>
			</div>
		</div>
	</div>
		
			
	</body>
</html>