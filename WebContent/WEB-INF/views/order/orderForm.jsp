<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/fragment/head.jsp"%>

<script>
	$(document).ready(function() {
		var currentPosition = parseInt($("#quickmenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			console.log("~~~~" + position + currentPosition);
			var tmp = position + currentPosition;
			if (tmp <= 200)
				tmp = 300;
			$("#quickmenu").stop().animate({
				"top" : tmp + "px"
			}, 100);
		});
	});

	function goOrder() {
		$.ajax({
			type : 'POST',
			url : "/shopping/order/OrderConfirmController",
			success : function(request) {
				console.log("주문 완료 ~");
				location.href = "/shopping/mypage/MyOrderController";
			},
			error : function() {
				console.log("AJAX_ERROR");
			}
		});
	}
</script>
</head>
<%@ include file="/WEB-INF/views/fragment/nav.jsp"%>
<div class="shoesmain container-fluid">
	<div id="wrapper" style="height: 1000px; padding-top: 60px;">
		<!-- 				주문서 작성 제목 -->
		<div style="margin-bottom: 20px;">
			<h2 class="mb-6">주문서 작성/결제</h2>
			<b>주문 리스트</b>
		</div>


		<div style="height: 1200px; width: 700px;">
			<!-- 					 <div style="display: flex;"> -->
			<!-- 				주문 리스트 -->
			<table class="table">
				<thead
					style="background-color: #f0f0f0; border-top: 3px solid #000;">
					<tr>
						<th class="col-2">배송: ${totalQuantity}개</th>
						<th class="col-4"></th>
						<th class="col-2"></th>
						<th class="col-2"></th>
						<th class="col-2"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartDetail" items="${list}">
						<tr>
							<th><img src="../resources/images/shoes1.png"
								style="width: 100px; height: 100px;"></th>
							<th>${cartDetail.product.productName}</th>
							<td>수량: ${cartDetail.quantity}</td>
							<td>색상: ${cartDetail.color.color_name}</td>
							<td>사이즈 : ${cartDetail.size_id}</td>
						</tr>
					</c:forEach>
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
			<div class="btn-dark" onclick="goOrder()"
				style="width: 400px; padding: 10px; text-align: center; justify-content: center; margin-left: 90px; margin-top: 100px"
				data-toggle="modal" data-target="#putCart">
				<b>주문하기</b>
			</div>
			<div class="modal fade" id="putCart" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog  modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">SaShoes</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>주문이 완료되었습니다 !</p>
						</div>
						<div class="modal-footer">
							<a type="button" class="btn btn-primary"
								href="shopping/mypage/MyOrderController">확인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 				결제 정보 오른쪽 사이드에 항상 따라다니도록 -->
		<div id="quickmenu" class="p-3"
			style="border: 4px solid black; left: 960px; position: absolute; width: 400px; margin-left: 100px; top: 300px;">
			<div class="mt-2 mb-2"
				style="padding-bottom: 20px; border-bottom: 3px solid black;">
				<b>결제 정보</b>
			</div>
			<c:forEach var="cartDetail" items="${list}">
				<div class="row row-cols-3">
					<div class="col-4">${cartDetail.product.productName}</div>
					<div class="col-4"></div>
					<div class="col-4">${cartDetail.quantity * cartDetail.product.productPrice}원</div>
				</div>
			</c:forEach>


			<div class="mb-1 mt-2" style="border-bottom: 3px solid black;"></div>
			<div class="row row-cols-3 mt-3">
				<div class="col-4">
					<b>총 정상가</b>
				</div>
				<div class="col-4"></div>
				<div class="col-4" style="color: red; font-weight: bold">${totalPrice}원</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/fragment/footer.jsp"%>