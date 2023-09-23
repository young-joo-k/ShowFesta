<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=ADLaM+Display&family=Arvo:wght@700&family=Black+Han+Sans&family=Concert+One&family=EB+Garamond:wght@800&family=Fugaz+One&family=Gloock&family=Josefin+Sans:wght@700&family=Jua&family=Kanit:wght@500&family=Lilita+One&family=Noto+Sans+KR:wght@500&family=Paytone+One&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=ADLaM+Display&family=Arvo:wght@700&family=Black+Han+Sans&family=Concert+One&family=EB+Garamond:wght@800&family=Fugaz+One&family=Josefin+Sans:wght@700&family=Jua&family=Kanit:wght@500&family=Lilita+One&family=Paytone+One&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link href="/resources/css/N_musicalheader.css?after" rel="stylesheet">

<link href="/resources/css/N_musiaclheader.css?after" rel="stylesheet">
<link href="/resources/css/style.css?after" rel="stylesheet">
<link href="/resources/css/N_main.css?after" rel="stylesheet">
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Fjalla+One&family=Gamja+Flower&family=IBM+Plex+Sans+KR&family=Noto+Sans+KR:wght@500;600;700&display=swap"
	rel="stylesheet">
</head>
<!-- ======= Header ======= -->
<body>
	<div class="header">
		<div class="smalllogo" onclick="location.href='/'" class="showfesta">
			ShowFesta
			<ul class="memberInfo_wrap">
				<li id="first-member"
					style="display: ${not empty user ? 'inline' : 'none'}"><a
					href="../join/logout"> <span
						style="display: ${not empty user ? 'inline' : 'none'}">로그아웃</span>
				</a></li>
				<li id="second-member"
					style="display: ${empty user ? 'inline' : 'none'}"><a
					href="../join/login"> <span
						style="display: ${empty user ? 'inline' : 'none'}">로그인</span>
				</a></li>
				<li style="display: ${empty user ? 'inline' : 'none'}"><a
					href="../join/register"> <span
						style="display: ${empty user ? 'inline' : 'none'}">회원가입</span>
				</a></li>
				<li><a href="../page/myPage"> <span>마이페이지</span>
				</a></li>
			</ul>
		</div>
		<div class="header_content">

			<div class="contents">

				<h1>
					<a>Festival</a>

				</h1>



			</div>
		</div>
		<div class="nav">
			<div class="contents">
				<div class="totalSearch_wrap">
					<label for="totalSearch"> <input type="text"
						id="header_keyword" placeholder="검색어를 입력해 주세요"> <input
						type="hidden" id="header_ad_keyword" name="header_ad_keyword">
					</label>
					<button type="button" class="btn_totalSearch"
						id="btn_header_search" onclick="search()">검색</button>
				</div>
				<div>
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
							<ul class="category" style="display: none;">
								<li><a href="/page/mContents">뮤지컬</a></li>
								<li><a href="/page/concertContents">콘서트</a></li>
								<li><a href="/page/festaContents">페스티벌</a></li>
							</ul>
						</li>
						<li id="calendarCss">
							<h2>
								<a href="/page/calendar">캘린더</a>
							</h2>
						</li>
						<li id="qnaCss">
							<h2>
								<a href="/page/notice_list">고객센터</a>
							</h2>
						</li>
					</ul>
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
		$('.dropdown').hover(function() {
			// 호버 시 드롭다운 메뉴를 보이게 하기
			$(this).find('ul').slideDown('400');
		}, function() {
			// 호버가 해제될 때 드롭다운 메뉴를 숨기기
			$(this).find('ul').slideUp('400');
		});
		$('.dropdown ul').hide();
	});
</script>


<script>
	// 페이지가 준비되면 실행할 코드
	$(document).ready(
			function() {
				// 검색 버튼 클릭 이벤트를 처리합니다.
				$("#btn_header_search").click(
						function() {
							// 검색어를 가져옵니다.
							var keyword = $("#header_keyword").val();

							// 검색어가 비어있지 않은 경우에만 검색 결과 페이지로 이동합니다.
							if (keyword.trim() !== "") {
								// 검색 결과 페이지 URL을 구성합니다.
								var searchResultUrl = "/page/search?keyword="
										+ encodeURIComponent(keyword);

								// 검색 결과 페이지로 리디렉션합니다.
								window.location.href = searchResultUrl;
							} else {
								// 검색어가 비어있는 경우 경고 메시지를 표시하거나 아무 작업도 수행하지 않습니다.
								alert("검색어를 입력하세요.");
							}
						});
				var urlParams = new URLSearchParams(window.location.search);
				var 검색어 = urlParams.get("keyword");
				if (검색어) {
					$("#header_keyword").val(검색어);
				}

			});
	$(document).ready(function() {
		// Enter 키가 눌렸을 때 검색 실행
		$('#header_keyword').on('keyup', function(event) {
			if (event.key === 'Enter') {
				search();
			}
		});

		// 검색 버튼을 클릭할 때 검색 실행
		$('#btn_header_search').on('click', function() {
			search();
		});

		// 검색을 실행하는 함수
		function search() {
			var searchTerm = $('#header_keyword').val();
			// 검색어(searchTerm)를 사용하여 검색 로직을 실행하거나 다른 작업을 수행합니다.
			// 여기서는 단순히 예시로 검색어를 콘솔에 출력합니다.
			window.location.href = 'search?keyword=' + searchTerm;
		}
	});
</script>
</html>