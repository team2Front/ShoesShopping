<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
</head>
<%@ include file="/WEB-INF/views/fragment/nav.jsp" %>

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
				   <div class="d-flex flex-wrap" style="width:1000px;" >
				        <!-- 카드 임시로 가져와보기 -->
				        
						
						<c:forEach var="productList" items="${pageList}">
			               <div class="card m-1">
					           <div class="card-head">
						           		<img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/${productList.fileName}"/>
								</div>
								<div class="card-body container-fluid">
								    <div class="row card-brand m-0">
								    	<div class="text-muted small">
								    		${productList.categoryName} > ${productList.productSex}
								    	</div>
								    	<c:if test="${loginType == 'ADMIN'}">
									    	<div style="margin-left:70px">
									    		<a class="btn btn-dark btn-sm" href="${pageContext.request.contextPath}/admin/ProductDeleteController?productId=${productList.productId}">삭제</a>
									    	</div>
								    	</c:if>
								    </div>
								    <p class="card-brand m-0">${productList.companyName}</p>
								    <h5 class="card-title"><a href="../product/ProductController?productId=${productList.productId}">${productList.productName}</a></h5>
								    <p class="card-text">
								    <span class="sale" style="color:red">${productList.productPrice}원</span>
								    </p>
								    <a href="#" class="btn btn-outline-info btn-sm"><img src="${pageContext.request.contextPath}/resources/images/heart_empty.png" style="width:15px; height:15px;"> 찜하기</a>
								    <a href="../product/ProductController?productId=${productList.productId}" class="btn btn-primary btn-sm">자세히보기</a>
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
<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>	