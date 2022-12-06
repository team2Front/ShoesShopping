<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
		<!-- resource/css 링크 -->
		<link rel="stylesheet" href="../resources/css/customCheckbox.css">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function changeVaild(id){
				id.innerHTML = '<h8><span style="color:green">올바른 입력입니다.</span></h8>';
			}
			
			function changeInvaild(id){
				id.innerHTML = '<h8><span style="color:red">잘못된 입력입니다.</span></h8>';
			}
			
			function handleCheckData() {
				var result = true;
				
				// id 검사
				var adminid = document.querySelector("#adminId");
				var adminidValue = adminid.value;
				console.log(adminidValue);
				var adminidPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}$/;
				var adminidTest = adminidPattern.test(adminidValue);
				var adminiddiv = document.getElementById("adminIddiv");
				if(adminidTest) {
					changeVaild(adminiddiv);
				} else {
					changeInvaild(adminiddiv);
					result = false;
				}
				
				// password 검사
				var adminpassword = document.querySelector("#adminPw");
				var adminpasswordValue = adminpassword.value;
				var adminpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
				var adminpasswordPatternTest = adminpasswordPattern.test(adminpasswordValue);
				var adminpassworddiv = document.getElementById("adminPwdiv");
				if (adminpasswordPatternTest) {
					changeVaild(adminpassworddiv);
				} else {
					changeInvaild(adminpassworddiv);
					result = false;
				}
				
				adminPhone
				var adminphone = document.querySelector("#adminPhone");
				var adminphoneValue = adminphone.value;
				var adminphonePattern = /^010-\d{3,4}-\d{4}$/;
				var adminphonePatternTest = adminphonePattern.test(adminphoneValue);
				var adminphonediv = document.getElementById("adminphonediv");
				if (adminphonePatternTest) {
					changeVaild(adminphonediv);
				} else {
					changeInvaild(adminphonediv);
					result = false;
				}
				
				var adminpassword2 = document.querySelector("#Retry_adminPw");
				var adminpassword2Value = adminpassword2.value;
				if (adminpassword2Value == "") {
					changeInvaild(adminpassworddiv2);
					result = false;
				} else if (adminpasswordValue == adminpassword2Value) {
					changeVaild(adminpassworddiv2);
				} else {
					changeInvaild(adminpassworddiv2);
					result = false;
				}
				console.log(result);
				return result;
			}
			
			function execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('postcode').value = data.zonecode;
								document.getElementById("address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("detailAddress")
										.focus();
							}
						}).open();
			}
		</script>
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
	<body>
		<!-- 메인부분 -->
		<div id="adminMain" class="card mx-auto">
		<div class="card-header">관리자 등록</div>
		<div class="card-body">
			<form id="pnameForm" name="pnameForm" method="post" action="${pageContext.request.contextPath}/admin/Register_NewAdminController" enctype="multipart/form-data">
				<div class="form-group">
					<label for="adminId">아이디</label>
					<input type="text" class="form-control" id="adminId" name="adminId" placeholder="아이디를 입력해주세요" value="${user.userId}"/>
					<small id="uidHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 6자 이상 10장 이하</small>
					<div id="adminIddiv"></div>
	          	</div>
	          	
	          	<div class="form-group">
	          		<label for="adminPw">비밀번호</label>
	          		<input type="password" class="form-control" id="adminPw" name="adminPw" placeholder="비밀번호를 입력해주세요"/>
	          		<small id="passwordHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하</small>
	          		<div id="adminpassworddiv"></div>
	          	</div>

	          	<div class="form-group">
	            	<label for="Retry_adminPw">비밀번호 재확인</label>
	            	<input type="password" class="form-control" id="Retry_adminPw" name="Retry_adminPw" placeholder="비밀번호를 다시입력해주세요"/>
	            	<small id="passwordHelp" class="form-text text-muted">패스워드와 똑같은 값을 입력해 주세요</small>
	            	<div id="adminpassworddiv2"></div>
	          	</div>

	          	<div class="form-group">
	            	<label for="adminName">관리자명</label>
	            	<input type="text" class="form-control" id="adminName" name="adminName" placeholder="관리자 이름을 입력해주세요"/>
	          	</div>
	          	
	          	<div class="form-group">
	            	<label for="adminPhone">핸드폰번호</label>
	            	<input type="text" class="form-control" id="adminPhone" name="adminPhone" placeholder="핸드폰번호를 입력해주세요"/>
	          		<small id="phoneHelp" class="form-text text-muted">예) 010-123-1234, 010-1234-1234</small>
	          		<div id="adminphonediv"></div>
	          	</div>

				<div class="form-group">
					<label for="address">Address</label><br>
					<input type="text" id="postcode" name="zipcode" size="5" readonly>
					<input type="button" value="우편번호검색"  onclick="execDaumPostcode()"><br>
					<input type="text" id="address" name="addr1" size="50" placeholder="주소" readonly><br>
					<input type="text" id="detailAddress" name="addr2" size="50" placeholder="상세주소">
					<small id="addressHelp" class="form-text text-muted">예) 서울특별시 마포구....</small>
				</div>
	
				<div class="text-center">
					<input type="submit" class="btn btn-outline-success btn-lg" onclick="return handleCheckData()" value="join"/>
					<a href="${pageContext.request.contextPath}" type="reset" class="btn btn-outline-warning btn-lg" >Reset</a>
				</div>
	          
	        </form>
	      </div>
	    </div>
	    
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>