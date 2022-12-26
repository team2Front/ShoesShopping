<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
<style>
.carousel-control-prev-icon {
 background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
}

.carousel-control-next-icon {
  background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
}
</style>
</head>
<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>

</div>

<!-- Carousel 부분 -->
<div id="img" class="carousel carousel-dark slide" data-ride="carousel">
  <ol class="carousel-indicators">
  	<li type="button" data-bs-target="#item1" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></li>
    <li type="button" data-bs-target="#item2" data-bs-slide-to="1" aria-label="Slide 2"></li>
    <li type="button" data-bs-target="#item3" data-bs-slide-to="2" aria-label="Slide 3"></li>
    <li type="button" data-bs-target="#item4" data-bs-slide-to="3" aria-label="Slide 4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" >
      <img id="item1" src="/Project2_Images/carousel/pro_no1.jpg" class="d-block w-75 mx-auto" alt="..." >
    </div>
    <div class="carousel-item">
      <img id="item2" src="/Project2_Images/carousel/pro_no3.jpg" class="d-block w-75 mx-auto" alt="..."  >
    </div>
    <div class="carousel-item">
      <img id="item3" src="/Project2_Images/carousel/pro_no4.jpg" class="d-block w-75 mx-auto" alt="..."  >
    </div>
    <div class="carousel-item">
      <img id="item4" src="/Project2_Images/carousel/pro_no5.jpg" class="d-block w-75 mx-auto" alt="..."  >
    </div>
  </div>
  <button class="carousel-control-prev " type="button" data-target="#img" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#img" data-slide="next" >
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>



		<div class="shoesmain d-flex" >
		<!-- 사이드 바  -->
			<div class="col-md-2"> 
				<form id="sidebar" method="get" action="${pageContext.request.contextPath}/main/MainFilterController" class="mt-2">		
					 <div class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					   Color
					 </div>
					<div class="collapse mb-2 form-group" id="collapseExample">
					  <div class="card card-body shoesColors">
						  <div class = "row">
						  	<div class="col-2 m-1 color-box"><input type="radio" class="red" value="1" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="orange" value="2" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="yellow" value="3" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="green" value="4" name="fcolor"></div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="col-2 m-1 color-box"><input type="radio" class="blue" value="5" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="brown" value="11" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="navy" value="6" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="purple" value="7" name="fcolor"></div>
				  		</div>
				  		
				  		<div class = "row">
						  	<div class="col-2 m-1 color-box"><input type="radio" class="pink" value="8" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="lime" value="13" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="black" value="10" name="fcolor"></div>
						  	<div class="col-2 m-1 color-box"><input type="radio" class="gray" value="12" name="fcolor"></div>
				  		</div>
					  </div>
					</div>
					
					<button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
					   Size
					 </button>
					<div class="collapse mb-2" id="collapseExample2">
					  <div class="card card-body">
					  	<div class="shoesSize">
						  <div class = "row justify-content-around">
						  	 	<input type="radio" class="btn-check" id="220"  value="220" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="220"><span>220</span></label>
						  		<input type="radio" class="btn-check" id="225"  value="225" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="225"><span>225</span></label>
							   	<input type="radio" class="btn-check" id="230"  value="230" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="230"><span>230</span></label>
						  		
						  		<input type="radio" class="btn-check" id="235"  value="235" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="235"><span>235</span></label>
						  		<input type="radio" class="btn-check" id="240"  value="240" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="240"><span>240</span></label>
						  		<input type="radio" class="btn-check" id="245"  value="245" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="245"><span>245</span></label>
						  		
						  		<input type="radio" class="btn-check" id="250"  value="250" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="250"><span>250</span></label>
						  		<input type="radio" class="btn-check" id="255"  value="255" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="255"><span>255</span></label>
						  		<input type="radio" class="btn-check" id="260"  value="260" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="260"><span>260</span></label>
						  		
						  		<input type="radio" class="btn-check" id="265"  value="265" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="265"><span>265</span></label>
						  		<input type="radio" class="btn-check" id="270"  value="270" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="270"><span>270</span></label>
						  		<input type="radio" class="btn-check" id="280"  value="280" name="fsize" >
						  		<label class="btn btn-outline-dark m-1" for="280"><span>280</span></label>
					  		</div>
					  	</div>
					  </div>
					</div>
					
					<button class="btn sidebar-button" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3">
					   Price
					 </button>
					<div class="collapse mb-2" id="collapseExample3">
					  <div class="card card-body">
					  	<div class = "shoesPrice container-fluid">
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="fprice" value="fprice1">
								  <label class="form-check-label" for="fprice1">
								    0 ~ 50,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="fprice" value="fprice2">
								  <label class="form-check-label" for="fprice2">
								    50,000 ~ 80,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="fprice" value="fprice3">
								  <label class="form-check-label" for="fprice3">
								    80,000 ~ 100,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="fprice" value="fprice4">
								  <label class="form-check-label" for="fprice4">
								    100,000 ~ 150,000 원
								  </label>
					  		</div>
					  		
					  		<div class="row pl-4">
					  			<input class="form-check-input" type="radio" name="fprice" value="fprice5">
								  <label class="form-check-label" for="fprice5">
								    150,000 ~ 300,000 원
								  </label>
					  		</div>
					  	</div>					
					  </div>
					</div>
					
					<!-- request 버튼 -->
					<div class="text-center">
						<input type="submit" class="btn btn-dark btn-sm" value="검색" /> 
					</div>
				</form>
			</div>
				
			<!-- 상품리스트 -->
			<div id="products" class="p-2" style="width:1100px;"> 
				   <div class="d-flex flex-wrap" style="width:1100px;" >
				        <!-- 상품 리스트 카드 여러개 가져오기 -->
						<c:forEach var="productList" items="${pageList}">
			               <div class="card m-1">
					           <div class="card-head">
										<img class="card-img-top" src="${pageContext.request.contextPath}/main/MainImageController?productId=${productList.productId}"/>
						           		<%-- <img class="card-img-top" src="C:/OTI/Project2_Images/${productList.companyName}/${productList.productId}/${productList.fileName}"/> --%>
								</div>
								<div class="card-body container-fluid">
								    <div class="row card-brand m-0">
								    	<div class="text-muted small">
								    		${productList.categoryName} > ${productList.productSex}
								    	</div>
								    	<c:if test="${loginType == 'ADMIN'}">
									    	<div style="margin-left:90px">
									    		<a class="btn btn-dark btn-sm" href="${pageContext.request.contextPath}/admin/ProductDeleteController?productId=${productList.productId}">삭제</a>
									    	</div>
								    	</c:if>
								    </div>
								    <p class="card-brand m-0"> ${productList.companyName}</p>
								    <h5 class="card-title"><a href="../product/ProductController?productId=${productList.productId}">${productList.productName}</a></h5>
								    <p class="card-text">
								    <span class="sale" style="color:red">${productList.productPrice}원</span>
								    </p>
								    <div class="text-center">
									    <a href="#" class="btn btn-outline-info mr-1"><img src="${pageContext.request.contextPath}/resources/images/heart_empty.png" style="width:15px; height:15px;"> 찜하기</a>
									    <a href="../product/ProductController?productId=${productList.productId}" class="btn btn-primary">자세히보기</a>
								    </div>
								    
								 </div>
							</div>
			            </c:forEach>
			            
				      <div id="pager" class="text-center" style="width:1100px">
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
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	