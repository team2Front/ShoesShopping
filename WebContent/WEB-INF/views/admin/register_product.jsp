<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- 공통 css -->
		<link rel="stylesheet" href="../resources/css/customCheckbox.css">
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		<!-- 구글폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<div id="banner">
			<div style="width:500px; margin:0px auto;">
    			<a href="/shopping/admin/HomeController"><img src="../images/sashoes_logo.png" style="width:250px; height:100px;"/></a>
   				<span class="banner-font p-2">관리자</span>
			</div>	  	
	  	</div>
	  	
	    <div id="wrapper" class="card">
	      <div class="card-header">상품등록</div>
	      <div class="card-body">
	        <form id="pnameForm" name="pnameForm" action="#" onsubmit="handleCheckData()" novalidate>
	          <div class="form-group">
	            <label for="pname">상품명</label>
	            <input type="text" class="form-control" id="pname" name="pname" value="(ex) 에어포스1"/>
	            <!-- <small id="uidHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 6자 이상 10장 이하</small> -->
	          </div>
	
	          <div class="form-group">
	            <label for="price">가격</label>
	            <input type="text" class="form-control" id="price" name="price" value="(ex) 129000"/>
	          </div>
	
       		<div class="cbtn-group btn-group" data-toggle="buttons" style="width:1100px;">
       			<label for="psize" class="mx-2 my-2">사이즈</label>
       			<div class="form-check">
					<label class="cbtn btn btn-info" style="width:75px; height:40px; margin:3px auto;">
						220
						<input class="psize" type="checkbox" autocomplete="off" checked>
						<i class="fa fa-check"></i>
					</label>
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						225
						<input class="psize" type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						230
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						235
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						240
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						245
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						250
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						255
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						260
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						265
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						270
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						275
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn btn-info" style="width:75px; height:40px;">
						280
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					
					<small id="psizeHelp" class="form-text text-muted">하나 이상 선택해주세요</small>		
				</div>
			</div>
			
       		<div class="cbtn-group btn-group" data-toggle="buttons" style="width:620px;">
       			<label for="pcolor" class="mx-2 my-2">색상</label>
       			<div class="form-check">
					<label class="cbtn btn red active" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off" checked>
						<i class="fa fa-check"></i>
					</label>
					<label class="cbtn btn pink" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn orange" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn yellow" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check" style="color:black"></i>
					</label>			
					<label class="cbtn btn lime" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn green" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn blue" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn navy" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn purple" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn brown" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn white" style="border:1px groove gray; width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check" style="color:black"></i>
					</label>			
					<label class="cbtn btn gray" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
						<i class="fa fa-check"></i>
					</label>			
					<label class="cbtn btn black" style="width:40px; height:40px;">
						<input type="checkbox" autocomplete="off">
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
	        	<label for="gender" class="mx-2 mt-3 mb-1">성별</label>
            	<select id="gender" name="gender" class="form-control">
              		<option selected>--선택--</option>
              		<option value="man">남자</option>
              		<option value="woman">여자</option>
              		<option value="kids">키즈</option>
              		<option value="all">전체</option>
            	</select>
	        </div>
	
	          <div class="text-center">
	            <input type="submit" class="btn btn-primary" value="Join" />
	            <input type="reset" class="btn btn-primary" value="Reset" />
	          </div>
	        </form>
	      </div>
	    </div>
	</body>
</html>