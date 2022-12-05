<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shashoes</title>	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/productList.css">
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		
	</head>
	<body>
	  <div class="banner d-flex justify-content-between">  
	    <div class="p-2"><img src="../images/sashoes_logo.png" style="width:150px; margin-top:20px;"/></div>
	    
	    <div class="p-2">
		    <div class="row">
		    	<input class="search col-10 search-txt" type="text" placeholder="검색어를 입력해 주세요">
				<button class="search_button col-2 btn-primary" type="submit">찾기</button>
		    </div>
		</div>
		
	    <div  style="text-align: center; padding-top: 35px;"><a href="/shopping/user/JoinFormController">회원가입</a></div>
	    <div  style="text-align: center; padding-top: 35px;"><a href="/shopping/mypage/MainController">마이페이지</a></div>
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
		<div class="shoesmain d-flex" >
		
		<!-- 사이드 바  -->
			<div class="col-md-2"> 
				<div id="sidebar" >		
					 <button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					   Color
					 </button>
					<div class="collapse mb-2" id="collapseExample">
					  <div class="card card-body shoesColors">
						  <div class = "row">
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="red"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="orange"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="yellow"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="green"></div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="blue"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="lime"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="navy"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="purple"></div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="pink"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="brown"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="black"></div>
						  	<div class="col-2 m-1 color-box"><input type="checkbox" class="gray"></div>
				  		</div>
				  
					  </div>
					</div>
					
					<button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
					   Size
					 </button>
					<div class="collapse mb-2" id="collapseExample2">
					  <div class="card card-body">
						  <div class = "row">
							  	<div class="btn size-btn col m-1 border border-6">215</div>
							  	<div class="btn col m-1 border border-6">220</div>
							  	<div class="btn col m-1 border border-6">225</div>
					  		</div>
					  		
					  		<div class = "row">
							  	<div class="btn col m-1 border border-6">230</div>
							  	<div class="btn col m-1 border border-6">235</div>
							  	<div class="btn col m-1 border border-6">240</div>
					  		</div>
					  		
					  		<div class = "row">
							  	<div class="btn col m-1 border border-6">245</div>
							  	<div class="btn col m-1 border border-6">250</div>
							  	<div class="btn col m-1 border border-6">255</div>
					  		</div>
					  		
					  		<div class = "row">
							  	<div class="btn col m-1 border border-6">260</div>
							  	<div class="btn col m-1 border border-6">270</div>
							  	<div class="btn col m-1 border border-6">280</div>
					  		</div>
					  </div>
					</div>
					
					<button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">
					   Price
					 </button>
					<div class="collapse mb-2" id="collapseExample3">
					  <div class="card card-body">
					  	<div class = "container-fluid">
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								  <label class="form-check-label" for="flexRadioDefault1">
								    0 ~ 50,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								  <label class="form-check-label" for="flexRadioDefault1">
								    50,000 ~ 80,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								  <label class="form-check-label" for="flexRadioDefault1">
								    80,000 ~ 100,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								  <label class="form-check-label" for="flexRadioDefault1">
								    100,000 ~ 150,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								  <label class="form-check-label" for="flexRadioDefault1">
								    150,000 ~ 300,000 원
								  </label>
					  		</div>
					  	</div>					
					  </div>
					</div>
					
				</div>
			</div>
				
			<!-- 상품리스트 -->
			<div id="products" class="p-2" style="width:1000px;"> 
				   <div class="d-flex justify-content-between flex-wrap" style="width:1000px;" >
				        <!-- 카드 임시로 가져와보기 -->
				        
						
						<c:forEach var="productList" items="${pageList}">
			               <div class="card">
					           <div class="card-head">
								  <img class="card-img-top" src="../resources/images/반스_월버_노랑.jpg">
								</div>
								<div class="card-body">
								    <p class="card-brand m-0 text-muted small" >${productList.categoryName} > ${productList.productSex}</p>
								    <p class="card-brand m-0">${productList.companyName}</p>
								    <h5 class="card-title"><a href="ProductController?productId=${productList.productId}">${productList.productName}</a></h5>
								    <p class="card-text">
								    <span class="sale" style="color:red">${productList.productPrice}원</span>
								    </p>
								    <a href="#" class="btn btn-outline-info btn-sm"><img src="../resources/images/heart_empty.png" style="width:15px; height:15px;"> 찜하기</a>
								    <a href="ProductController?productId=${productList.productId}" class="btn btn-primary btn-sm">자세히보기</a>
								 </div>
							</div>
			            </c:forEach>
			            
				      <div id="pager" class="text-center" style="width:1000px">
				      		<div>
		                     <a href="MainController?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
		                     
		                     <c:if test="${pager.groupNo > 1}">
		                        <a href="MainController?pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm">이전</a>
		                     </c:if>
		                     
		                     <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		                        <c:if test="${pager.pageNo != i}">
		                           <a href="MainController?pageNo=${i}" class="btn btn-outline-success btn-sm">${i}</a>
		                        </c:if>
		                        <c:if test="${pager.pageNo == i}">
		                           <a href="MainController?pageNo=${i}" class="btn btn-info btn-sm">${i}</a>
		                        </c:if>
		                     </c:forEach>
		                     
		                     <c:if test="${pager.groupNo < pager.totalGroupNo}">
		                        <a href="MainController?pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">다음</a>
		                     </c:if>
		                     
		                     <a href="MainController?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">맨끝</a>
		                  </div>
				      </div>
				  </div>
			</div>

		
</body>
</html>