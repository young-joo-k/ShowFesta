<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>

<title>ShowFesta</title>


<link href="/resources/assets/css/cal.css?after" rel="stylesheet"
	type="text/css">
<meta content="" name="description">
<meta content="" name="keywords">
<meta charset="utf-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<link rel="stylesheet" href = "//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href = "/resources/news/ShowFesta/Contents/Css/sub.css">
<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet"> 
<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
 
<!-- Template Main CSS Files -->
<link href="/resources/assets/css/variables.css" rel="stylesheet">
<link href="/resources/assets/css/main.css?after" rel="stylesheet">

<link href="/resources/news/ShowFesta/Contents/Css/style.css?after"
	rel="stylesheet">
</head>

<body>
	<section onclick="toggleNavi('close');">
		<div class="container tdn_container">
			<div class="tdn_left" id="tdn_left_temp" style="displat: none;">
				<p style="width: 160px; height: 10px; color: #fff; backgrond: #fff"></p>
			</div>
			<article class="content">
				<p class="location">
				<h3>NEWS</h3>
				<!--  좌측 컨텐츠 영역 -->
				<section class="con-4-6 t-6-6">
					<div class="img_thum_col">
						<ul class="sub_list">
							<li>
								<p class="img_thum con 2-6 m-6-6">
									<a href="/News?detail?num=13824"> <img class="thum_line"
										id="thum_line_id"
										src="//image.yes24.com/themusical/fileStorage/ThemusicalAdmin/News/Image/2023082831709579bd6244c2b3babb59df268052290f0b20.jpg"
										alt>
									</a>
									<div class="con-4-6 m-6-6">
									<p class="img_thum_tit">
										<a href="/News/Detail?num=13824">연극 <기형도 플레이> 10월 개막</a>
										<br> <br> <span class="xi-clock"> ::before
											"2023-08-28"" </span> <span class="xi-user"> ::before " 686"
										</span>
									</p>
									<p class="img_thum_txt">
										<span> "&nbsp; &nbsp; 연극 <기형도 플레이>는 한예종 출신 작가들로
											구성된 '창작집단 독' 작가 9명이 기형도의 시 9편에서 영감을 받아 쓴 단편 희곡들로 구성된 작품이다." </span>
									</p>
								</div>
								</p>
							</li>
						</ul>
					</div>
					<div class="pager">
						<ul style="">
							<li><a href="/News/List?page=1#" class><<</a></li>
							<li><a href="/News/List?page=1#" class><</a></li>
							<li><a href="/News/List?page=1#" class="select">1</a></li>
							<li><a href="/News/List?page=2#" class>2</a></li>
							<li><a href="/News/List?page=3#" class>3</a></li>
							<li><a href="/News/List?page=4#" class>4</a></li>
							<li><a href="/News/List?page=5#" class>5</a></li>
							<li><a href="/News/List?page=6#" class>6</a></li>
							<li><a href="/News/List?page=7#" class>7</a></li>
							<li><a href="/News/List?page=8#" class>8</a></li>
							<li><a href="/News/List?page=9#" class>9</a></li>
							<li><a href="/News/List?page=1#" class>></a></li>
							<li><a href="/News/List?page=1#" class>>></a></li>
						</ul>
					</div>
				</section>
				<!--  좌측 컨텐츠 영역 END -->							
			</article>
		</div>
	</section>
</body>

</html>
<%@include file="../includes/footer.jsp"%>