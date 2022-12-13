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

			<form id="pnameForm" method="post" class="was-validated" enctype="multipart/form-data"  action="${pageContext.request.contextPath}/admin/Register_ProductController" novalidate>
			
				<div class="form-group">
					<label for="pname"  >상품명</label> 
					<input type="text" class="form-control" id="pname" name="pname" placeholder="상품명" required>
					<div class="valid-feedback">올바른 입력입니다</div>
      				<div class="invalid-feedback">상품명을 작성해주세요</div>
				</div>

				<div class="form-group">
					<label for="pprice">가격</label> 
					<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
					class="form-control" id="pprice" name="pprice" placeholder="(ex) 129000" required>
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
						<input type="checkbox" name="pcolor" value="1" autocomplete="off" checked> 
						<i class="fa fa-check"></i>
						</label> 
						
						
						
						<label class="cbtn btn orange" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="2" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn yellow" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="3" autocomplete="off"> 
						<i class="fa fa-check" style="color: black"></i>
						</label>
						
						<label class="cbtn btn green" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="4" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn blue" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="5" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn navy" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="6" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn purple" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="7" autocomplete="off"> <i
						class="fa fa-check"></i>
						</label> 
						<label class="cbtn btn pink" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="8" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn white" style="border: 1px groove gray; width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="9" autocomplete="off"> 
						<i class="fa fa-check" style="color: black"></i>
						</label>
						
						<label class="cbtn btn black" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="10" autocomplete="off">
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn brown" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="11" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						<label class="cbtn btn gray" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="12" autocomplete="off">
						<i class="fa fa-check"></i>
						</label>
						
						<label class="cbtn btn lime" style="width: 40px; height: 40px;">
						<input type="checkbox" name="pcolor" value="13" autocomplete="off"> 
						<i class="fa fa-check"></i>
						</label> 
						
						
						<small id="pcolorHelp" class="form-text text-muted">하나 이상 선택해주세요</small>
					</div>
				</div>

				<div class="form-group">
					<label for="brand" class="mx-2 mt-3 mb-1">브랜드</label> 
					<select id="brand" name="pbrand" class="form-control">
						<option selected>--선택--</option>
						<option value="1">아디다스</option>
						<option value="2">반스</option>
						<option value="3">컨버스</option>
						<option value="4">뉴발란스</option>
						<option value="5">나이키</option>
					</select>
				</div>
				<!-- 카테고리 -->
				<div class="form-group">
					<label for="category" class="mx-2 mt-3 mb-1">카테고리</label> <select
						id="category" name="pcategory" class="form-control">
						<option selected>--선택--</option>
						<option value="1">운동화</option>
						<option value="2">구두</option>
						<option value="3">워커</option>
					</select>
				</div>

				<div class="form-group">
					<label for="gender" class="mx-2 mt-3 mb-1">성별</label> 
					<select
						id="gender" name="pgender" class="form-control">
						<option selected>--선택--</option>
						<option value="MEN">남자</option>
						<option value="WOMEN">여자</option>
						<option value="KIDS">키즈</option>
						<option value="ALL">전체</option>
					</select>
				</div>

				<div class="form-group">
			        <label for="attach">상품사진1</label>
			        <input type="file" class="form-control-file" id="attach" name="attach" multiple>
			    </div>
			    
			    <div class="form-group">
			        <label for="attach">상품사진2</label>
			        <input type="file" class="form-control-file" id="attach" name="attach" multiple>
			    </div>
			    
			    <div class="form-group">
			        <label for="attach">상품사진3</label>
			        <input type="file" class="form-control-file" id="attach" name="attach" multiple>
			    </div>
			     
				<div class="form-group">
			        <label for="attach">상품사진4</label>
			        <input type="file" class="form-control-file" id="attach" name="attach" multiple>
			    </div>
			     
				<div class="form-group">
			        <label for="attach">상품사진5</label>
			        <input type="file" class="form-control-file" id="attach" name="attach" multiple>
			    </div>
			     
				

				<!-- request 버튼 -->
				<div class="text-center">
					<input type="submit" class="btn btn-outline-primary btn-sm" value="등록" /> 
					<input type="reset" class="btn btn-outline-secondary btn-sm" value="취소" />
				</div>

			</form>

		</div>
	</div>

<%@ include file="/WEB-INF/views/fragment/footer.jsp"%>