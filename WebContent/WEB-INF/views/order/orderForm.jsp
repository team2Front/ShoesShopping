<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<!-- 추가 CSS -->
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/customCheckbox.css">
		<link rel="stylesheet" href="../resources/css/customRadio.css">
		
		<script>
			$(document).ready(function(){
				  var currentPosition = parseInt($("#quickmenu").css("top"));
				  $(window).scroll(function() {
				    var position = $(window).scrollTop(); 
					  console.log("~~~~" + position+currentPosition);
					  var tmp = position+currentPosition;
					  if(tmp <= 200) tmp = 300;
// 					  if(tmp >= 1400) tmp = 800;
				    $("#quickmenu").stop().animate({"top":tmp+"px"},100);
				  });
				  
				  console.log("!!!  " + currentPosition);
				});
		
		</script>
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
			       			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			</div>
	    </div>
	    
	  </div>
		  
		<div id="navbar">
			<div class="btn-group">
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
		<div class="shoesmain container-fluid">
			<div id="wrapper" style="height:1000px; padding-top: 60px;" >
	<!-- 				주문서 작성 제목 -->
				<div style="margin-bottom: 20px;">
				 <h2 class="mb-6">주문서 작성/결제</h2>
				 <b>주문 리스트</b>
				</div>

				 
				 <div style="height: 1200px; width:700px;">
<!-- 					 <div style="display: flex;"> -->
					 		<!-- 				주문 리스트 -->
						<table class="table">
						  <thead style="background-color: #f0f0f0; border-top: 3px solid #000;">
						    <tr>
						      <th class="col-2" >배송: 3개</th>
						      <th class="col-4"></th>
						      <th class="col-2"></th>
						      <th class="col-2"></th>
						      <th class="col-2"></th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th><img src="../resources/images/shoes1.png" style="width: 100px; height: 100px;"></th>
						      <th>아키클래식1</th>
						      <td>수량: 1</td>
						      <td>색상: beige</td>
						      <td>사이즈 : 220</td>
						    </tr>
						    <tr>
						      <th><img src="../resources/images/shoes1.png" style="width: 100px; height: 100px;"></th>
						      <th>아키클래식2</th>
						      <td>수량: 1</td>
						      <td>색상: black</td>
						      <td>사이즈 : 270</td>
						    </tr>
						    <tr>
						      <th><img src="../resources/images/shoes1.png" style="width: 100px; height: 100px;"></th>
						      <th>아키클래식2</th>
						      <td>수량: 1</td>
						      <td>색상: blue</td>
						      <td>사이즈 : 280</td>
						    </tr>
						  </tbody>
						</table>
					 		<!-- 				주문 고객 정보 -->
							<div class="mt-5" style="margin-bottom: 20px;">
							 <b>주문 고객정보</b>
							</div>
							<table class="table">
							  <tbody>
							    <tr style="border-top: 4px solid #000;">
							      <th>이름</th>
							      <td></td>
							      <td>신정은</td>
							    </tr>
							    <tr>
							      <th>휴대폰번호</th>
							      <td></td>
							      <td>010-1234-5678</td>
							    </tr>
							    <tr>
							      <th>주소</th>
							      <td></td>
							      <td>혜화역</td>
							    </tr>
							   
							  </tbody>
							</table>							
							<div class="btn-dark" type="button" style=" width:400px; padding:10px; text-align:center; justify-content: center; margin-left: 90px; margin-top: 100px" data-toggle="modal" data-target="#putCart" >
								<b>주문하기</b>
							</div>
							<div class="modal fade" id="putCart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog  modal-dialog-centered">
									<div class="modal-content">
									  <div class="modal-header">
									    <h5 class="modal-title" id="exampleModalLabel">SaShoes</h5>
									    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									      <span aria-hidden="true">&times;</span>
									    </button>
									  </div>
									  <div class="modal-body">
									    <p>주문이 완료되었습니다 !</p>
									  </div>
									  <div class="modal-footer">
									    <a type="button" class="btn btn-primary"  href="shopping/mypage/MyOrderController">확인</a>
									  </div>
									</div>
								</div>
							</div>
					 	</div>
			 		<!-- 				결제 정보 오른쪽 사이드에 항상 따라다니도록 -->
					 	<div id="quickmenu" class="p-3" style="border: 4px solid black; left: 960px; position: absolute; width: 400px; margin-left: 100px; top:300px;">
					 		<div class="mt-2 mb-2" style="padding-bottom: 20px; border-bottom: 3px solid black;">
							 <b>결제 정보</b>
							</div>
							<div class="row row-cols-3">
								<div class="col-4">상품1</div>
								<div class="col-4"></div>
								<div class="col-4">109,000원</div>
							</div>
							<div class="row row-cols-3">
								<div class="col-4">상품2</div>
								<div class="col-4"></div>
								<div class="col-4">109,000원</div>
							</div>
							<div class="row row-cols-3">
								<div class="col-4">상품 3</div>
								<div class="col-4"></div>
								<div class="col-4">327,000원</div>
							</div>
							
							<div class="mb-1 mt-2" style="border-bottom: 3px solid black;"></div>
							<div class="row row-cols-3 mt-3" >
								<div class="col-4" ><b>총 정상가</b></div>
								<div class="col-4"></div>
								<div class="col-4" style="color:red; font-weight:bold">218,000원</div>					
							</div>
					 	</div>
					 </div>
				 </div>
				 
	</body>
</html>