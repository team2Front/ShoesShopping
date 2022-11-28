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