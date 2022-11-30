<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="../resources/css/shoescolors.css">
		<link rel="stylesheet" href="../resources/css/common.css">
		<link rel="stylesheet" href="../resources/css/productList.css">

		<style>
			* {
/*   				border: 1px solid black;   */
			}
		</style>
		<script>
			let state = 0;
			
			function changeimage(img) {
				if(state === 0) {
					img.src = "../resources/images/heart_empty.png";
					state = 1;
				} else {
					img.src = "../resources/images/heart.png";
					state = 0;
				}
			}
		</script>
	</head>
	<body>
		<div class="banner d-flex justify-content-between">
			<div class="p-2">
				<a href="home.html"><img src="../resources/images/sashoes_logo.png"
					style="width: 150px; margin-top: 20px;" /></a>
			</div>
	
			<div class="p-2">
				<div class="row">
					<input class="search col-10 search-txt" type="text"
						placeholder="검색어를 입력해 주세요">
					<button class="search_button col-2 btn-primary" type="submit">찾기</button>
				</div>
			</div>
	
			<div style="text-align: center; padding-top: 35px;">
				<a href="joinForm.html">회원가입</a>
			</div>
			<div style="text-align: center; padding-top: 35px;">
				<a href="mypage_main.html">마이페이지</a>
			</div>
			<div style="text-align: center; padding-top: 35px;">
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
								<form id="loginForm" name="loginForm" action="#"
									onsubmit="return handleCheckData()" novalidate>
									<div class="form-group">
										<label for="uid">ID</label> <input type="text"
											class="form-control" id="uid" name="uid" value="" /> <small
											id="uidHelp" class="form-text text-muted">알파벳 대소문자,
											숫자를 혼용해서 6자 이상 10장 이하를 입력해주세요</small>
									</div>
	
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											class="form-control" id="password" name="password" value="" />
										<small id="passwordHelp" class="form-text text-muted">알파벳
											대소문자, 숫자를 혼용해서 8자 이상 15장 이하를 입력해주세요</small>
									</div>
								</form>
							</div>
	
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn bg-warning" data-dismiss="modal">로그인</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="navbar" class="shadow-sm">
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2"
					data-toggle="dropdown">MEN</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">남성 운동화</a> <a
						class="dropdown-item" href="#">남성 스니커즈</a> <a class="dropdown-item"
						href="#">남성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2"
					data-toggle="dropdown">WOMEN</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">여성 운동화</a> <a
						class="dropdown-item" href="#">여성 스니커즈</a> <a class="dropdown-item"
						href="#">여성 샌들</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn dropdown-toggle m-2"
					data-toggle="dropdown">KIDS</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">아이 운동화</a> <a
						class="dropdown-item" href="#">아이 스니커즈</a> <a class="dropdown-item"
						href="#">아이 샌들</a>
				</div>
			</div>
		</div>
		<div class="reviewmain container-fluid">
			<div id="wrapper">
				<div class="row table-dark" style="height:100px; border: 1px solid black">
					<div class="my-auto col-6" style="font-size:30px">리뷰 번호 : 1</div>
					<div class="my-auto col-6" style="font-size:30px"><div style="text-align:right">작성자: 태희</div></div>
				</div>
				<div class="row" style="height:100px; border: 1px solid black">
					<div class="my-auto col-6" style="font-size:20px"> 리뷰 제목 : 좋아요 ~편하고 예뻐요! </div>
					<div class="my-auto col-6" style="font-size:20px"><div style="text-align:right"> 리뷰 날짜 : 2022-11-24 </div></div>
				</div>
				<div class="row" style="height:500px; border: 1px solid black">
					<div class="mt-2 mx-3 row" style="width:100%; font-size:20px">
						<div class="col-3">
							<img src="../resources/images/반스_월버_노랑.jpg" width="100%" height="300px"/>
							<div class="mt-2" style="text-align:center; border-bottom:1px solid black"> 브랜드 : 반스 </div>
							<div class="mt-2" style="text-align:center; border-bottom:1px solid black"> 상품명 : 월버 </div>
							<div class="mt-2" style="text-align:center; border-bottom:1px solid black"> 가격 : 9,9000 </div>
						</div>
						<div class="col-9">
							<div class="ml-3">
								리뷰 내용에 관한 부분입니다. <p>
								리뷰 이구요 <p>
							</div>
						</div>
					</div>
				</div>
				<div class="row table-dark" style="height:50px; border: 1px solid black">
					<div class="my-auto col-6" style="font-size:20px"> 평점 : ⭐⭐⭐⭐⭐ </div>
					<div class="my-auto col-6" style="font-size:20px"><div style="text-align:right"> 댓글 수 (3) </div></div>
				</div>
				<div class="row" style="height:50px; border-bottom:1px solid black">
					<ul class="nav nav-tabs">
						<li class="nav-item"><div style="height:50px">
							<a class="my-auto col-12" data-toggle="tab" href="#reviewanswer"><img src="../resources/images/word.png" class="p-1" style="height:100%"/></a>
							<button class="btn btn-dark" data-toggle="modal" data-target="#creative"> 작성 </button>
							<div class="modal fade" id="creative">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<!-- Modal Header -->
										<div class="modal-header">
											<h4> 댓글 달기 </h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										
										<!-- Modal body -->
										<div class="modal-body">
											<div>
												<label> 댓글 제목 </label>
												<input type="text"/>
											</div>
											<div>
												<label> 댓글 내용 </label>
												<div style="text-align:center">
													<textarea placeholder="댓글 내용을 입력해주세요." style="width:400px; height:500px"></textarea>
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
							<button class="btn btn-dark"> 삭제 </button>
						</div></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="mt-3 tab-pane container fade" id="reviewanswer" style="font-size:20px">
						<div class="container-fluid">
							<div class="row py-3" style="border-bottom:1px solid black">
								<div class="my-auto col-6" style="font-size:20px"> 아이디 : apple </div>
								<div class="my-auto col-5" style="font-size:20px"><div style="text-align:right"> 여기에 쓰는 리뷰가 맞나요 ^^ </div></div>
								<div class="my-auto col-1" style="font-size:20px; height:30px">
									<img onclick="changeimage(this)" src="../resources/images/heart.png" style="height:100%; cursor:pointer"/>
								</div>
							</div>
							<div class="row py-3" style="border-bottom:1px solid black">
								<div class="my-auto col-6" style="font-size:20px"> 아이디 : b </div>
								<div class="my-auto col-5" style="font-size:20px"><div style="text-align:right"> 안뇽하세요 </div></div>
								<div class="my-auto col-1" style="font-size:20px; height:30px">
									<img onclick="changeimage(this)" src="../resources/images/heart.png" style="height:100%; cursor:pointer"/>
								</div>
							</div>
							<div class="row py-3" style="border-bottom:1px solid black">
								<div class="my-auto col-6" style="font-size:20px"> 아이디 : c </div>
								<div class="my-auto col-5" style="font-size:20px"><div style="text-align:right"> 반가워요 </div></div>
								<div class="my-auto col-1" style="font-size:20px; height:30px">
									<img onclick="changeimage(this)" src="../resources/images/heart.png" style="height:100%; cursor:pointer"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>