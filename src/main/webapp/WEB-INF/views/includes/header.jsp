<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<link href="/resources/css/header.css?after" rel="stylesheet">
<link href="/resources/css/style.css?after" rel="stylesheet">
<link href="/resources/css/main.css?after" rel="stylesheet">
<link href="/resources/css/dropdown.css?after" rel="stylesheet">
<meta name="viewport" content="width=device-width,initial-scale=1">
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
					<li style="display: ${not empty user ? 'inline' : 'none'}"><a href="../join/logout"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
							alt="로그아웃"> <span style="display: ${not empty user ? 'inline' : 'none'}">로그아웃</span>
					</a></li>
					<li style="display: ${empty user ? 'inline' : 'none'}"><a href="../join/login"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
							alt="로그인"> <span style="display: ${empty user ? 'inline' : 'none'}">로그인</span>
					</a></li>
					<li style="display: ${empty user ? 'inline' : 'none'}"><a href="../join/register"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
							alt="회원가입"> <span style="display: ${empty user ? 'inline' : 'none'}">회원가입</span>
					</a></li>
					<li><a href="../join/mypage"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
							alt="MY PAGE"> <span >마이페이지</span>
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
							<li><a href="/page/mContents">뮤지컬</a></li>
							<li><a href="/page/concertContents">콘서트</a></li>
							<li><a href="/page/festivalContents">페스티벌</a></li>
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