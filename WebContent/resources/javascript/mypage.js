//--------------마이페이지_메인(회원정보 수정)-----------------

//사진변경버튼 -> 숨겨진 버튼 생기게하기
function changePhoto() {
	$("#choicePhoto").show();
	$("#orginPhoto").show();
	$("#cancelPhoto").show();
	$("#changePhoto").text("완료");
}

//사진변경 완료버튼 -> 프로필 변경되게 구현


//사진변경 취소 버튼 -> 원래대로
function cancelPhoto(){
	$("#choicePhoto").hide();
	$("#orginPhoto").hide();
	$("#cancelPhoto").hide();
	$("#changePhoto").text("사진변경");
}

//사진선택(변경)
function defaultPhoto(){
	$("#profile").attr();
}

//비밀번호 변경 버튼 -> 변경창으로 변환
function changePwDiv() {
	$("#defaultPw>strong").hide();
	$("#modifyPw").show();
	$("#cancelPw").show();
	$("#changePw").text("완료");
}

//비밀번호 취소버튼 -> 원래대로
function cancelPwDiv() {
	$("#defaultPw>strong").show();
	$("#modifyPw").hide();
	$("#cancelPw").hide();
	$("#changePw").text("비밀번호 변경");
	
}


//--------------마이페이지_메인(회원탈퇴)-----------------
var isValidatedLoginData = true;

function checkUserPass() {
	var userPw = $("#userPw").val();
	//유효성 검사
	//var isValidatedLoginData = false;
}

function pass() {
	if(isValidatedLoginData) {
		var passForm = document.querySelector("#pwForm");
		
		//자바스크립트의 form 제출 기능 호출
		//var check = pwForm.submit(); //제이쿼리는 submit 기능이 없음 그래서 엘리먼트로 생성!
        $(".modal-dialog > .passModal").modal();
		
		//submit -> 비밀번호 일치 여부 확인후, 일치하면 modal 열 수 있도록 구현
		if(check) {
	        $(".modal-dialog > .passModal").show();
		}
	}
}