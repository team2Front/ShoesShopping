<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
		<script>
			function selectAll() {
				if($("#selectAll").is(":checked")) {
					$(".check").prop("checked",true);
				} else {
					$(".check").prop("checked",false);
				}
			}			
		</script>
	</head>

	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>	
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
 						일반 배송 상품 : ${cart.totalPrice} 개
 						<p>${cart.totalPrice}</p>
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
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	
