<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shoescolors.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/customCheckbox.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/customRadio.css">

<script src="${pageContext.request.contextPath}/resources/javascript/review_qna.js"></script>

	<style>
	* {
		/* 		 	border: 1px solid black;  */
		
	}
	
	.shoes-images-review {
		width: 100px;
		height: 100px;
	}
	
	li {
		text-align: left;
		list-style: none;
	}
	
	.n-row {
		display: flex;
		padding: 10px;
	}
	
	.table td, th {
		text-align: center;
		vertical-align: middle;
	}


	</style>
	<script>
	// 사이즈, 선택 모두 선택시에만 장바구니에 담기기
		function addToCart() {
			var color = $("input[name=colorOption]:checked").val();
			var size = $("input[name=sizeOption]:checked").val();
			var quantity =  $("input[name=quantity]").val();
			console.log("quantity  : " + quantity);
			
			var url = new URL(window.location.href);
			var urlParam = url.searchParams;
			var pId = urlParam.get("productId");
			console.log(pId);	
			
			
			if(color != null && size != null){
				$.ajax({
					type : 'POST',  //get방식으로 통신
					url : "/shopping/cart/addCartController", //탭의 data-tab속성의 값으로 된 html파일로 통신
					data: {color: color, size: size, productId: pId, quantity: quantity},
					error : function() { //통신 실패시
						console.log('통신실패!');
					},
					success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
						console.log("통신 성공 ~~~~~~~~~~~~~~~~");
						$("#putCart").click(function() {
							console.log("!!!!");
						    $(".modals").fadeIn();
						});	
					
					}
				});
			} else {
				alert("색상과 사이즈를 선택해주세요");           
	
			}
		}
			
		function goOrder(pId) {
			var color = $("input[name=colorOption]:checked").val();
			var size = $("input[name=sizeOption]:checked").val();
			var quantity =  $("input[name=quantity]").val();
			console.log("quantity  : " + quantity);
			console.log(pId);	
			
			
			if(color != null && size != null){
				$.ajax({
					type : 'POST',  //get방식으로 통신
					url : "/shopping/order/DirectOrderController", //탭의 data-tab속성의 값으로 된 html파일로 통신
					data: {color: color, size: size, productId: pId, quantity: quantity},
					error : function() { //통신 실패시
						console.log('통신실패!');
					},
					success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
						console.log("통신 성공 ~~~~~~~~~~~~~~~~");
						location.href="/shopping/mypage/MyOrderController";  
					}
				});
			} else {
				alert("색상과 사이즈를 선택해주세요");      
	
			}
		}
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
				       				<c:forEach var="color" items="${product.colorList}">
										<label class="cbtn btn active ${color.color_name}" style="width:40px; height:40px;">
											<input type="radio" name="colorOption" value="${color.color_id}">
											<i class="fa fa-check"></i>
										</label>
									</c:forEach>
								</div>		
							</div>
						</div>
						<div class="row m-4 sizeList">
							<div class="cbtn-group btn-group p-auto" data-toggle="buttons" style="width:600px;">
				       			<label for="psize" class="mx-2 my-2"><b>사이즈</b></label>
				       			<div class="form-radio">
				       				<c:forEach var="size" items="${product.sizeList}">
										<label class="cbtn btn" style="width:75px; height:40px; margin:3px auto;">
											${size}
											<input class="psize" type="radio" name="sizeOption" value="${size}">
											<i class="fa fa-check"></i>
										</label>
									</c:forEach>																		
								</div>
							</div>
						</div>
						<div class="row m-4 sizeList">
						<label for="quantity" class="mx-2 my-2"><b>수량</b>
							<input type="number" min="1" max="100" name="quantity" value="1"
							style="width: 45px; margin: 2px 10px; font-size: 15px; text-align: center"/>
						</label>
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
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<a type="button" class="btn btn-primary"
											onclick="goOrder(${product.productId})">구매하기</a>
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
					<a class="nav-link active" data-toggle="tab" onclick="productInfo()" style="font-size:30px; text-align:center"> 상품 정보 </a>
				</li>
				<li class="col-4 p-3 nav-item">
					<a id="reviewLink" class="nav-link" data-toggle="tab" href="#tab-content" onclick="productReview(1)" style="font-size:30px; text-align:center"> 리뷰 </a>
				</li>
				<li class="col-4 p-3 nav-item">
					<a class="nav-link" data-toggle="tab" href="#tab-content" onclick="productQna()" style="font-size:30px; text-align:center"> Q & A </a>
				</li>
			</ul>
			
			<!-- Tab Content -->
			<div class="tab-content">
				
				<!-- 없애야할 부분 -->
				<div class="tab-pane active container-fluid" id="shoes-detail">
					<div class="m-4" style="text-align:center">
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보_1.png" style="width:900px; height:400px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보_2.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보3.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보4.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
						<img src="${pageContext.request.contextPath}/resources/images/반스/98/정보5.png" style="width:900px; height:600px; margin:0 auto;"class="active m-1 ml-4"/>
					</div>
				</div>
				
				<!-- ajax 처리 - 유동적으로 바뀔 부분 -->
				<div class="tab-pane" id="tab-content"></div>
				
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	