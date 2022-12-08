/* 상품페이지 - [상품 설명] */
function productInfo(){
	$("#tab-content").empty();
	$("#shoes-detail").show();
}

/*================================[ 상품페이지 - Review ]==================================*/
/* 상품페이지 - [리뷰 목록] */
function productReview(i) {
	$("#tab-content").empty();
	$("#shoes-detail").hide();
	
	var url = new URL(window.location.href);
    var urlParam = url.searchParams;
    var pId = urlParam.get("productId");

	$.ajax({
		type : 'GET',  //get방식으로 통신
		url : "/shopping/review/ReviewListController?pageNo=" + i + "&productId=" + pId, //탭의 data-tab속성의 값으로 된 html파일로 통신
		error : function() { //통신 실패시
			alert('통신실패!');
		},
		success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
			console.log(data);
			$("#tab-content").html(data);
		}
	});
} 

/* 상품페이지 - [리뷰 상세히 보기] */
$(document).ready(function() {
	$("#reviewList tbody").on("click", "tr", function(){
		let status = $( this ).find("#reviewDetail").css("display");

		if(status =="none"){
			$( this ).find("#reviewDetail").css("display", "block");
		} else {
			$( this ).find("#reviewDetail").css("display", "none");
		}

	});
});

/* 상품페이지 - [리뷰 상세 - 좋아요] */
function good(i) {
	//console.log(i);
	//var btnTag = event.target;
	event.cancelBubble = true;
	$.ajax({
		type : 'POST',  //get방식으로 통신
		url : "/shopping/review/heartController", //탭의 data-tab속성의 값으로 된 html파일로 통신
		data : {reviewId : i}, 
		error : function() { //통신 실패시
			alert('통신실패!');
		},
		success : function(data) {
			//btnTag.innerHTML = "좋아요 (" + data + ")";
			$("#goodBtn" + i ).html('<a class="btn btn-danger btn-sm mt-3" onclick="cancelGood(' + i + ')">좋아요  <b>' + data + '</b> </a>');
		}
	});
}

/* 상품페이지 - [리뷰 상세 - 좋아요 취소] */
function cancelGood(i) {
	event.cancelBubble = true;
	$.ajax({
		type : 'GET',  //get방식으로 통신
		url : "/shopping/review/heartController?reviewId=" + i, //탭의 data-tab속성의 값으로 된 html파일로 통신
		error : function() { //통신 실패시
			alert('통신실패!');
		},
		success : function(data) {
			console.log(data);
			$("#goodBtn" + i ).html('<a class="btn btn-outline-danger btn-sm mt-3" onclick="good(' + i + ')">좋아요  <b>' + data + '</b> </a>');
		}
	});
}

/* 댓글보기On */
function replyList(i) {
	event.cancelBubble = true;
	$("#replyList" + i ).css("display", "block");
	$("#replyBtn" + i ).html('<a class="btn btn-dark btn-sm mt-3" onclick="noReplyList(' + i + ')">댓글보기</a>');
}

/* 댓글보기Off */
function noReplyList(i) {
	event.cancelBubble = true;
	$("#replyList" + i ).css("display", "none");
	$("#replyBtn" + i ).html('<a class="btn btn-outline-dark btn-sm mt-3" onclick="replyList(' + i + ')">댓글보기</a>');
}

/* 댓글작성창 클릭했을 때도 상세보기가 닫히지 않고 그대로 유지*/
$(document).ready(function() {
	$("#writeReplyForm input").on("click", function(){
		event.cancelBubble = true;
	});
});

/* 댓글작성 후, 전송*/
function replyPost() {
	event.cancelBubble = true;
	$.ajax({
		type : 'POST',
		url : "/shopping/review/WriteReplyController", //탭의 data-tab속성의 값으로 된 html파일로 통신
		error : function() {
			alert('통신실패!');
		},
		success : function(data) {
			console.log(data);
		}
	});
}

/* 마이페이지 - [리뷰 등록] */
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	
	fileTarget.on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} 
		else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		
		// 추출한 파일명 삽입
		$(this).siblings('.upload-name').val(filename);
	});
}); 

/*================================[ QNA ]==================================*/
/* 상품페이지 - [QnA 목록] */
function productQna() {
	$("#tab-content").empty();
	
	$.ajax({
		type : 'GET',  //get방식으로 통신
		url : "/shopping/qna/QnaListController", //탭의 data-tab속성의 값으로 된 html파일로 통신
		error : function() { //통신 실패시
			alert('통신실패!');
		},
		success : function(data) { //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
			console.log(data);
			$("#tab-content").html(data);
		}
	});
} 

/* 상품페이지 - [QnA 상세히 보기] */
$(document).ready(function() {
	$("#qnaList tbody").on("click", "tr", function(){
		let status = $( this ).find(".qnaDetail").css("display");

		if(status =="none"){
			$( this ).find(".qnaDetail").css("display", "block");
		}
		else $( this ).find(".qnaDetail").css("display", "none");

	});
});

