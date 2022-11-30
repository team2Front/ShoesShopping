<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		
		<!-- resource/css 링크 -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/productList.css">
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		
		<!-- font 링크 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<script>
		/* function requestAdminReview(){
			$.ajax({
				url: "admin_register_review.html",
				type: "get",
				success: function(data){
					$(".shoesmain-2").html(data);
				}
			});
		} */
	</script>
	
	<body>
		<!-- 배너창 -->
	    <div id ="adminBanner" class="d-flex align-items-center">
    		<div class="adminLogo">
   				<a href="/shopping/admin/HomeController"><img src="../resources/images/sashoes_logo.png"/></a>
			</div>	
			<div class="adminBanner-font p-2" style="white-space:nowrap;">관리자</div>
			
	    	<div class="logoutButton"><button id="logout" class="btn btn-secondary btn-sm mx-5" style="width:90px;">로그아웃</button></div>
	    </div>
	  	
	  	<!-- 메뉴바 -->
		<div id="adminNavbar" class="shadow-sm d-flex align-items-center">
			<div class="btn-group">
				<button id="draopdownBtn" type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="margin-left: 150px;">
					MEN
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">남성 운동화</a>
					<a class="dropdown-item" href="#">남성 스니커즈</a>
					<a class="dropdown-item" href="#">남성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button id="draopdownBtn" type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
					WOMEN
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">여성 운동화</a>
					<a class="dropdown-item" href="#">여성 스니커즈</a>
					<a class="dropdown-item" href="#">여성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button id="draopdownBtn" type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
					KIDS
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">아이 운동화</a>
					<a class="dropdown-item" href="#">아이 스니커즈</a>
					<a class="dropdown-item" href="#">아이 샌들</a>
				</div>
			</div>	
			
			<!-- 관리자 버튼(상품등록/관리자등록/QnA/Review) -->
			<div id="adminButton" style="margin-left: 150px;"> 
				<button type="button" class="btn btn-warning btn-sm mt-1 ml-4" onclick="location.href='/shopping/admin/Register_ProductController'">상품 등록</button>
			</div>
			<div id="adminButton"> 
				<button type="button" class="btn btn-warning btn-sm mt-1 ml-4" onclick="location.href='/shopping/admin/Register_NewAdminController'">관리자 등록</button>
			</div>
			<div id="adminButton"> 
				<button type="button" class="btn btn-warning btn-sm mt-1 ml-4" onclick="location.href='/shopping/admin/Register_ReviewController'">리뷰</button>
				<!-- <a role="button" onclick="requestAdminReview()" class="list-group-item text-center h7">리뷰</a> -->
			</div>
			<div id="adminButton"> 
				<button type="button" class="btn btn-warning btn-sm mt-1 ml-4" onclick="location.href='register_admin.html'">QnA</button>
			</div>
		</div>
		
		<!-- 메인부분 -->
		<div class="shoesmain d-flex" >
			<!-- 사이드 바  -->
			<div id="sidebar" class="col-xs-2">		
				 <button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				   Color
				 </button>
				<div class="collapse mb-2" id="collapseExample">
				  <div class="card card-body shoesColors">
					  <div class = "row">
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="red"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="orange"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="yellow"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="green"></div>
			  		</div>
			  		
			  		<div class = "row">
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="blue"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="lime"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="navy"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="purple"></div>
			  		</div>
			  		
			  		<div class = "row">
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="pink"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="brown"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="black"></div>
					  	<div class="col-2 m-1 color-box"><input type="checkbox" class="gray"></div>
			  		</div>
			  
				  </div>
				</div>
				
				<button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
				   Size
				 </button>
				<div class="collapse mb-2" id="collapseExample2">
				  <div class="card card-body">
					  <div class = "row">
						  	<div class="btn size-btn col m-1 border border-6">215</div>
						  	<div class="btn col m-1 border border-6">220</div>
						  	<div class="btn col m-1 border border-6">225</div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="btn col m-1 border border-6">230</div>
						  	<div class="btn col m-1 border border-6">235</div>
						  	<div class="btn col m-1 border border-6">240</div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="btn col m-1 border border-6">245</div>
						  	<div class="btn col m-1 border border-6">250</div>
						  	<div class="btn col m-1 border border-6">255</div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="btn col m-1 border border-6">260</div>
						  	<div class="btn col m-1 border border-6">270</div>
						  	<div class="btn col m-1 border border-6">280</div>
				  		</div>
				  </div>
				</div>
				
				<button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">
				   Price
				 </button>
				<div class="collapse mb-2" id="collapseExample3">
				  <div class="card card-body">
				  	<div class = "container-fluid">
				  		<div class="row pl-4">
				  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">
							    0 ~ 50,000 원
							  </label>
				  		</div>
				  		
				  		<div class="row pl-4">
				  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">
							    50,000 ~ 80,000 원
							  </label>
				  		</div>
				  		
				  		<div class="row pl-4">
				  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">
							    80,000 ~ 100,000 원
							  </label>
				  		</div>
				  		
				  		<div class="row pl-4">
				  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">
							    100,000 ~ 150,000 원
							  </label>
				  		</div>
				  		
				  		<div class="row pl-4">
				  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">
							    150,000 ~ 300,000 원
							  </label>
				  		</div>
				  	</div>					
				  </div>
				</div>
				
			</div>
				
			<!-- 상품리스트 -->
			<div id="products" class="mx-5 col-xs-10" style="width:1000px;">
				<div class="ml-4">
					<input class="search search-txt" type="text" style="width:300px;" placeholder="검색어를 입력해 주세요">
					<button class="btn btn-secondary" type="submit">찾기</button>
				</div> 
				<div class="d-flex justify-content-between flex-wrap" style="width:1000px;" >
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/반스_월버_노랑.jpg">
						</div>
						<div class="card-body">
						    <p class="card-brand m-0">반스</p>
						    <h5 class="card-title">윌버</h5>
						    <p class="card-text">
						    <span class="sale" style="color:red">50000원</span>
						    </p>
						    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>
						    <a href="/shopping/product/ProductController.html" class="btn btn-primary">자세히보기</a>
						 </div>
					</div>
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/아디다스_가젤.jpg">
						</div>
					  	<div class="card-body">
					  		<p class="card-brand m-0">아디다스</p>
						    <h5 class="card-title">가젤</h5>
						    <p class="card-text">
						    <span class="sale" style="color:red">70000원</span>
						    </p>
						    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
						    <a href="#" class="btn btn-secondary">자세히보기</a>
						    <a href="#" class="btn btn-primary">삭제</a>
					  	</div>
			        </div>
			        
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/아디다스_그랜드코트베이스_검정.jpg">
						</div>
						<div class="card-body">
							<p class="card-brand m-0">아디다스</p>
						    <h5 class="card-title">그랜드코트베이스</h5>
						    <p class="card-text">
						    <span class="sale" style="color:red">64000원</span>
						    </p>
						    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>
						    <a href="#" class="btn btn-primary">자세히보기</a>
						 </div>
					</div>
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/아디다스_스탠스미스_하양.jpg">
						</div>
					  	<div class="card-body">
					  		<p class="card-brand m-0">아디다스</p>
						    <h5 class="card-title">스탠스미스 흰색</h5>
						    <p class="card-text">
						    <span class="sale" style="color:red">45000원</span>
						    </p>
  							    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
						    <a href="#" class="btn btn-primary">자세히보기</a>
					  	</div>
			        </div>
			       
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/아디다스_퍼피렛_검정.jpg">
						</div>
					  <div class="card-body">
					  	<p class="card-brand m-0">아디다스</p>
						<h5 class="card-title">퍼피렛 검정</h5>
					    <p class="card-text">
					    <span class="sale" style="color:red">36400원</span>
					    </p>
					    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
					    <a href="#" class="btn btn-primary">자세히보기</a>
					  </div>
					</div>
					<div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/아디다스_퍼피렛_하양.jpg">
						</div>
					  <div class="card-body">
					  	<p class="card-brand m-0">아디다스</p>
						<h5 class="card-title">퍼피렛 흰색</h5>
					    <p class="card-text">
					    <span class="sale" style="color:red">37400원</span>
					    </p>
					    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
					    <a href="#" class="btn btn-primary">자세히보기</a>
					  </div>
			        </div>
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/컨버스_척테일러올스타70.jpg">
						</div>
					  <div class="card-body">
					  	<p class="card-brand m-0">컨버스 </p>
						<h5 class="card-title">척테일러올스타70</h5>
					    <p class="card-text">
					    <span class="sale" style="color:red">74400원</span>
					    </p>
					    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
					    <a href="#" class="btn btn-primary">자세히보기</a>
					  </div>
			        </div>
			        <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resources/images/컨버스_척테일러올스타코어_검정.jpg">
						</div>
					  <div class="card-body">
					  	<p class="card-brand m-0">컨버스 </p>
						<h5 class="card-title">척테일러올스타코어</h5>
					    <p class="card-text">
					    <span class="sale" style="color:red">74700원</span>
					    </p>
					    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
					    <a href="#" class="btn btn-primary">자세히보기</a>
					  </div>
			        </div>
			       
			         <div class="card">
			           <div class="card-head">
						  <img class="card-img-top" src="../resource/images/아디다스_슈퍼스타_82.jpg">
						</div>
					  <div class="card-body">
					  	<p class="card-brand m-0">아디다스 </p>
						<h5 class="card-title">슈퍼스타</h5>
					    <p class="card-text">
					    <span class="sale" style="color:red">65000원</span>
					    </p>
					    <a href="#"><img src="../resources/images/heart_empty.png" style="width:20px; height:20px">찜 하기</a>							    
					    <a href="#" class="btn btn-primary">자세히보기</a>
					  </div>
			        </div>
			      </div>
			  </div>
		  </div>
</body>
</html>