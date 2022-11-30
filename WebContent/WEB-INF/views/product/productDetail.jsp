<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
		<script>
			function change1() {
				let img = document.querySelector("#img1");
				img.src = "../resources/images/bans/반스_월버_1.png";
			}
			
			function change2() {
				let img = document.querySelector("#img1");
				img.src = "../resources/images/bans/반스_월버_2.png";
			}
			
			function change3() {
				let img = document.querySelector("#img1");
				img.src = "../resources/images/bans/반스_월버_3.png";
			}
			
			function change4() {
				let img = document.querySelector("#img1");
				img.src = "../resources/images/bans/반스_월버_4.png";
			}
			
			function change5() {
				let img = document.querySelector("#img1	");
				img.src = "../resources/images/bans/반스_월버_5.png";
			}
			
		</script>
		<style>
		 * { 
/* 		 	border: 1px solid black;  */
		 }
		 
		 .shoes-images-review {
		 	width:100px;
		 	height:100px;
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
		 
		 
		 
		</style>
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/customCheckbox.css">
		<link rel="stylesheet" href="../resources/css/customRadio.css">
		
		<script>
			$(document).ready(function() {
				$("#qnaList tbody").on("click", "tr", function(){
					let status = $( this ).find(".qnaDetail").css("display");
	
					if(status =="none"){
						$( this ).find(".qnaDetail").css("display", "block");
					}
					else $( this ).find(".qnaDetail").css("display", "none");
	
				});
				
				
			});
		</script>
		
	</head>
	<body>
	  <div class="banner d-flex justify-content-between">  
	    <div class="p-2"><a href="home.html"><img src="../images/sashoes_logo.png" style="width:150px; margin-top:20px;"/></a></div>
	    
	    <div class="p-2">
		    <div class="row">
		    	<input class="search col-10 search-txt" type="text" placeholder="검색어를 입력해 주세요">
				<button class="search_button col-2 btn-primary" type="submit">찾기</button>
		    </div>
		</div>
		
	    <div  style="text-align: center; padding-top: 35px;"><a href="joinForm.html">회원가입</a></div>
	    <div  style="text-align: center; padding-top: 35px;"><a href="mypage_main.html">마이페이지</a></div>
	    <div  style="text-align: center; padding-top: 35px;">
	    <!--------------------------------------------------------- 로그인 창 --------------------------------------->
	    	<a href="#" data-toggle="modal" data-target="#myLogin">로그인</a>
	    	<div class="modal fade" id="myLogin">
			    <div class="modal-dialog modal-sm modal-dialog-centered">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title mx-auto">로그인</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			            <form id="loginForm" name="loginForm" action="#" onsubmit="return handleCheckData()" novalidate>
					          <div class="form-group">
					            <label for="uid">ID</label>
					            <input type="text" class="form-control" id="uid" name="uid" value=""/>
					            <small id="uidHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 6자 이상 10장 이하를 입력해주세요</small>
					          </div>
					
					          <div class="form-group">
					            <label for="password">Password</label>
					            <input type="password" class="form-control" id="password" name="password" value=""/>
					            <small id="passwordHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하를 입력해주세요</small>
					          </div>
			          	</form>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			        	<button type="submit" class="btn bg-warning" data-dismiss="modal">로그인</button>
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			</div>
			
	    </div>
	  </div>
		<div id="navbar" class="shadow-sm">
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
		<div id="wrapper" >
			<div class="row row-cols-2">
				<!-- 이미지가 나오는 사이드 바 -->
				<div id="img1" class="carousel slide col-md-6" data-ride="carousel" data-interval="0">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img id="img1" src="../resources/images/bans/반스_월버_1.png" style="width:500px; height:500px;" class="m-4"/>
						</div>
						<div class="carousel-item">
							<img id="img1" src="../resources/images/bans/반스_월버_2.png" style="width:500px; height:500px;" class="m-4"/>
						</div>
						<div class="carousel-item">
							<img id="img1" src="../resources/images/bans/반스_월버_3.png" style="width:500px; height:500px;" class="m-4"/>
						</div>
						<div class="carousel-item">
							<img id="img1" src="../resources/images/bans/반스_월버_4.png" style="width:500px; height:500px;" class="m-4"/>
						</div>
						<div class="carousel-item">
							<img id="img1" src="../resources/images/bans/반스_월버_5.png" style="width:500px; height:500px;" class="m-4"/>
						</div>
					</div>
					<a class="carousel-control-prev" href="#img1" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#img1" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
					<div class="carousel">
						<img data-target="#img1" data-slide-to="0" onclick="change1()" src="../resources/images/bans/반스_월버_1.png" style="width:90px; height:90px;"class="active m-1 ml-4"/>
						<img data-target="#img1" data-slide-to="1" onclick="change2()" src="../resources/images/bans/반스_월버_2.png" style="width:90px; height:90px;"class="m-1"/>
						<img data-target="#img1" data-slide-to="2" onclick="change3()" src="../resources/images/bans/반스_월버_3.png" style="width:90px; height:90px;"class="m-1"/>
						<img data-target="#img1" data-slide-to="3" onclick="change4()" src="../resources/images/bans/반스_월버_4.png" style="width:90px; height:90px;"class="m-1"/>
						<img data-target="#img1" data-slide-to="4" onclick="change5()" src="../resources/images/bans/반스_월버_5.png" style="width:90px; height:90px;"class="m-1"/>
					</div>
				</div>
				
				<!-- 신발에 대한 상세 설명 -->
				<div id="detail" class="col-md-6">
					<div class="container-fluid">
						<div class="row m-4" style="font-size:38px; padding:10px"> 브랜드 : 반스 </div>
						<div class="row m-4">
							<div class="col" style="font-size:32px; padding:10px">
								<b>정글 사이드월 Authentic 어센틱 44 DX</b>
							</div>
<!-- 							<div class="col-8" style="font-size:30px; padding:10px"> -->
<!-- 								카테고리 : 운동화 -->
<!-- 							</div> -->
						</div>
						<div class="row m-4" style="font-size:30px; padding:10px"><b> 9,9000원</b> </div>
						<div class="row m-4" style="font-size:15px; padding:10px">남성용</div>
						<hr/>
						<div class="row m-4">
							<div class="btn-group btn-group" style="width:620px;">
				       			<label for="pcolor" class="mx-2 my-2"><b>색상</b></label>
				       			<div class="form-check">
									<label class="cbtn btn red active" style="width:40px; height:40px;">
										<input type="radio" name="colorOption">
										<i class="fa fa-check"></i>
									</label>
									<label class="cbtn btn pink" style="width:40px; height:40px;">
										<input type="radio" name="colorOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn orange" style="width:40px; height:40px;">
										<input type="radio" name="colorOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn yellow" style="width:40px; height:40px;">
										<input type="radio" name="colorOption">
										<i class="fa fa-check" style="color:black"></i>
									</label>			
									<label class="cbtn btn lime" style="width:40px; height:40px;">
										<input type="radio" name="colorOption">
										<i class="fa fa-check"></i>
									</label>
								</div>		
							</div>
						</div>
						<div class="row m-4 sizeList">
							<div class="cbtn-group btn-group p-auto" data-toggle="buttons" style="width:600px;">
				       			<label for="psize" class="mx-2 my-2"><b>사이즈</b></label>
				       			<div class="form-radio">
									<label class="cbtn btn" style="width:75px; height:40px; margin:3px auto;">
										220
										<input class="psize" type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>
									<label class="cbtn btn" style="width:75px; height:40px;">
										225
										<input class="psize" type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										230
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										235
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										240
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										245
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										250
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										255
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										260
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										265
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										270
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										275
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										280
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>																		
								</div>
							</div>
						</div>
						<div class="row m-4">
							<div class="col-5 btn-dark" type="button" data-toggle="modal" data-target="#buyNow" style="padding:10px; text-align:center; justify-content: center;">  <!--  font-size:30px; -->
								<b>바로 구매</b>
							</div>
							<div class="modal fade" id="buyNow" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog  modal-dialog-centered">
									<div class="modal-content">
									  <div class="modal-header">
									    <h5 class="modal-title" id="exampleModalLabel">SaShoes</h5>
									    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									      <span aria-hidden="true">&times;</span>
									    </button>
									  </div>
									  <div class="modal-body">
									    <p>정말 구매하시겠습니까?</p>
									  </div>
									  <div class="modal-footer">
									    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									    <a type="button" class="btn btn-primary"  href="/shopping/order/OrderController">구매하기</a>
									  </div>
									</div>
								</div>
							</div>
															
							<div class="col-2"></div>
							<div class="col-5 btn-secondary" type="button" data-toggle="modal" data-target="#putCart" style="padding:10px; text-align:center;">
								<b>장바구니</b>
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
									    <p>장바구니에 성공적으로 담겼습니다 !</p>
									  </div>
									  <div class="modal-footer">
									    <a type="button" class="btn btn-primary"  href="/shopping/cart/CartController">장바구니 보러가기</a>
									  </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<ul class="row nav nav-tabs pl-100" role="tablist">
				<li class="col-4 p-3 nav-item">
					<a class="nav-link active" data-toggle="tab" href="#shoes-detail" style="font-size:30px; text-align:center"> 상품 정보 </a>
				</li>
				<li class="col-4 p-3 nav-item">
					<a class="nav-link" data-toggle="tab" href="#shoes-review" style="font-size:30px; text-align:center"> 리뷰 </a>
				</li>
				<li class="col-4 p-3 nav-item">
					<a class="nav-link" data-toggle="tab" href="#shoes-q_a" style="font-size:30px; text-align:center"> Q & A </a>
				</li>
			</ul>
			
			<!-- Tab Content -->
			<div class="tab-content">
				<div class="tab-pane active container-fluid" id="shoes-detail">
					<div class="m-4" style="text-align:center">
						<img src="../resources/images/bans/정보_1.png" style="width:900px; height:400px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="../resources/images/bans/정보_2.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="../resources/images/bans/정보3.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="../resources/images/bans/정보4.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="../resources/images/bans/정보5.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
					</div>
				</div>
				<div class="tab-pane container-fluid" id="shoes-review">
					<div id="mainDiv" class="content">
					   <div id="review-list">
					      <div id="review-list-header">
					      
					      </div>
					      <table class="table table-hover">
					         <thead class="table-dark">
					         <tr>
					            <th scope="col">NO</th>
					            <th scope="col" style="width:330px">상품 정보</th>
					            <th scope="col" colspan="3">작성내용</th>
					            <th></th>
					         <tr>
					         </thead>
					         <tbody class="table-group-divider">
					         <tr onclick="location.href='reviewboarddetail.html'">
					            <th scope="row">1</th>
					            <td>
					               <div class="n-row">
					                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
					                  <ul class="info" style="margin:auto 0px">
					                     <li class="option">옵션: 노랑</li>
					                     <li class="option">사이즈: 240</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
					                  <ul id="review-detail" style="margin:auto 0px">
					                     <li class="order-name">작성자 이름 : 희률 </li>
					                     <li class="review-stars">⭐⭐⭐⭐⭐</li>
					                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
					                     <li class="review-comment">
					                     </li>
					                  </ul>
					               </div>
					            </td>
					            <td style="text-align:center;">
					            	<div id="buttons" class="d-flex flex-column">
					            		<ul style="margin:auto 0px"> 
					            			<li>댓글 수 : 0개</li>
					            			<li>종아요 수 : 0개</li>
					            		</ul>
					            	</div>
					            </td>
					         </tr>
					         <!-- 주문 2 -->
					         <tr>
					            <th scope="row">2</th>
					            <td>
					               <div class="n-row">
					                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
					                  <ul class="info" style="margin:auto 0px">
					                     <li class="option">옵션: 노랑</li>
					                     <li class="option">사이즈: 255</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
					                  <ul id="review-detail" style="margin:auto 0px">
					                     <li class="order-name">작성자 이름 : 태희 </li>
					                     <li class="review-stars">⭐⭐⭐⭐</li>
					                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
					                     <li class="review-comment">
					                     </li>
					                  </ul>
					               </div>
					            </td>
					            <td style="text-align:center;">
					            	<div id="buttons" class="d-flex flex-column">
					            		<ul style="margin:auto 0px"> 
					            			<li>댓글 수 : 0개</li>
					            			<li>종아요 수 : 0개</li>
					            		</ul>
					            	</div>
					            </td>
					         </tr>
					         
					         <!-- 주문3 -->
					         <tr>
					            <th scope="row">3</th>
					            <td>
					               <div class="n-row">
					                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
					                  <ul class="info" style="margin:auto 0px">
					                     <li class="option">옵션: 노랑</li>
					                     <li class="option">사이즈: 260</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
					                  <ul id="review-detail" style="margin:auto 0px">
					                     <li class="order-name">작성자 이름 : 정은 </li>
					                     <li class="review-stars">⭐⭐⭐⭐⭐</li>
					                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
					                     <li class="review-comment">
					                     </li>
					                  </ul>
					               </div>
					            </td>
					            <td style="text-align:center;">
					            	<div id="buttons" class="d-flex flex-column">
					            		<ul style="margin:auto 0px"> 
					            			<li>댓글 수 : 0개</li>
					            			<li>종아요 수 : 0개</li>
					            		</ul>
					            	</div>
					            </td>
					         </tr>
					         
					         <!-- 주문4 -->
					         <tr>
					            <th scope="row">4</th>
					            <td>
					               <div class="n-row">
					                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
					                  <ul class="info" style="margin:auto 0px">
					                     <li class="option">옵션: 노랑</li>
					                     <li class="option">사이즈: 235</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
					                  <ul id="review-detail" style="margin:auto 0px">
					                     <li class="order-name">작성자 이름 : 송민 </li>
					                     <li class="review-stars">⭐⭐⭐⭐⭐</li>
					                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
					                     <li class="review-comment">
					                     </li>
					                  </ul>
					               </div>
					            </td>
					            <td style="text-align:center;">
					            	<div id="buttons" class="d-flex flex-column">
					            		<ul style="margin:auto 0px"> 
					            			<li>댓글 수 : 0개</li>
					            			<li>종아요 수 : 0개</li>
					            		</ul>
					            	</div>
					            </td>
					         </tr>
					         
					         </tbody>
					         
					      </table>
					   </div>
					</div>
				</div>
				<div class="tab-pane container-fluid" id="shoes-q_a">
					<div style="float:right">
						<button class="btn btn-lg btn-dark m-3" data-toggle="modal" data-target="#qna_creative"> Q & A 작성 </button>
						<div class="modal fade" id="qna_creative">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<!-- Modal Header -->
									<div class="modal-header">
										<h4> Q & A </h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									
									<!-- Modal body -->
									<div class="modal-body">
										<div>
											<label> Q & A 제목 </label>
											<input type="text"/>
										</div>
										<div>
											<label> Q & A 내용 </label>
											<div style="text-align:center">
												<textarea placeholder="Q & A 내용을 입력해주세요." style="width:400px; height:300px"></textarea>
											</div>
										</div>
									</div>
									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn bg-warning" data-dismiss="modal">작성</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="mainDiv" class="content">
					   <div id="review-list">
					      <div id="review-list-header">
					      
					      </div>
					      <table class="table table-hover" id="qnaList">
					         <thead class="table-dark">
					         <tr>
					            <th scope="col">NO</th>
					            <th scope="col" style="width:330px">문의자 정보</th>
					            <th scope="col" colspan="3">문의 제목</th>
					            <th></th>
					         <tr>
					         </thead>
					         <tbody class="table-group-divider">
					         <tr>
					            <th scope="row">1</th>
					            <td>
					               <div class="n-row">
					                  <ul class="info">
					                     <li class="order-id">태희</li>
					                     <li class="option">2022-11-23</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
						            <ul id="review-detail">
										<li class="order-name"> 질문 </li>
									</ul>
					               </div>
					               <div class="qnaDetail" style="display:none; text-align: left;" class=" n-row">
					                  <div class="p-3" style="width:100%; height:100px; ">
					                  		<p>1 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
					                  		<p>2 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
					                  </div>
					                  <table class="table">
				                  	  	  <thead style="background-color: #f0f0f0; border-top: 3px solid #000;">
										    <tr>
										      <th class="col-10">답글 수: 2개</th>
										      <th class="col-2"></th>
										    </tr>
										  </thead>
										  <tbody>
										    <tr style="border-top: 4px solid #000;">
										      <th>안녕하세요 태희님, 해당 사이즈 재입고 날짜가 미정입니다. 죄송합니다</th>
										      <td>관리자</td>
										    </tr>
										    <tr>
										      <th>답변 감사합니다 !!</th>
										      <td>태희</td>
										    </tr>
										    <tr>
										      <th>네 고객님 좋은하루 되세요</th>
										      <td>관리자</td>
										    </tr>
							   
						  				 </tbody>
					  				 </table>
					               </div>
					            </td>
					            <td style="text-align:center;">
									<div>
										답변 완료
									</div>
					            </td>
					         </tr>
					         <!-- 주문 2 -->
					         <tr>
					         <th scope="row">2</th>
					            <td>
					               <div class="n-row">
					                  <ul class="info">
					                     <li class="order-id">희률</li>
					                     <li class="option">2022-11-21</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
							        <ul id="review-detail">
										<li class="order-name"> 구매할 때 어떤 방식으로 신청해야 </li>
									</ul>
					               </div>
					               <div class="qnaDetail" style="display:none;" class=" n-row">
					                  <div class="p-3" style="width:100%; height:100px; ">
					                  		<p>3 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
					                  		<p>4 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
					                  </div>
					                  <table class="table">
				                  	  	  <thead style="background-color: #f0f0f0; border-top: 3px solid #000;">
										    <tr>
										      <th class="col-10">답글 수: 2개</th>
										      <th class="col-2"></th>
										    </tr>
										  </thead>
										  <tbody>
										    <tr style="border-top: 4px solid #000;">
										      <th>안녕하세요 희률님, 해당 사이즈 재입고 날짜가 미정입니다. 죄송합니다</th>
										      <td>관리자</td>
										    </tr>
										    <tr>
										      <th>답변 감사합니다 !!</th>
										      <td>희률</td>
										    </tr>
										    <tr>
										      <th>네 고객님 좋은하루 되세요</th>
										      <td>관리자</td>
										    </tr>
							   
						  				 </tbody>
					  				 </table>
					               </div>
					            </td>
					            <td style="text-align:center;">
									<div>
										답변 완료
									</div>
					            </td>
					         </tr>
					         
					         <!-- 주문3 -->
					         <tr>
					         <th scope="row">3</th>
					            <td>
					               <div class="n-row">
					                  <ul class="info">
					                     <li class="order-id">정은</li>
					                     <li class="option">2022-11-20</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
					                  <ul id="review-detail">
					                     <li class="order-name"> 궁금한게 있습니다. </li>
					                  </ul>
					               </div>
					            </td>
					            <td style="text-align:center;">
									<div>
										미답변
									</div>
					            </td>
					         </tr>
					         
					         <!-- 주문4 -->
					         <tr>
					         <th scope="row">4</th>
					            <td>
					               <div class="n-row">
					                  <ul class="info">
					                     <li class="order-id">송민</li>
					                     <li class="option">2022-11-19</li>
					                  </ul>
					               </div>
					            </td>
					            <td colspan="3">
					               <div id="review-info">
					               	<ul id="review-detail">
										<li class="order-name"> 문의할게 있습니다. </li>
									</ul>
					               </div>
					            </td>
					            <td style="text-align:center;">
									<div>
										미답변
									</div>
					            </td>
					         </tr>
					         
					         </tbody>
					         
					      </table>
					   </div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>