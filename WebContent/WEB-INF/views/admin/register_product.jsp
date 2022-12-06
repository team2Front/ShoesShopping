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

			<form id="pnameForm" class="was-validated" name="pnameForm" action="#" onsubmit="handleCheckData()" novalidate>
			
				<div class="form-group">
					<label for="pname"  >상품명</label> 
					<input type="text" class="form-control" id="pname" name="pname" placeholder="상품명" required>
					<div class="valid-feedback">올바른 입력입니다</div>
      				<div class="invalid-feedback">상품명을 작성해주세요</div>
				</div>

				<div class="form-group">
					<label for="pprice">가격</label> 
					<input type="text" class="form-control" id="pprice" name="pprice" placeholder="(ex) 129000" required>
					<div class="valid-feedback">올바른 입력입니다</div>
      				<div class="invalid-feedback">가격을 작성해주세요</div>
				</div>
				
				<!-- 사이즈 선택하기 -->
				<div class="cbtn-group btn-group" data-toggle="buttons"
					style="width: 800px;">
					<label for="psize" class="mx-2 my-2">사이즈</label>
					<div class="form-check">
					
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px; margin: 3px auto;"> 220
						<input class="psize" type="checkbox" name="psize" value="220" autocomplete="off" checked>
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 225 
						<input class="psize" type="checkbox" name="psize" value="225" autocomplete="off">
						<i class="fa fa-check"></i>
						</label>
						
						 <label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 230 
						 <input type="checkbox" name="psize" value="230" autocomplete="off"> 
						 <i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 235 
						<input type="checkbox" name="psize" value="235" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 240 
						<input type="checkbox" name="psize" value="240" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 245 
						<input type="checkbox" name="psize" value="245" autocomplete="off">
						<i class="fa fa-check"></i>
						</label>
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 250 
						<input type="checkbox" name="psize" value="250" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 255 
						<input type="checkbox" name="psize" value="255"autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 260 
						<input type="checkbox" name="psize" value="260" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 265 
						<input type="checkbox" name="psize" value="265" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label>
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 270 
						<input type="checkbox" name="psize" value="270" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 275 
						<input type="checkbox" name="psize" value="275" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label>
						
						<label class="cbtn btn btn-secondary" style="width: 75px; height: 40px;"> 280 
						<input type="checkbox" name="psize" value="280" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<small id="psizeHelp" class="form-text text-muted">하나 이상 선택해주세요</small>
					</div>
				</div>
				
				<!-- 색상 선택하기 -->
				<div class="cbtn-group btn-group" data-toggle="buttons"
					style="width: 620px;">
					<label for="pcolor" class="mx-2 my-2">색상</label>
					<div class="form-check">
					
						<label class="cbtn btn red active" style="width: 40px; height: 40px;"> 
						<input type="checkbox" name="pcolor" value="red" autocomplete="off" checked> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn pink" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="pink" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn orange" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="orange" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn yellow" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="yellow" autocomplete="off"> 
						<i class="fa fa-check" style="color: black"></i>
						</label>
						
						<label class="cbtn btn lime" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="lime" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn green" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="green" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn blue" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="blue" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn navy" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="navy" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn purple" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="purple" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn brown" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="brown" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn white" style="border: 1px groove gray; width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="white" autocomplete="off"> 
						<i class="fa fa-check" style="color: black"></i>
						</label>
						
						<label class="cbtn btn gray" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="gray" autocomplete="off">
						<i class="fa fa-check"></i>
						</label>
						
						 
						<label class="cbtn btn black" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="black" autocomplete="off">
						<i class="fa fa-check"></i>
						</label> 
						
						<small id="pcolorHelp" class="form-text text-muted">하나 이상 선택해주세요</small>
					</div>
				</div>

				<div class="form-group">
					<label for="brand" class="mx-2 mt-3 mb-1">브랜드</label> 
					<select id="brand" name="brand" class="form-control">
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
					<label class="custom-file-label" for="attach1">상품 사진1</label> 
					<input class="custom-file-input" type="file" class="form-control" id="attach1" name="attach1"> 
					<label class="custom-file-label" for="attach2">상품 사진2</label> 
					<input class="custom-file-input" type="file" class="form-control" id="attach2" name="attach2"> 
					<label class="custom-file-label" for="attach3">상품 사진3</label> 
					<input class="custom-file-input" type="file" class="form-control" id="attach3" name="attach3"> 
					<label class="custom-file-label" for="attach4">상품 사진4</label> 
					<input class="custom-file-input" type="file" class="form-control" id="attach4" name="attach4"> 
					<label class="custom-file-label" for="attach5">상품 사진5</label> 
					<input class="custom-file-input" type="file" class="form-control" id="attach5" name="attach5">
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