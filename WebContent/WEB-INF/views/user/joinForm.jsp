<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function changeVaild(id){
				id.innerHTML = '<h8><span style="color:green">올바른 입력입니다.</span></h8>';
			}
			
			function changeInvaild(id){
				id.innerHTML = '<h8><span style="color:red">잘못된 입력입니다.</span></h8>';
			}
			function handleCheckData(){
				var result = true;
	            //id검사
	            
	            var uid = document.querySelector("#userid");
	            var uidValue = uid.value;
	            var uidPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}$/;
	            var uidTest = uidPattern.test(uidValue);
	            var uiddiv = document.getElementById("uiddiv");
	            if(uidTest){
	            	changeVaild(uiddiv);
	            } else{
	               changeInvaild(uiddiv);
	               result = false;
	            }
	            
	            //Password 유효성 검사 -------------------------------------------------------
	               //패스워드 검사
	               var password = document.querySelector("#userpassword");
	            	var passwordValue = password.value;
	               var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/; 
	               var passwordPatternTest = passwordPattern.test(passwordValue);
	               var passworddiv = document.getElementById("passworddiv");
	               if(passwordPatternTest) {
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
	            if(phonePatternTest) {
	            	changeVaild(phonediv);
	            } else {
	            	changeInvaild(phonediv);
					result = false;
	            }
				return result;
			}
			
			
			
			$(document).ready(function() {
				$("#cbx_chkAll").click(function() {
					if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
					else $("input[name=chk]").prop("checked", false);
				});
				
				$("input[name=chk]").click(function() {
					var total = $("input[name=chk]").length;
					var checked = $("input[name=chk]:checked").length;
					
					if(total != checked) $("#cbx_chkAll").prop("checked", false);
					else $("#cbx_chkAll").prop("checked", true); 
				});
			});
			
		    function execDaumPostcode() {
		        new daum.Postcode({
		        	oncomplete: function(data) {
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
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
			
		</script>
		
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/productList.css">
		<link rel="stylesheet" href="../resources/css/joinForm.css">
		
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
	
	<body>
		<!-- 여기서부터 조인 페이지=============================================== -->	
		<div id="joinPage-wrap">
			<div class="card-header m-2 text-center">
				<h1>회원가입</h1>
			</div>
			<div class="card-body">
	      		<div id="texts">
	      			<div class="checkbox_group" style="border-bottom-style: solid;">
		      			<h3 class="p-1" style="border-bottom-style: solid;">약관동의</h3>
		      			<h5>
		      				<input type="checkbox" id="cbx_chkAll" />
		      				<label for="check_all">전체 약관에 동의합니다</label>
		      			</h5>
		      			<h6>
		      				<input type="checkbox" name="chk"/>
		      				<label>
		      					<span style="color:red">[필수]</span>
		      					<a href="#" data-toggle="modal" data-target="#terms1">사이트 이용 약관에 동의합니다</a>
		      					<div class="modal fade" id="terms1">
		      						<div class="modal-dialog modal-lg modal-dialog-centered">
		      							<div class="modal-content">
		      								<!-- Modal Header -->
		      								<div class="modal-header">
		      									<h4 class="modal-title mx-auto"> 사이트 이용 약관 </h4>
		      									<button type="button" class="close" data-dismiss="modal">&times;</button>
		      								</div>
		      								
		      								<!-- Modal body -->
		      								<div class="modal-body">
		      									<div>
			      									제 1 장 총 칙
			      									<br/>제 1 조 (목적)
			      									<br/>이 약관은 {COMPANY_NAME}(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.
			      									<br/>
			      									<br/>제 2 조 (약관의 효력 및 변경)
			      									<br/>① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
			      									<br/>② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
			      									<br/>
			      									<br/>제 3 조 (용어의 정의)
			      									<br/>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
			      									<br/>① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
			      									<br/>② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
			      									<br/>③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
			      									<br/>④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
			      									<br/>⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.
		      									</div>
		      								</div>
		      							</div>
		      						</div>
		      					</div>
		      				</label>
		      			</h6>
		      			<h6>
		      				<input type="checkbox" name="chk"/>
		      				<label>
		      					<span style="color:red">[필수]</span>
		      					<a href="#" data-toggle="modal" data-target="#terms2">개인정보 제공에 동의합니다</a>
		      					<div class="modal fade" id="terms2">
		      						<div class="modal-dialog modal-lg modal-dialog-centered">
		      							<div class="modal-content">
		      								<!-- Modal Header -->
		      								<div class="modal-header">
		      									<h4 class="modal-title mx-auto"> 개인정보 약관 </h4>
		      									<button type="button" class="close" data-dismiss="modal">&times;</button>
		      								</div>
		      								
		      								<!-- Modal body -->
		      								<div class="modal-body">
		      									<div>
		      										제 2 장 서비스 이용계약
		      										<br/>
													<br/>제 4 조 (이용계약의 성립)
													<br/>① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
													<br/>② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.
													<br/>
													<br/>제 5 조 (이용신청)
													<br/>① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
													<br/>② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.
													<br/>
													<br/>제 6 조 (이용신청의 승낙)
													<br/>① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
													<br/>② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
													<br/>가. 서비스 관련 설비에 여유가 없는 경우
													<br/>나. 기술상 지장이 있는 경우
													<br/>다. 기타 사이트가 필요하다고 인정되는 경우
													<br/>③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
													<br/>가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
													<br/>나. 이용자 정보를 허위로 기재하여 신청한 경우
													<br/>다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
													<br/>라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우
		      									</div>
		      								</div>
		      							</div>
		      						</div>
		      					</div>
		      				</label>
		      			</h6>
	      			</div>
	      		</div>
	      	<br>
	      		<form method="post" id="joinForm" name="joinForm" action="/shopping/user/JoinFormController" novalidate>
	      			<div class="form-group form-floating">
	      				<label for="uname">Name</label>
	      				<input type="text" class="form-control" placeholder="홍길동" id="uname" name="uname"/>
	      				<small id="unameHelp" class="form-text text-muted">이름을 입력하세요</small>
					</div>
					<div class="form-label form-floating">
						<label for="userid">ID</label>
						<input type="text" class="form-control" placeholder="Abc123" id="userid" name="userid"/>
						<small id="uidHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 6자 이상 10장 이하</small>
						<div id="uiddiv"></div>
					</div>
	
					<div class="form-group form-floating" >
						<label for="userpassword">Password</label>
						<input type="password" class="form-control" placeholder="password" id="userpassword" name="userpassword"/>
						<small id="passwordHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하</small>
						<div id="passworddiv"></div>
					</div>
	
					<div class="form-group form-floating">
			            <label for="phone">Phone</label>
			            <input type="text" class="form-control" placeholder="010-123-1234" id="phone" name="phone"/>
			            <small id="phoneHelp" class="form-text text-muted">예) 010-123-1234, 010-1234-1234</small>
			            <div id="phonediv"></div>
					</div>
					
					<div class="form-group form-floating">
			            <label for="email">Email</label>
			            <input type="text" class="form-control" placeholder="xxxx@naver.com" id="email" name="email"/>
			            <small id="emailHelp" class="form-text text-muted">예) java@naver.com, java@daum.net</small>
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