<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		<script>
			function changeVaild(id){
				id.innerHTML = '<h8><span style="color:green">올바른 입력입니다.</span></h8>';
			}
			
			function changeInvaild(id){
				id.innerHTML = '<h8><span style="color:red">잘못된 입력입니다.</span></h8>';
			}
			function handleCheckData(){
				var result = true;
				
	            //패스워드 검사
				var password = document.querySelector("#userpassword");
				var passwordValue = password.value;
				var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
				var passwordPatternTest = passwordPattern.test(passwordValue);
				var passworddiv = document.getElementById("passworddiv");
				if (passwordPatternTest) {
					changeVaild(passworddiv);
				} else {
					changeInvaild(passworddiv);
					result = false;
				}

				//전화번호 유효성 검사
				var phone = document.querySelector("#phone");
				var phoneValue = phone.value;
				var phonePattern = /^010-\d{3,4}-\d{4}$/;
				var phonePatternTest = phonePattern.test(phoneValue);
				var phonediv = document.getElementById("phonediv");
				if (phonePatternTest) {
					changeVaild(phonediv);
				} else {
					changeInvaild(phonediv);
					result = false;
				}
				
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
	</head>
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
		<!-- 메인페이지 -->
<div class="shoesmain d-flex">
	<div class="shoesmain-1 col-xs-2">

		<%@ include file="/WEB-INF/views/fragment/mypage_sidebar.jsp"%>

	</div>
		<!-- main -->
		<div class="shoesmain-2 col-xs-10">
			<div id="mainDiv" class="card my-3">
				<div class="card-header" style="background-color: LightGray;">
					<strong style="font-size: 35px;">기본 회원정보</strong> 
					<span class="ml-3" style="color: DimGray; font-size: 25px;">
						<b>필수</b>
					</span>
				</div>
				<div class="card-body">
					<form method="post" id="updateForm" name="updateForm" action="${pageContext.request.contextPath}/mypage/MainController" enctype="multipart/form-data">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td>사진</td>
									<td id="userPhoto" class="py-0">
										<div id="profile" class="d-flex align-items-center mb-3" style="height: 120px;">
											<c:if test="${user.filename == null}">
												<i class="bi bi-person-square" style="font-size: 6rem; margin: auto; color: Silver;"></i>
											</c:if>
											<c:if test="${user.filename != null}">
												<img src="${pageContext.request.contextPath}/mypage/ImageController?userId=${loginId}" style="width:100px; height:100px; margin: auto"/>
											</c:if>
											
										</div>
									</td>
									<td>
										<input type="file" class="form-control-file" id=userattach" name="userattach">
									</td>
								</tr>
								<tr>
									<td>아이디</td>
									<td>
										<strong>${user.userId}</strong>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>
										<strong>${user.userPassword}</strong>
									</td>
									<td>
										<input type="text" class="form-control" id="userpassword" name="userpassword"/>
										<div id = "passworddiv"></div>
										<small id="passwordHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하</small>
										<div id = "passworddiv"></div>
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>
										<strong>${user.userName}</strong>
									</td>
									<td>
										<input type="text" class="form-control" id="uname" name="uname"/>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<strong>${user.userAddress}</strong>
									</td>
									<td>
										<input type="text" id="postcode" name="zipcode" size="5" readonly>
										<input type="button" value="우편번호검색"  onclick="execDaumPostcode()"><br>
										<input type="text" id="address" name="addr1" size="50" placeholder="주소" readonly><br>
										<input type="text" id="detailAddress" name="addr2" size="50" placeholder="상세주소">
										<small id="addressHelp" class="form-text text-muted">예) 서울특별시 마포구....</small>
									</td>
								</tr>
								<tr>
									<td>핸드폰번호</td>
									<td>
										<strong>${user.phoneNumber}</strong>
									</td>
									<td>
										<input type="text" class="form-control" id="phone" name="phone"/>
										<small id="phoneHelp" class="form-text text-muted">예) 010-123-1234, 010-1234-1234</small>
										<div id="phonediv"></div>
									</td>
								</tr>
							</tbody>
						</table>
						<div style="text-align: center">
							<input type="submit" class="btn btn-dark btn-lg" onclick="return handleCheckData()" value="개인 정보 수정"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	