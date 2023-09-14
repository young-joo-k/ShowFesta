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
							src=http://tkfile.yes24.com/upload2/PerfBlog/202307/20230703/20230703-46234.jpg
							class=img></a>
					</div>
					<div class="swiper-slide"><a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230804/20230804-46305.jpg
							class=img></a></div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=https://ticketimage.interpark.com/Play/image/large/L0/L0000049_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230830/20230830-46927.jpg
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href="/page/musical_info"><img
							src=https://ticketimage.interpark.com/Play/image/large/23/23008837_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href="/page/musical_info"><img
							src=https://ticketimage.interpark.com/Play/image/large/23/23012526_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202309/20230904/20230904-47067.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=https://ticketimage.interpark.com/Play/image/large/23/23011055_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202309/20230912/20230912-47041.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202309/20230907/20230907-47116.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="/page/musical_info"><img
							src=https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_7c1728ce-e80a-4c10-809d-6212a0e38bff_3.jpg
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