<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/mainpage.css?after" rel="stylesheet">
<main id="main">
	<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<title>Home</title>
</head>
<body>
	<div id="cont_wrap" class="clear_g">
		<div class="wrap_main_slider">
			<div id="slider">
				<a href="#" class="prev"> <span
					class="btn_comm btn_mslider_prev">이전</span>
				</a>
				<div class="slider_inner">
					<ul class="list_slider" id="sliderInner"
						style="width: 2959px; left: -1076px;">
						<li class>
							<a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></a></li>
						<li class="on"><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class="on"><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class="on"><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
						<li class><a  href="/page/musical_info" ><img src= http://tkfile.yes24.com/upload2/PerfBlog/202308/20230801/20230801-46725.jpg class></a></li>
					</ul>
				</div>
				<a href="#" class="next"> <span
					class="btn_comm btn_mslider_next">다음</span>
				</a>
			</div>
		</div>
		<script>
		<script>
	    $(document).ready(function () {
	        var currentSlide = 0;
	        var slides = $(".list_slider li");

	        // 이전 슬라이드로 이동
	        $(".prev").click(function () {
	            slides.eq(currentSlide).fadeOut();
	            currentSlide = (currentSlide - 1 + slides.length) % slides.length;
	            slides.eq(currentSlide).fadeIn();
	        });

	        // 다음 슬라이드로 이동
	        $(".next").click(function () {
	            slides.eq(currentSlide).fadeOut();
	            currentSlide = (currentSlide + 1) % slides.length;
	            slides.eq(currentSlide).fadeIn();
	        });
	    });
	</script>
	</div>
</body>
	</html>
</main>