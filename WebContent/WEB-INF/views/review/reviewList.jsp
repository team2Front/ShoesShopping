<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reviewList</title>
	</head>
	<body>
		<div id="mainDiv" class="content">
		   <div id="review-list">
		      <div id="review-list-header">
		      
		      </div>
		      <table class="table table-hover">
		         <thead class="table-dark">
		         <tr>
		            <th scope="col">NO</th>
		            <th scope="col" style="width:330px">상품 정보</th>
		            <th scope="col" colspan="3">작성내용</th>
		            <th></th>
		         <tr>
		         </thead>
		         <tbody class="table-group-divider">
		         <tr onclick="location.href='reviewboarddetail.html'">
		            <th scope="row">1</th>
		            <td>
		               <div class="n-row">
		                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
		                  <ul class="info" style="margin:auto 0px">
		                     <li class="option">옵션: 노랑</li>
		                     <li class="option">사이즈: 240</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
		                  <ul id="review-detail" style="margin:auto 0px">
		                     <li class="order-name">작성자 이름 : 희률 </li>
		                     <li class="review-stars">⭐⭐⭐⭐⭐</li>
		                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
		                     <li class="review-comment">
		                     </li>
		                  </ul>
		               </div>
		            </td>
		            <td style="text-align:center;">
		            	<div id="buttons" class="d-flex flex-column">
		            		<ul style="margin:auto 0px"> 
		            			<li>댓글 수 : 0개</li>
		            			<li>종아요 수 : 0개</li>
		            		</ul>
		            	</div>
		            </td>
		         </tr>
		         <!-- 주문 2 -->
		         <tr>
		            <th scope="row">2</th>
		            <td>
		               <div class="n-row">
		                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
		                  <ul class="info" style="margin:auto 0px">
		                     <li class="option">옵션: 노랑</li>
		                     <li class="option">사이즈: 255</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
		                  <ul id="review-detail" style="margin:auto 0px">
		                     <li class="order-name">작성자 이름 : 태희 </li>
		                     <li class="review-stars">⭐⭐⭐⭐</li>
		                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
		                     <li class="review-comment">
		                     </li>
		                  </ul>
		               </div>
		            </td>
		            <td style="text-align:center;">
		            	<div id="buttons" class="d-flex flex-column">
		            		<ul style="margin:auto 0px"> 
		            			<li>댓글 수 : 0개</li>
		            			<li>종아요 수 : 0개</li>
		            		</ul>
		            	</div>
		            </td>
		         </tr>
		         
		         <!-- 주문3 -->
		         <tr>
		            <th scope="row">3</th>
		            <td>
		               <div class="n-row">
		                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
		                  <ul class="info" style="margin:auto 0px">
		                     <li class="option">옵션: 노랑</li>
		                     <li class="option">사이즈: 260</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
		                  <ul id="review-detail" style="margin:auto 0px">
		                     <li class="order-name">작성자 이름 : 정은 </li>
		                     <li class="review-stars">⭐⭐⭐⭐⭐</li>
		                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
		                     <li class="review-comment">
		                     </li>
		                  </ul>
		               </div>
		            </td>
		            <td style="text-align:center;">
		            	<div id="buttons" class="d-flex flex-column">
		            		<ul style="margin:auto 0px"> 
		            			<li>댓글 수 : 0개</li>
		            			<li>종아요 수 : 0개</li>
		            		</ul>
		            	</div>
		            </td>
		         </tr>
		         
		         <!-- 주문4 -->
		         <tr>
		            <th scope="row">4</th>
		            <td>
		               <div class="n-row">
		                  <a href="#" class="image-block"><img class="shoes-images-review" src="../images/반스_월버_노랑.jpg"/></a>
		                  <ul class="info" style="margin:auto 0px">
		                     <li class="option">옵션: 노랑</li>
		                     <li class="option">사이즈: 235</li>
		                  </ul>
		               </div>
		            </td>
		            <td colspan="3">
		               <div id="review-info">
		                  <ul id="review-detail" style="margin:auto 0px">
		                     <li class="order-name">작성자 이름 : 송민 </li>
		                     <li class="review-stars">⭐⭐⭐⭐⭐</li>
		                     <li class="review-contents">좋아요~~~편하고 예뻐요!</li>
		                     <li class="review-comment">
		                     </li>
		                  </ul>
		               </div>
		            </td>
		            <td style="text-align:center;">
		            	<div id="buttons" class="d-flex flex-column">
		            		<ul style="margin:auto 0px"> 
		            			<li>댓글 수 : 0개</li>
		            			<li>종아요 수 : 0개</li>
		            		</ul>
		            	</div>
		            </td>
		         </tr>
		         
		         </tbody>
		         
		      </table>
		   </div>
		</div>		
	</body>
</html>