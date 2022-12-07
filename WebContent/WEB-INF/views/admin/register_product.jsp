<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>

		<!-- resource/css 링크 -->
		<link rel="stylesheet" href="../resources/css/customCheckbox.css">
		
		<!-- font 링크 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>
<body>
	<!-- 메인부분 -->
	<div id="adminMain" class="card mx-auto">
		<div class="card-header">상품등록</div>
		<div class="card-body">

			<form id="pnameForm" name="pnameForm" action="#"
				onsubmit="handleCheckData()" novalidate>
				<div class="form-group">
					<label for="pname">상품명</label> <input type="text"
						class="form-control" id="pname" name="pname" value="(ex) 에어포스1" />
				</div>

				<div class="form-group">
					<label for="price">가격</label> <input type="text"
						class="form-control" id="price" name="price" value="(ex) 129000" />
				</div>

				<div class="cbtn-group btn-group" data-toggle="buttons"
					style="width: 800px;">
					<label for="psize" class="mx-2 my-2">사이즈</label>
					<div class="form-check">
						<label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px; margin: 3px auto;"> 220
							<input class="psize" type="checkbox" autocomplete="off" checked>
							<i class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 225 <input
							class="psize" type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 230 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 235 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 240 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 245 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 250 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 255 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 260 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 265 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 270 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 275 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn btn-secondary"
							style="width: 75px; height: 40px;"> 280 <input
							type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <small id="psizeHelp" class="form-text text-muted">하나 이상
							선택해주세요</small>
					</div>
				</div>

				<div class="cbtn-group btn-group" data-toggle="buttons"
					style="width: 620px;">
					<label for="pcolor" class="mx-2 my-2">색상</label>
					<div class="form-check">
						<label class="cbtn btn red active"
							style="width: 40px; height: 40px;"> <input
							type="checkbox" autocomplete="off" checked> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn pink" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn orange" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn yellow" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check" style="color: black"></i>
						</label> <label class="cbtn btn lime" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn green" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn blue" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn navy" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn purple" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn brown" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn white"
							style="border: 1px groove gray; width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check" style="color: black"></i>
						</label> <label class="cbtn btn gray" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <label class="cbtn btn black" style="width: 40px; height: 40px;">
							<input type="checkbox" autocomplete="off"> <i
							class="fa fa-check"></i>
						</label> <small id="pcolorHelp" class="form-text text-muted">하나 이상
							선택해주세요</small>
					</div>
				</div>

				<div class="form-group">
					<label for="brand" class="mx-2 mt-3 mb-1">브랜드</label> <select
						id="brand" name="brand" class="form-control">
						<option selected>--선택--</option>
						<option value="nike">나이키</option>
						<option value="adidas">아디다스</option>
						<option value="vans">반스</option>
						<option value="newbalance">뉴발란스</option>
						<option value="canvas">컨버스</option>
					</select>
				</div>

				<div class="form-group">
					<label for="gender" class="mx-2 mt-3 mb-1">성별</label> <select
						id="gender" name="gender" class="form-control">
						<option selected>--선택--</option>
						<option value="man">남자</option>
						<option value="woman">여자</option>
						<option value="kids">키즈</option>
						<option value="all">전체</option>
					</select>
				</div>

				<div class="custom-file">
					<label class="custom-file-label" for="battach1">상품 사진1</label> <input
						class="custom-file-input" type="file" class="form-control"
						id="battach1" name="battach1"> <label
						class="custom-file-label" for="battach2">상품 사진2</label> <input
						class="custom-file-input" type="file" class="form-control"
						id="battach2" name="battach2"> <label
						class="custom-file-label" for="battach3">상품 사진3</label> <input
						class="custom-file-input" type="file" class="form-control"
						id="battach3" name="battach3"> <label
						class="custom-file-label" for="battach4">상품 사진4</label> <input
						class="custom-file-input" type="file" class="form-control"
						id="battach4" name="battach4"> <label
						class="custom-file-label" for="battach5">상품 사진5</label> <input
						class="custom-file-input" type="file" class="form-control"
						id="battach5" name="battach5">
				</div>

				<!-- request 버튼 -->
				<div class="text-center">
					<input type="submit" class="btn btn-outline-primary btn-sm"
						value="등록" /> <input type="reset"
						class="btn btn-outline-secondary btn-sm" value="취소" />
				</div>

			</form>

		</div>
	</div>

<%@ include file="/WEB-INF/views/fragment/footer.jsp"%>