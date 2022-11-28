<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="mainDiv" class="content">
	<h1 class="title m-5">주문/배송 조회</h1>
	<div id="orderhistory">
		<table class="table table-hover">
			<thead class="table-dark">
			<tr>
				<th scope="col">NO</th>
				<th scope="col">상품정보</th>
				<th scope="col">주문일자</th>
				<th scope="col">주문번호</th>
				<th scope="col">주문금액(수량)</th>
				<th scope="col" colspan="2">주문상태</th>
			<tr>
			</thead>
			<tbody class="table-group-divider">
			<tr>
				<th scope="row">1</th>
				<td>
					<div class="n-row">
						<a href="#" class="image-block"><img src="../images/반스_월버_노랑.jpg"/></a>
						<ul class="info">
							<li class="brand">반스</li>
							<li class="name">윌버 노랑</li>
							<li class="option">옵션: 노랑, 사이즈: 240</li>
						</ul>
					</div>
				</td>
				<td>2022.11.10</td>
				<td>202211100417370001</td>
				<td>50000원<br>
					<span class="txt-default">1개</span>
				</td>
				<td style="text-align:center; padding:20px;">배송 완료
				<div id="buttons" class="d-flex flex-column">
					<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">환불 요청</button>
					<a role="button" href="write_review.html" class="btn btn-secondary btn-sm" >후기 작성</a>
				</div>
			</td>
		</tr>
			<!-- 주문 2 -->
			<tr>
				<th scope="row">2</th>
				<td>
					<div class="n-row">
						<a href="#" class="image-block"><img src="../images/컨버스_척테일러올스타코어_검정.jpg"/></a>
						<ul class="info">
							<li class="brand">컨버스</li>
							<li class="name">척테일러올스타코어</li>
							<li class="option">옵션: 검정, 사이즈: 240</li>
						</ul>
					</div>
				</td>
				<td>2022.11.11</td>
				<td>202211100417370002</td>
				<td>74700원<br>
					<span class="txt-default">1개</span>
				</td>
				<td style="text-align:center; padding:20px;">배송 완료
					<div id="buttons" class="d-flex flex-column">
						<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">환불 요청</button>
						<a role="button" href="write_review.html" class="btn btn-secondary btn-sm" >후기 작성</a>
					</div>
				</td>
			</tr>
			<!-- 주문3 -->
			<tr>
				<th scope="row">3</th>
				<td>
					<div class="n-row">
						<a href="#" class="image-block"><img src="../images/아디다스_가젤.jpg"/></a>
						<ul class="info">
							<li class="brand">아디다스</li>
							<li class="name">가젤</li>
							<li class="option">옵션: 검정, 사이즈: 240</li>
						</ul>
					</div>
				</td>
				<td>2022.11.11</td>
				<td>202211100417370003</td>
				<td>70000원<br>
					<span class="txt-default">1개</span>
				</td>
				<td style="text-align:center; padding:20px;">배송 완료
					<div id="buttons" class="d-flex flex-column">
						<button class="btn btn-secondary btn-sm mb-1 mt-1" type="button" onclick="claimHandler1()">환불 요청</button>
						<a role="button" href="write_review.html" class="btn btn-secondary btn-sm" >후기 작성</a>
					</div>
				</td>
			</tr>
			</tbody>
			
		</table>
	</div>
</div>