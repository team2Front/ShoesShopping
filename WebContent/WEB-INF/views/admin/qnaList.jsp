<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>qnaList</title>
		<script src="../resources/javascript/review_qna.js"></script>
	</head>
	<body>
		<div style="float:right">
			<button class="btn btn-lg btn-dark m-3" data-toggle="modal" data-target="#qna_creative"> Q & A 작성 </button>
			<div class="modal fade" id="qna_creative">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4> Q & A </h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- Modal body -->
						<div class="modal-body">
							<div>
								<label> Q & A 제목 </label>
								<input type="text"/>
							</div>
							<div>
								<label> Q & A 내용 </label>
								<div style="text-align:center">
									<textarea placeholder="Q & A 내용을 입력해주세요." style="width:400px; height:300px"></textarea>
								</div>
							</div>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn bg-warning" data-dismiss="modal">작성</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="mainDiv" class="content">
		   <div id="review-list">
		      <div id="review-list-header">
		      
		      </div>
		      <table class="table table-hover" id="qnaList">
		         <thead class="table-dark">
		         <tr>
		            <th scope="col">NO</th>
		            <th scope="col" style="width:330px">문의자 정보</th>
		            <th scope="col" colspan="3">문의 제목</th>
		            <th></th>
		         <tr>
		         </thead>
		         <tbody class="table-group-divider">
		         <tr>
		            <th scope="row">1</th>
		            <td>
		               <div class="n-row">
		                  <ul class="info">
		                     <li class="order-id">태희</li>
		                     <li class="option">2022-11-23</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
			            <ul id="review-detail">
							<li class="order-name"> 질문 </li>
						</ul>
		               </div>
		               <div class="qnaDetail" style="display:none; text-align: left;" class=" n-row">
		                  <div class="p-3" style="width:100%; height:100px; ">
		                  		<p>1 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
		                  		<p>2 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
		                  </div>
		                  <table class="table">
	                  	  	  <thead style="background-color: #f0f0f0; border-top: 3px solid #000;">
							    <tr>
							      <th class="col-10">답글 수: 2개</th>
							      <th class="col-2"></th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr style="border-top: 4px solid #000;">
							      <th>안녕하세요 태희님, 해당 사이즈 재입고 날짜가 미정입니다. 죄송합니다</th>
							      <td>관리자</td>
							    </tr>
							    <tr>
							      <th>답변 감사합니다 !!</th>
							      <td>태희</td>
							    </tr>
							    <tr>
							      <th>네 고객님 좋은하루 되세요</th>
							      <td>관리자</td>
							    </tr>
				   
			  				 </tbody>
		  				 </table>
		               </div>
		            </td>
		            <td style="text-align:center;">
						<div>
							답변 완료
						</div>
		            </td>
		         </tr>
		         <!-- 주문 2 -->
		         <tr>
		         <th scope="row">2</th>
		            <td>
		               <div class="n-row">
		                  <ul class="info">
		                     <li class="order-id">희률</li>
		                     <li class="option">2022-11-21</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
				        <ul id="review-detail">
							<li class="order-name"> 구매할 때 어떤 방식으로 신청해야 </li>
						</ul>
		               </div>
		               <div class="qnaDetail" style="display:none;" class=" n-row">
		                  <div class="p-3" style="width:100%; height:100px; ">
		                  		<p>3 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
		                  		<p>4 해당 상품 220 사이즈가 품절인데 재입고 예정일을 알 수 있을까요?</p>
		                  </div>
		                  <table class="table">
	                  	  	  <thead style="background-color: #f0f0f0; border-top: 3px solid #000;">
							    <tr>
							      <th class="col-10">답글 수: 2개</th>
							      <th class="col-2"></th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr style="border-top: 4px solid #000;">
							      <th>안녕하세요 희률님, 해당 사이즈 재입고 날짜가 미정입니다. 죄송합니다</th>
							      <td>관리자</td>
							    </tr>
							    <tr>
							      <th>답변 감사합니다 !!</th>
							      <td>희률</td>
							    </tr>
							    <tr>
							      <th>네 고객님 좋은하루 되세요</th>
							      <td>관리자</td>
							    </tr>
				   
			  				 </tbody>
		  				 </table>
		               </div>
		            </td>
		            <td style="text-align:center;">
						<div>
							답변 완료
						</div>
		            </td>
		         </tr>
		         
		         <!-- 주문3 -->
		         <tr>
		         <th scope="row">3</th>
		            <td>
		               <div class="n-row">
		                  <ul class="info">
		                     <li class="order-id">정은</li>
		                     <li class="option">2022-11-20</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
		                  <ul id="review-detail">
		                     <li class="order-name"> 궁금한게 있습니다. </li>
		                  </ul>
		               </div>
		            </td>
		            <td style="text-align:center;">
						<div>
							미답변
						</div>
		            </td>
		         </tr>
		         
		         <!-- 주문4 -->
		         <tr>
		         <th scope="row">4</th>
		            <td>
		               <div class="n-row">
		                  <ul class="info">
		                     <li class="order-id">송민</li>
		                     <li class="option">2022-11-19</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
		               	<ul id="review-detail">
							<li class="order-name"> 문의할게 있습니다. </li>
						</ul>
		               </div>
		            </td>
		            <td style="text-align:center;">
						<div>
							미답변
						</div>
		            </td>
		         </tr>
		         
		         </tbody>
		         
		      </table>
		   </div>
		</div>		
	</body>
</html>