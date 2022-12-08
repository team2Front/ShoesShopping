<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		<style>
			#navbar {
				margin: 0 auto;
				height: 50px;
				border-top: 1px groove gray;
				border-bottom: 1px groove gray;
				padding-left:100px;
			}
			
			.shoesmain {
				width: 1400px;
				margin:0 auto !important;
			}
			
			#mypage_sidebar {
				background-color:#F5F5F5;
				top: 250px;
				bottom: 150px;
				right: 10px; 
				width: 200px; 
				height:1000px;
				margin-left: 15px;
				padding-top:30px; 
				padding-bottom:30px;
				font-size:13px;
			    align-self: flex-start;
			    top: 0;
			}
			
			#mainDiv{
				width: 1000px;
				margin-left: 92px;
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
			
			.btn {
				margin: 2px 2px;
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
			
			
			.pbtn {
				font-size: 5px;
			}
			
			.btn-light {
				border: 1px solid gray;
			}

		</style>

		
		<!-- orderList -->
		<script>
			function claimHandler1(){
				console.log("환불 요청");
			}
			function claimHandler2(){
				console.log("후기 작성");
			}
		</script>
		
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
	<body>
	
	<!-- 메인페이지 -->
	<div class="shoesmain d-flex" >
		<div class="shoesmain-1 col-xs-2"> 
		
		<%@ include file="/WEB-INF/views/fragment/mypage_sidebar.jsp" %>
		
		</div>
		
		<!-- main -->
		<div class="shoesmain-2 col-xs-10">
			
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
							<c:forEach var="Orders" items="${orderList}" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>
										<div class="n-row">
											<ul class="info">
												<c:forEach var="OrdeDetailDto" begin="0" end="0" items="${Orders.ordersDetailList}">
													<li class="brand">${OrdeDetailDto.product.productName}</li>
													<li class="name">${OrdeDetailDto.color}</li>
													<li class="option">${OrdeDetailDto.size_id}</li>
													<li>외 ${Orders.quantity-1}</li>
												</c:forEach>
											</ul>
										</div>
									</td>
									<td>${Orders.ordersDate}</td>
									<td>${Orders.ordersId}</td>
									<td>${Orders.totalPrice}<br>
										<span class="txt-default">${Orders.quantity}</span>
									</td>
									<td style="text-align: center; padding: 20px;"><c:if
											test="${Orders.ordersIsDeleted == true}">
									환불 완료
								</c:if> <c:if test="${Orders.ordersIsDeleted == false}">
									구매 완료
								</c:if>
										<div id="buttons" class="d-flex flex-column">
											<a class="btn btn-secondary btn-sm mb-1 mt-1" type="button" href="${pageContext.request.contextPath}/mypage/PayBackController?ordersId=${Orders.ordersId}">환불 요청</a>
											<a role="button" href="write_review.html" class="btn btn-secondary btn-sm">후기 작성</a>
										</div></td>
								</tr>
							</c:forEach>
							<tr>
						<td colspan="6" class="text-center">
							<div>
								<a href="${pageContext.request.contextPath}/mypage/MyOrderController?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
								
								<c:if test="${pager.groupNo > 1}">
									<a href="${pageContext.request.contextPath}/mypage/MyOrderController?pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm">이전</a>
								</c:if>
								
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a href="${pageContext.request.contextPath}/mypage/MyOrderController?pageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a href="${pageContext.request.contextPath}/mypage/MyOrderController?pageNo=${i}" class="btn btn-danger btn-sm">${i}</a>
									</c:if>
								</c:forEach>
								
								<c:if test="${pager.groupNo < pager.totalGroupNo}">
									<a href="${pageContext.request.contextPath}/mypage/MyOrderController?pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
								</c:if>
								
								<a href="${pageContext.request.contextPath}/mypage/MyOrderController?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
							</div>
						</td>
					</tr>
				</tbody>
						
					</table>
				</div>
			</div>
			
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>