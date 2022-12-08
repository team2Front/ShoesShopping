<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shoescolors.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customCheckbox.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customRadio.css">
	
	<script src="${pageContext.request.contextPath}/resources/javascript/review_qna.js"></script>
	
<!--   	<script>
 		function productInfo() {
			$("#tab-content").empty();
		} 
	</script> -->
	
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
		
		<script>
			$(document).ready(function(){
			  //실행내용
			})
		</script>
		
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
	<div class="shoesmain container-fluid">
		<div id="wrapper" >
			<div class="row row-cols-2">
				<!-- 이미지가 나오는 사이드 바 -->
				<div id="img1" class="carousel slide col-md-6" data-ride="carousel" data-interval="0">
					<div class="carousel-inner">
						<c:forEach var="image" items="${product.imageList}" varStatus="status">
							<c:choose>
								<c:when test = "${status.first}">
									<div class="carousel-item active">
										<img id="img1" src="/Project2_Images/${product.company}/${product.productId}/${image}" style="width:500px; height:500px;" class="m-4"/> 
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-item">
											<img id="img1" src="/Project2_Images/${product.company}/${product.productId}/${image}" style="width:500px; height:500px;" class="m-4"/>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#img1" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#img1" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
					<div class="carousel">
						<c:forEach var="image" items="${product.imageList}" varStatus="status">
							<c:choose>
								<c:when test = "${status.first}">
										<img data-target="#img1" data-slide-to="0" onclick="change1()" src="/Project2_Images/${product.company}/${product.productId}/${image}" style="width:90px; height:90px;"class="active m-1 ml-4"/>
								</c:when>
								<c:otherwise>
										<img data-target="#img1" data-slide-to="${status.index}" onclick="change${staus.count}()" src="/Project2_Images/${product.company}/${product.productId}/${image}" style="width:90px; height:90px;"class="m-1"/>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				
				<!-- 신발에 대한 상세 설명 -->
				<div id="detail" class="col-md-6">
					<div class="container-fluid">
						<p class="card-brand m-0 text-muted border-bottom p-3" >${product.category} > ${product.productSex}</p>
						<div class="row m-2" style="font-size:20px; padding:5px"> ${product.company} </div>
						<div class="row m-2">
							<div class="col" style="font-size:25px; padding:5px">
								<b>${product.productName} </b>
								<!-- 정글 사이드월 Authentic 어센틱 44 DX -->
							</div>
<!-- 							<div class="col-8" style="font-size:30px; padding:10px"> -->
<!-- 								카테고리 : 운동화 -->
<!-- 							</div> -->
						</div>
						<div class="row m-2" style="font-size:30px; padding:5px"><b> ${product.productPrice}원</b> </div>
						<hr/>
						<div class="row m-4">
							<div class="btn-group btn-group" style="width:620px;">
				       			<label for="pcolor" class="m-2"><b>색상</b></label>
				       			<div class="form-check">
									<label class="cbtn btn red active" style="width:40px; height:40px;">
										<input type="radio" name="colorOption" value="1">
										<i class="fa fa-check"></i>
									</label>
									<label class="cbtn btn pink" style="width:40px; height:40px;">
										<input type="radio" name="colorOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn orange" style="width:40px; height:40px;">
										<input type="radio" name="colorOption"  value="2">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn yellow" style="width:40px; height:40px;">
										<input type="radio" name="colorOption"  value="3">
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
										<input class="psize" type="radio" name="sizeOption" value="220">
										<i class="fa fa-check"></i>
									</label>
									<label class="cbtn btn" style="width:75px; height:40px;">
										225
										<input class="psize" type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										230
										<input type="radio" name="sizeOption" value="230"> 
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										235
										<input type="radio" name="sizeOption">
										<i class="fa fa-check"></i>
									</label>			
									<label class="cbtn btn" style="width:75px; height:40px;">
										240
										<input type="radio" name="sizeOption" value="240">
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
							<div class="col-5 btn-secondary" onclick="addToCart()" data-toggle="modal" data-target="#putCart" style="padding:10px; text-align:center;">
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
					<a class="nav-link auto" data-toggle="tab" onclick="productInfo()" style="font-size:30px; text-align:center"> 상품 정보 </a>
				</li>
				<li class="col-4 p-3 nav-item">
					<a id="reviewLink" class="nav-link" data-toggle="tab" onclick="productReview(1)" style="font-size:30px; text-align:center"> 리뷰 </a>
				</li>
				<li class="col-4 p-3 nav-item">
					<a class="nav-link" data-toggle="tab" onclick="productQna()" style="font-size:30px; text-align:center"> Q & A </a>
				</li>
			</ul>
			
			<!-- Tab Content -->
			<div class="tab-content">
				
				<!-- 없애야할 부분 -->
				<div class="tab-pane auto container-fluid" id="shoes-detail">
					<div class="m-4" style="text-align:center">
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보_1.png" style="width:900px; height:400px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보_2.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보3.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보4.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보5.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
					</div>
				</div>
				
				<!-- ajax 처리 - 유동적으로 바뀔 부분 -->
				<div id="tab-content"></div>
				
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	