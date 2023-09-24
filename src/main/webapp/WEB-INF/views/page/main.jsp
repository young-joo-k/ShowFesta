<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<main id="home-main">
	<html>
<head>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/N_mainpage.css?after" rel="stylesheet">
<link href="/resources/css/N_swiper.css?after" rel="stylesheet">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<title>Home</title>
</head>
<body>
	<div id="cont_wrap" class="clear_g">
		<div class="wrap_main_slider">
			<div class="swiper" style="width: 2959px; left: -1076px;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/concert_info?m_num=243><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202307/20230703/20230703-46234.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/musical_info?m_num=%20147><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230804/20230804-46305.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/musical_info?m_num=%20248><img
							src=https://ticketimage.interpark.com/Play/image/large/L0/L0000049_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href="http://localhost:8080/page/concert_info?m_num=171"><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230830/20230830-46927.jpg
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href=http://localhost:8080/page/musical_info?m_num=%20243><img
							src=https://ticketimage.interpark.com/Play/image/large/23/23008837_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href=http://localhost:8080/page/musical_info?m_num=%20242><img
							src=https://ticketimage.interpark.com/Play/image/large/23/23012526_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide-on">
						<a href=http://localhost:8080/page/musical_info?m_num=%20163><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202309/20230904/20230904-47067.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/concert_info?m_num=165><img
							src=https://ticketimage.interpark.com/Play/image/large/23/23011055_p.gif
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/concert_info?m_num=178><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202309/20230912/20230912-47041.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/musical_info?m_num=%20155><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202309/20230907/20230907-47116.jpg
							class=img></a>
					</div>
					<div class="swiper-slide">
						<a href=http://localhost:8080/page/concert_info?m_num=141><img
							src=http://tkfile.yes24.com/upload2/PerfBlog/202308/20230822/20230822-46790.jpg
							class=img></a>
					</div>
<!-- 					<div class="swiper-slide"> -->
<!-- 						<a href="/page/festaContents"><img -->
<!-- 							src=https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_7c1728ce-e80a-4c10-809d-6212a0e38bff_3.jpg -->
<!-- 							class=img></a> -->
<!-- 					</div> -->
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
	</div>
	<div class>
		<div data-v-223ac3f7 class="middle-section">
			<div data-v-223ac3f7 id="mitisection_index_1"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">뮤지컬</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
							<c:forEach var="content" items="${musicalContents}"
								varStatus="loop">
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/musical_info?m_num= <c:out value = "${content.m_num}"/>'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src=<c:out value = "${content.m_img}"/> class="thumb-img">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<a data-v-223ac3f7 href="/page/mContents" class="btn-more all">더보기</a>
				</div>
			</div>
			<div data-v-223ac3f7 id="mitisection_index_2"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">콘서트</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
							<c:forEach var="content" items="${concertContents}">
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/concert_info?m_num=<c:out value = "${content.m_num}"/>'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src=<c:out value = "${content.m_img}"/> class="thumb-img">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<a data-v-223ac3f7 href="/page/concertContents" class="btn-more all">더보기</a>
				</div>
			</div>
			<div data-v-223ac3f7 id="mitisection_index_3"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">페스티벌</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/festaContents'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src="/resources/img/festival/세계화상비즈니스위크.jpg">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/festaContents'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src="/resources/img/festival/글로벌 영도커피페스티벌.jpg">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/festaContents'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src="/resources/img/festival/양재플라워페스타.jpg">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/festaContents'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src="/resources/img/festival/제2회세계를품은인천교육한마당.jpg">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div data-v-54077454 class="contents-slide"
									style="width: 160px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a
											href='/page/festaContents'>
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src="/resources/img/festival/오독.jpg">
													</picture>
												</div>
											</div>
										</a>
									</div>
								</div>
						</div>
					</div>
					<a data-v-223ac3f7 href="/page/festaContents" class="btn-more all">더보기</a>
				</div>

			</div>
		</div>
	</div>
	
</body>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
<script>
	new Swiper('.swiper', {
		autoplay : {
			delay : 3000
		},
		loop : true,
		slidesPerView : 10,
		spaceBetween : 4,
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
	</html>
</main>