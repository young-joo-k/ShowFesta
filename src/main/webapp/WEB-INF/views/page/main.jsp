<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/mainpage.css?after" rel="stylesheet">
<main id="main">
	<html>
<head>
<link href="/resources/css/swiper.css?after" rel="stylesheet">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<title>Home</title>
</head>
<body>
	<div id="cont_wrap" class="clear_g">
		<div class="wrap_main_slider">
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg
							class=img></a>
					</div>
				</div>

				<div class="swiper-pagination"></div>

				<div class="swiper-button-prev">
					<div class="btn_mslider_prev"></div>
				</div>
				<div class="swiper-button-next">
					<div class="btn_mslider_next"></div>
				</div>
			</div>
		</div>
		<script>
			new Swiper('.swiper', {
				autoplay : {
					delay : 5000
				},
				loop : true,
				slidesPerView : 3,
				spaceBetween : 10,
				centeredSlides : true,
				pagination : {
					el : '.swiper-pagination',
					clickable : true
				},
				navigation : {
					prevEl : '.swiper-button-prev',
					nextEl : '.swiper-button-next'
				}
			})
		</script>
	</div>
</body>
	</html>
</main>