<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					MEN
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">남성 운동화</a>
					<a class="dropdown-item" href="#">남성 스니커즈</a>
					<a class="dropdown-item" href="#">남성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					WOMEN
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">여성 운동화</a>
					<a class="dropdown-item" href="#">여성 스니커즈</a>
					<a class="dropdown-item" href="#">여성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2 text-white" data-toggle="dropdown">
					KIDS
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">아이 운동화</a>
					<a class="dropdown-item" href="#">아이 스니커즈</a>
					<a class="dropdown-item" href="#">아이 샌들</a>
				</div>
			</div>	
		</div>