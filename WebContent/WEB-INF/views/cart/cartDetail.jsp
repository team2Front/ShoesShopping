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
		
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/productList.css">
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		<style>
			* {
/*   				border: 1px solid black;  */
			}
		</style>
		<script>
			function selectAll() {
				if($("#selectAll").is(":checked")) {
					$(".check").prop("checked",true);
				} else {
					$(".check").prop("checked",false);
				}
			}
			
			function count(type)  {
				  // 결과를 표시할 element
				  const resultElement = document.getElementById('quantity');
				  
				  // 현재 화면에 표시된 값
				  let number = resultElement.innerText;
				  
				  // 더하기/빼기
				  if(type === 'plus') {
				    number = parseInt(number) + 1;
				  }else if(type === 'minus')  {
				    number = parseInt(number) - 1;
				  }
				  
				  // 결과 출력
				  resultElement.innerText = number;
				}
		</script>
	</head>
	<body>
	  <div class="banner d-flex justify-content-between">  
	    <div class="p-2"><a href="home.html"><img src="../resources/images/sashoes_logo.png" style="width:150px; margin-top:20px;"/></a></div>
	    
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
		<div class="cartdetailmain container-fluid">
			<div id="wrapper">
				<div id="cart" style="font-size:30px" class="m-5">
					장바구니
				</div>
				<div id="allchoice" style="font-size:20px" class="row mx-5 mb-3">
					<input type="checkbox" onclick="selectAll()" style="zoom:2.0" id="selectAll"/>
					<div style="margin:auto 10px">전체선택</div>
 				</div>
 				<div class="card mx-5">
 					<div class="card-header">
 						일반 배송 상품 : 3개
 					</div>
 					<div class="card-body">
	 					<div class="row" style="border-bottom: 1px solid black">
	 						<input type="checkbox" name="shoes" onclick="select1()" style="zoom:2.0; margin:0px 0px 0px 10px" class="check"/>
	 							<img src="../resources/images/반스_월버_노랑.jpg" style="width:120px; height:120px; margin:10px"/>
	 							<div style="margin:auto 0px; width:250px">
	 								<div style="margin:2px 10px; font-size:20px;"> 반스-월버 </div>
	 								<div style="margin:2px 10px; font-size:20px;"> 노랑 </div>
	 								<div style="margin:2px 10px; font-size:20px;"> 270 </div>
	 							</div>
	 							<div style="margin:auto 0px auto 100px">
	 								<div style="margin:2px 10px; font-size:20px;"> 수량 </div>
	 								<input type="number" min="0" max="100" value="3" style="width: 45px; margin:2px 10px; font-size:15px; text-align:center"/>
	 							</div>
	 							<div style="margin:auto 0px auto 150px; width:150px">
	 								<div style="margin:2px 10px; font-size:20px; text-align:right"> 117,000 원 </div>
	 							</div>
	 							<div style="margin:auto 0px">
	 								<div style="margin:10px 0px 10px 30px">
	 									<button type="button" class="btn-dark" style="width:100px"> 바로 구매 </button>
	 								</div>
	 								<div style="margin:10px 0px 10px 30px">
	 									<button type="button" class="btn-dark" style="width:100px"> 삭제 </button>
	 								</div>
	 							</div>
	 					</div>
							<div class="row" style="border-bottom: 1px solid black">
	 						<input type="checkbox" name="shoes" onclick="select1()" style="zoom:2.0; margin:0px 0px 0px 10px" class="check"/>
	 							<img src="../resources/images/아디다스_가젤.jpg" style="width:120px; height:120px; margin:10px"/>
	 							<div style="margin:auto 0px; width:250px">
	 								<div style="margin:2px 10px; font-size:20px;"> 아디다스-가젤 </div>
	 								<div style="margin:2px 10px; font-size:20px;"> 검정 </div>
	 								<div style="margin:2px 10px; font-size:20px;"> 280 </div>
	 							</div>
	 							<div style="margin:auto 0px auto 100px">
	 								<div style="margin:2px 10px; font-size:20px;"> 수량 </div>
	 								<input type="number" min="0" max="100" value="2" style="width: 45px; margin:2px 10px; font-size:15px; text-align:center"/>
	 							</div>
	 							<div style="margin:auto 0px auto 150px; width:150px">
	 								<div style="margin:2px 10px; font-size:20px; text-align:right"> 78,000 원 </div>
	 							</div>
	 							<div style="margin:auto 0px">
	 								<div style="margin:10px 0px 10px 30px">
	 									<button type="button" class="btn-dark" style="width:100px"> 바로 구매 </button>
	 								</div>
	 								<div style="margin:10px 0px 10px 30px">
	 									<button type="button" class="btn-dark" style="width:100px"> 삭제 </button>
	 								</div>
	 							</div>
	 					</div>
						<div class="row" style="border-bottom: 1px solid black">
	 						<input type="checkbox" name="shoes" onclick="select1()" style="zoom:2.0; margin:0px 0px 0px 10px" class="check"/>
	 							<img src="../resources/images/아디다스_슈퍼스타_82.jpg" style="width:120px; height:120px; margin:10px"/>
	 							<div style="margin:auto 0px; width:250px">
	 								<div style="margin:2px 10px; font-size:20px;"> 아디다스-슈퍼스타-82 </div>
	 								<div style="margin:2px 10px; font-size:20px;"> 노랑 </div>
	 								<div style="margin:2px 10px; font-size:20px;"> 280 </div>
	 							</div>
	 							<div style="margin:auto 0px auto 100px">
	 								<div style="margin:2px 10px; font-size:20px;"> 수량 </div>
	 								<input type="number" min="0" max="100" value="1" style="width: 45px; margin:2px 10px; font-size:15px; text-align:center"/>
	 							</div>
	 							<div style="margin:auto 0px auto 150px; width:150px">
	 								<div style="margin:2px 10px; font-size:20px; text-align:right"> 134,000 원 </div>
	 							</div>
	 							<div style="margin:auto 0px">
	 								<div style="margin:10px 0px 10px 30px">
	 									<button type="button" class="btn-dark" style="width:100px"> 바로 구매 </button>
	 								</div>
	 								<div style="margin:10px 0px 10px 30px">
	 									<button type="button" class="btn-dark" style="width:100px"> 삭제 </button>
	 								</div>
	 							</div>
	 					</div>
 					</div>
 				</div>
 				<div class="card mx-5">
 					<div class="card-header container-fluid" style="background-color:white">
 						<div class="row">
 						
 							<div class="col-6" style="font-size:30px; padding:0px 0px 0px 30px">
 								총 주문 금액 :
 							</div>
 							<div class="col-6" style="font-size:30px; text-align:right; padding: 0px 80px 0px 0px">
 								329,000 원
 							</div>
 						</div>
 					</div>
 					<div class="card-body" style="text-align:center">
 						<button type="button" class="btn-dark btn-lg"> 계속 쇼핑하기 </button>
 						<a type="button" class="btn-dark btn-lg" href="orderForm.html"> 선택 상품 주문하기 </a>
 						<a type="button" class="btn-dark btn-lg" href="orderForm.html"> 전체 상품 주문하기 </a>
 					</div>
 					<div class="card-footer">
 						<p>
 						상품 주문 전 꼭 확인해주세요! <br>
						매장에서 발송되는 경우 온라인 물류센터 상품보다 평균 배송기간이 2~3일 정도 더 소요될 수 있습니다. <br>
						발송 매장 정보는 주문 완료 후 ‘마이페이지 > 주문 내역’에서 확인 가능합니다. <br>
						업체 배송 상품의 경우 업체별 배송비 정책에 따라 배송비가 부과됩니다. <br>
						업체 배송 상품은 매장 픽업, 편의점 픽업이 불가능합니다. <br>
						2개 이상의 상품 주문 시 재고 여부에 따라 분리 발송될 수 있습니다. <br>
						매장 픽업이 불가능한 상품을 포함하여 주문할 경우 주문서 작성/결제 페이지에서 매장픽업 선택이 불가능합니다.
 						</p>
 					</div>
 				</div>
			</div>
		</div>
	</body>
</html>