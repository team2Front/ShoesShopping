<%@ page contentType="text/html; charset=UTF-8"%>

<body>
	  <div class="banner d-flex justify-content-between" id="adminBanner">  
	    <div class="p-2"><a href="${pageContext.request.contextPath}"><img src="../resources/images/sashoes_logo.png" style="width:150px; margin-top:20px;"/></a></div>
		
	    <div  style="text-align: center; padding-top: 35px;"><a href="${pageContext.request.contextPath}/user/joinFormController">회원가입</a></div>
	    <div  style="text-align: center; padding-top: 35px;"><a href="${pageContext.request.contextPath}/mypage/MainController">마이페이지</a></div>
	    <div  style="text-align: center; padding-top: 35px;">
	    <!--------------------------------------------------------- 로그인 창 --------------------------------------->
	    	<a href="#" data-toggle="modal" data-target="#myLogin">로그인</a>
	    	<div class="modal fade" id="myLogin">
			    <div class="modal-dialog modal-sm modal-dialog-centered">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title mx-auto">로그인</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			            <form id="loginForm" name="loginForm" action="#" onsubmit="return handleCheckData()" novalidate>
					          <div class="form-group">
					            <label for="uid">ID</label>
					            <input type="text" class="form-control" id="uid" name="uid" value=""/>
					            <small id="uidHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 6자 이상 10장 이하를 입력해주세요</small>
					          </div>
					
					          <div class="form-group">
					            <label for="password">Password</label>
					            <input type="password" class="form-control" id="password" name="password" value=""/>
					            <small id="passwordHelp" class="form-text text-muted">알파벳 대소문자, 숫자를 혼용해서 8자 이상 15장 이하를 입력해주세요</small>
					          </div>
			          	</form>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			        	<button type="submit" class="btn bg-warning" data-dismiss="modal">로그인</button>
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			</div>
			
	    </div>
	  </div>
		<div id="navbar" class="shadow-sm">
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
					MEN
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">남성 운동화</a>
					<a class="dropdown-item" href="#">남성 스니커즈</a>
					<a class="dropdown-item" href="#">남성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
					WOMEN
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">여성 운동화</a>
					<a class="dropdown-item" href="#">여성 스니커즈</a>
					<a class="dropdown-item" href="#">여성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2" data-toggle="dropdown">
					KIDS
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">아이 운동화</a>
					<a class="dropdown-item" href="#">아이 스니커즈</a>
					<a class="dropdown-item" href="#">아이 샌들</a>
				</div>
			</div>	
		</div>