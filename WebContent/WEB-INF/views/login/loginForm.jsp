<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
		
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/productList.css">
		
	</head>
	
	<body>
		<div style="width: 500px; margin: auto; margin-top: 100px">
			<img src="../resources/images/sashoes_logo.png" style="width: 100%" />
		</div>
		<div class="card mt-2" style="width: 500px; margin: auto;">
			<div class="card-header" style="text-align:center"><h4 style="margin:auto">로그인</h4></div>
			<div class="card-body">
				<form method="post" action="${pageContext.request.contextPath}/user/LoginSessionController">
					<div class="form-group">
						<label for="uid">아이디</label> <input type="text" class="form-control"
							id="uid" name="uid">
					</div>
					<div class="form-group">
						<label for="upassword">Password</label> <input type="password"
							class="form-control" id="upassword" name="upassword">
					</div>
					<button type="submit" class="btn btn-warning" style="width: 100%">로그인</button>
				</form>
				<div class="form-group">
					<button type="submit" class="btn btn-dark mt-3" style="width: 49%">
						회원 가입
					</button>
					<button type="submit" class="btn btn-dark mt-3" style="width: 49%" onclick="location.href='${pageContext.request.contextPath}'">
						홈으로
					</button>
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	