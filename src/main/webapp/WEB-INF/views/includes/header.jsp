<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<link href="/resources/css/header.css?after" rel="stylesheet">
<link href="/resources/css/style.css?after" rel="stylesheet">
<link href="/resources/css/main.css?after" rel="stylesheet">
<link href="/resources/css/dropdown.css?after" rel="stylesheet">

<head>
<title>ShowFesta</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
</head>
<!-- ======= Header ======= -->
<body>
	<div class="header">
		<div class="header_content">
			<div class="contents">
				<h1 onclick>
					<a href="/"> ShowFesta </a>
				</h1>
				<ul class="memberInfo_wrap">
					<li><a href="../join/login"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
							alt="로그인"> <span>로그인</span>
					</a></li>
					<li><a href="../join/register"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
							alt="회원가입"> <span>회원가입</span>
					</a></li>
					<li><a href="../join/mypage"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
							alt="MY PAGE"> <span>마이페이지</span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="nav">
			<div class="contents">
				<ul class="nav_menu">
					<li>
						<h2>
							<a href="/">홈</a>
						</h2>
					</li>
					<li class="dropdown">
						<h2>
							<a href="#">카테고리</a>
						</h2>
						<ul class="category">
							<li><a href="#">뮤지컬</a></li>
							<li><a href="#">콘서트</a></li>
							<li><a href="#">페스티벌</a></li>
							<li><a href="#">지역축제</a></li>
						</ul>
					</li>
					<li>
						<h2>
							<a href="/page/calendar">캘린더</a>
						</h2>
					</li>
					<li>
						<h2>
							<a href="/page/notice_list">고객센터</a>
						</h2>
					</li>
				</ul>
				<div class="totalSearch_wrap">
					<label for="totalSearch">
						<input type="text" id="header_keyword" value>
						<input type="hidden" id="header_ad_keyword" name="header_ad_keyword">
					</label>
					<button type="button" class="btn_totalSearch" id="btn_header_search">검색</button>
				</div>
			</div>
		</div>
	</div>

	<%-- <header id="header" class="header align-items-center">
		<div
			class="header_content">
			<a href="/page/main" class="logo"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<h1>ShowFesta</h1>
			</a>
			<div class="position-relative">
				<!--       el이랑 jstl로 조건문 만들어 보기 -->
				<a href="#" class="mx-2" id="myPage"
					style="display: ${empty user ? 'inline' : 'none'}"><span
					class="bi-person-fill"></span></a> <a href="../join/login" class="mx-2"
					id="logIn" style="display: ${empty user ? 'inline' : 'none'}">로그인</a>
				<a href="../join/register" class="mx-2" id="register"
					style="display: ${empty user ? 'inline' : 'none'}">회원가입</a> </a> <a
					href="../join/logout" class="mx-2" id="logoutLink"
					style="display: ${not empty user ? 'inline' : 'none'}">로그아웃</a>

				<!-- JavaScript -->
				<a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
				<i class="bi bi-list mobile-nav-toggle"></i>

				<!-- ======= Search Form ======= -->
				<div class="search-form-wrap js-search-form-wrap">
					<form action="search-result.html" class="search-form">
						<span class="icon bi-search"></span> <input type="text"
							placeholder="Search" class="form-control">
						<button class="btn js-search-close">
							<span class="bi-x"></span>
						</button>
					</form>
				</div>
				<!-- End Search Form -->
			</div>

		</div>
					<!-- .navbar -->
		<nav id="navbar" class="navbar">
			<ul>
				<li><a href="/page/main">홈</a></li>
				<li><a href="/page/news">뉴스</a></li>
				<li class="dropdown">
				<a href="category.html"><span>카테고리</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul class="category">
												<li><a href="#">뮤지컬</a></li>
						<li><a href="#">콘서트</a></li>
						<li><a href="#">페스티벌</a></li>
						<li><a href="#">지역축제</a></li>

					</ul></li>

				<li><a href="/page/calendar">캘린더</a></li>
				<li><a href="/page/notice_list">고객센터</a></li>
			</ul>
		</nav>
	</header> --%>
	<!-- End Header -->
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 카테고리 메뉴에 호버 이벤트 핸들러 추가
    $('.dropdown').hover(
        function() {
            // 호버 시 드롭다운 메뉴를 보이게 하기
            $(this).find('ul').slideDown('fast');
        },
        function() {
            // 호버가 해제될 때 드롭다운 메뉴를 숨기기
            $(this).find('ul').slideUp('fast');
        }
    );
    $('.dropdown ul').hide();
});
</script>
</html>