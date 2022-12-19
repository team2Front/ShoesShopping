<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <script>
function categoryfun(id, s){
	console.log(id);
	$.ajax({
		type : 'GET',
		url : "/shopping/main/MainMenuFilterController", 
		data : {company_id: id, product_sex: s},	
		error : function() { //통신 실패시
			alert('통신실패!');
		},
		success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
			
			location.reload();
			/* location.href='/shopping/main/MainMenuFilterController'; */
		}
	});
}
</script> -->
<body>
	  <div class="banner d-flex justify-content-between" id="adminBanner">  
	    <div class="p-2"><a href="${pageContext.request.contextPath}"><img src="../resources/images/sashoes_logo.png" style="width:150px; margin-top:20px;"/></a></div>
	    <c:if test = "${loginId == null}">
	    	
	    </c:if>
	    <c:if test = "${loginId != null}">
	    	
	    </c:if>
	    <div  style="text-align: center; padding-top: 35px;">
	    <!--------------------------------------------------------- 로그인 창 --------------------------------------->
	    	<c:if test="${loginId == null}">
	    		<span style="text-align:right; padding-top: 35px; margin-right: 10px;"><strong>로그인한 아이디가 없습니다.</strong></span>
	    		<a href="${pageContext.request.contextPath}/user/JoinFormController" class="btn btn-warning btn-sm" >회원 가입</a>
	    		<a href="${pageContext.request.contextPath}/user/LoginSessionController" class="btn btn-secondary btn-sm">로그인</a>
	    	</c:if>
	    	<c:if test="${loginId != null}">
	    		<c:if test="${loginType =='USER'}">
	    			<span style="text-align:right; padding-top: 35px; margin-right: 10px;"><strong>${loginId}(${loginType})</strong></span>
	    			<a href="${pageContext.request.contextPath}/cart/CartController" class="btn btn-success btn-sm">내 장바구니</a>
	    			<a href="${pageContext.request.contextPath}/mypage/MainController?userId=${loginId}" class="btn btn-success btn-sm">마이 페이지</a>
	    			<a href="${pageContext.request.contextPath}/user/LogoutSessionController" class="btn btn-success btn-sm">로그 아웃</a>
	    		</c:if>
	    		<c:if test="${loginType =='ADMIN'}">
	    		<span style="text-align:right; padding-top: 35px; margin-right: 10px;"><strong>${loginId}(${loginType})</strong></span>
	    		<a href="${pageContext.request.contextPath}/admin/Register_ProductController" class="btn btn-warning btn-sm">상품 등록</a>
	    		<a href="${pageContext.request.contextPath}/admin/Register_NewAdminController" class="btn btn-warning btn-sm">관리자 등록</a>
	    		<a href="${pageContext.request.contextPath}/admin/Register_ReviewController" class="btn btn-warning btn-sm">리뷰</a>
	    		<a href="${pageContext.request.contextPath}/admin/QnaBoardListController" class="btn btn-warning btn-sm">Q&A</a>
	    		<a href="${pageContext.request.contextPath}/user/LogoutSessionController" class="btn btn-dark btn-sm">로그아웃</a>
	    		</c:if>
	    	</c:if>
	    </div>
	  </div>
		<div id="navbar" class="shadow-sm">
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					ADIDAS
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=1&product_sex=ALL">ALL</a> 
 					<!-- <a class="dropdown-item" onclick="categoryfun(1, 'ALL')">ALL</a>  -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=1&product_sex=MEN">MEN</a> 
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=1&product_sex=WOMEN">WOMEN</a> 
 					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=1&product_sex=KIDS">KIDS</a> 
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					VANS
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=2&product_sex=ALL">ALL</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=2&product_sex=MEN">MEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=2&product_sex=WOMEN">WOMEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=2&product_sex=KIDS">KIDS</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					CONVERSE
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=3&product_sex=ALL">ALL</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=3&product_sex=MEN">MEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=3&product_sex=WOMEN">WOMEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=3&product_sex=KIDS">KIDS</a>
				</div>
			</div>	
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					NIKE
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=4&product_sex=ALL">ALL</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=4&product_sex=MEN">MEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=4&product_sex=WOMEN">WOMEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=4&product_sex=KIDS">KIDS</a>
				</div>
			</div>	
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					NEWBALANCE
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=5&product_sex=ALL">ALL</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=5&product_sex=MEN">MEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=5&product_sex=WOMEN">WOMEN</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/main/MainMenuFilterController?company_id=5&product_sex=KIDS">KIDS</a>
				</div>
			</div>	
		</div>