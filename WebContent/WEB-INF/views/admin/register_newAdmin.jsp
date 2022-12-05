<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- resource/css 링크 -->
		<link rel="stylesheet" href="../resources/css/customCheckbox.css">
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		
		<!-- font 링크 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<style>
		</style>

	</head>
	<body>
		<!-- 배너부분 -->
	    <div id ="adminBanner" class="d-flex align-items-center">
    		<div class="adminLogo">
   				<a href="/shopping/admin/HomeController"><img src="../resources/images/sashoes_logo.png"/></a>
			</div>	
			<div class="adminBanner-font p-2" style="white-space:nowrap;">관리자</div>
	    </div>
	  	
	  	<!-- 메인부분 -->
	    <div id="adminMain" class="card mx-auto">
	      <div class="card-header">관리자 등록</div>
	      <div class="card-body">
	        <form id="pnameForm" name="pnameForm" method="post" action="Resister_NewAdminController" enctype="multipart/form-data">
	          	<div class="form-group">
	            	<label for="adminId">아이디</label>
	            	<input type="text" class="form-control" id="adminId" name="adminId" placeholder="아이디를 입력해주세요"/>
	          	</div>
	
	          	<div class="form-group">
	            	<label for="adminPw">비밀번호</label>
	            	<input type="text" class="form-control" id="adminPw" name="adminPw" placeholder="비밀번호를 입력해주세요"/>
	          	</div>

	          	<div class="form-group">
	            	<label for="Retry_adminPw">비밀번호 재확인</label>
	            	<input type="text" class="form-control" id="Retry_adminPw" name="Retry_adminPw" placeholder="비밀번호를 다시입력해주세요"/>
	          	</div>

	          	<div class="form-group">
	            	<label for="adminName">관리자명</label>
	            	<input type="text" class="form-control" id="adminName" name="adminName" placeholder="관리자 이름을 입력해주세요"/>
	          	</div>

	          	<div class="form-group">
	            	<label for="adminBirth">생년월일</label>
	            	<div class="d-flex">
	            		<input type="text" class="form-control mr-3" id="adminBirth" name="adminBirth" placeholder="년(4자)" style="width:120px;"/>
	            		<select id="adminBirth" name="adminBirth" class="form-control mx-3" style="width:120px;">
	              			<option selected>--선택--</option>
	              			<option value="1">1</option>
	              			<option value="2">2</option>
	              			<option value="3">3</option>
	              			<option value="4">4</option>
	              			<option value="5">5</option>
	              			<option value="6">6</option>
	              			<option value="7">7</option>
	              			<option value="8">8</option>
	              			<option value="9">9</option>
	              			<option value="10">10</option>
	              			<option value="11">11</option>
	              			<option value="12">12</option>
	            		</select>
		            	<input type="text" class="form-control mx-3" id="adminBirth" name="adminBirth" placeholder="일" style="width:120px;"/>
	          		</div>
	          	</div>
	          	
	          	<div class="form-group">
	            	<label for="adminPhone">핸드폰번호</label>
	            	<input type="text" class="form-control" id="adminPhone" name="adminPhone" placeholder="핸드폰번호를 입력해주세요"/>
	          	</div>

	          	<div class="form-group">
	            	<label for="adminAddress">주소</label>
	            	<input type="text" class="form-control" id="adminAddress" name="adminAddress" placeholder="주소를 입력해주세요"/>
	          	</div>

		        <div class="form-group">
		        	<label for="gender" class="mx-2 mt-3 mb-1">성별</label>
	            	<select id="gender" name="gender" class="form-control">
	              		<option selected>--선택--</option>
	              		<option value="man">남자</option>
	              		<option value="woman">여자</option>
	            	</select>
		        </div>
	
	          <div class="text-center">
	            <input type="submit" class="btn btn-secondary" value="등록" />
	            <input type="reset" class="btn btn-light" value="초기화" />
	          </div>
	          
	        </form>
	      </div>
	    </div>
	</body>
</html>