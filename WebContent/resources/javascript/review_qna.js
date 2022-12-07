$(document).ready(function() {
	$("#qnaList tbody").on("click", "tr", function(){
		let status = $( this ).find(".qnaDetail").css("display");

		if(status =="none"){
			$( this ).find(".qnaDetail").css("display", "block");
		}
		else $( this ).find(".qnaDetail").css("display", "none");

	});
});