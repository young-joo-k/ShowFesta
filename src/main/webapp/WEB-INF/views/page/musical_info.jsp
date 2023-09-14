<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<link href="/resources/css/common.css?after" rel="stylesheet"
	type="text/css">
<link href="/resources/css/goods.css?after" rel="stylesheet"
	type="text/css">
<%@include file="../includes/header.jsp"%>

<%-- 	${musical.m_num }<br> --%>
<%-- 	${musical.m_title }<br> --%>
<%-- 	<img src="${musical.m_img}"/><br> --%>
<%-- 	${musical.m_start_date }<br> --%>
<%-- 	${musical.m_end_date }<br> --%>
<%-- 	${musical.m_place }<br> --%>
<%-- 	${musical.m_b_link } --%>

<div id="container">
	<main id="main">
		<section class = "infoSection">
			<div class="contents" style="">
				<div class="productWrapper">
					<div class="productMain">
						<div class="productMainTop">
							<div class="summary">
								<div class="summaryTop">
									<h2 class="prdTitle">${musical.m_title }</h2>
								</div>
								<div class="summaryBody">
									<div class="posterBox">
										<div class="posterBoxTop">
											<img class="posterBoxImage"
												src="${musical.m_img}"
												alt="${musical.m_title }">
										</div>
										<div class="posterBoxBottom">
											<div class="prdCast">
												<div class="prdCastWrap">
													<a class="prdCastBtn" data-toggle="self"
														data-toast="prdCast" aria-checked="false"
														aria-label="티켓캐스트 등록" role="checkbox" href="#"
														data-popup-hover="prdCast">즐겨찾기 일단 생긴거만</a>
												</div>
											</div>
										</div>
									</div>
									<ul class="info">
										<li class="infoItem"><strong class="infoLabel">장소</strong>
											<div class="infoDesc">
												<p class="infoText">${musical.m_place }</p>
											</div></li>
										<li class="infoItem"><strong class="infoLabel">공연기간</strong>
											<div class="infoDesc">
												<p class="infoText">${musical.m_start_date } ~ ${musical.m_end_date }</p>
											</div></li>
									</ul>
									<div class="bookBtn">
										<a class="sideBtn is-primary" href="${musical.m_b_link }" data-check="false"><span>예매하기</span></a>
									</div>
								</div>
							</div>
						</div>
						<div id="productMainBody" class="productMainBody">
							<nav class="nav">
								<div class="navSticky" style="">
									<div class="stickyWrap">
										<ul class="navList">
											<li class="navItem" style=>공연정보</li>
										</ul>
									</div>
								</div>
							</nav>
							<div>
								<div class="prdContents detail">
									<div class="content casting">
										<h3 class="contentTitle">캐스팅</h3>
										<div class="expandableWrap ">
											<ul class="castingList">
												<c:forEach var = "actor" items = "${actorList}">
													<li class="castingItem"><div class="castingTop">
															<a class="castingLink"
																href="http://www.playdb.co.kr/artistdb/detail.asp?ManNo=359"
																target="_blank" rel="noopener">
																<div class="castingProfile">
																	<img
																		src="${actor.a_img }"
																		class="castingImage" alt="프로필 사진">
																</div>
															</a> <a class="castingHeartBtn " data-toggle="self"
																data-toast="cast" aria-checked="false"
																aria-label="즐겨찾기 등록/취소" role="checkbox" href="#"></a>
														</div>
														<div class="castingInfo">
															<div class="castingActor">${actor.a_role }</div>
															<div class="castingName">${actor.a_name }</div>
														</div>
													</li>
												</c:forEach>
											</ul>
											<a class="contentToggleBtn" data-toggle="expandalbeWrap"
												role="button" aria-label="여닫기" href="#"></a>
										</div>
									</div>
									<div class="content description">
										<h3 class="contentTitle">공연상세 / 캐스팅일정</h3>
										<div class="contentDetail">
											<p>
												<strong><img
													src="//ticketimage.interpark.com/Play/image/etc/23/23008837-08.jpg"
													alt="" border="0"></strong>
											</p>
											<p>&nbsp;</p>
											<p>
												<strong><img
													src="//ticketimage.interpark.com/Play/image/etc/23/23008837-09.jpg"
													alt="" border="0"></strong>
											</p>
											<p>&nbsp;</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="topButtonWrapper ">
				<a href="#" class="topButton"><span class="blind">맨 위로</span></a>
			</div>
		</section>
	</main>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// JavaScript 부분
	$(document).ready(function() {
		$(".contentToggleBtn").on("click", function(e) {
			e.preventDefault();
			toggleContent();
		});
		$(".navItem").on("click", function(e) {
			// 기본 동작(링크 이동)을 방지합니다.
			e.preventDefault();

			// 모든 .navItem에서 is-active 클래스를 제거합니다.
			$(".navItem").removeClass("is-active");

			// 현재 클릭한 .navItem에 is-active 클래스를 추가합니다.
			$(this).addClass("is-active");

			// 여기에서 원하는 동작을 추가할 수 있습니다.
			// 예를 들어, 클릭한 메뉴에 해당하는 내용을 화면에 표시하거나 다른 동작을 수행할 수 있습니다.
		});
		function toggleContent() {
			// 여닫기 상태를 토글
			var expandableWrap = document.querySelector(".expandableWrap");
			var isToggled = expandableWrap.classList.contains("is-toggled");
			if (isToggled) {
				expandableWrap.classList.remove("is-toggled");
			} else {
				expandableWrap.classList.add("is-toggled");
			}
		}
	});
</script>
