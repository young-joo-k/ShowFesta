<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<main id="main">
	<html>
<head>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/N_mainpage.css?after" rel="stylesheet">
<link href="/resources/css/swiper.css?after" rel="stylesheet">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<title>Home</title>
</head>
<body>
	<div class="search-body" style="color:white">
		<div data-v-223ac3f7 class="middle-section">
			<div data-v-223ac3f7 id="mitisection_index_1"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title" id="under-line">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">뮤지컬</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
							<c:forEach var="content" items="${musicalSearchResults}"
								varStatus="loop">
								<div data-v-54077454 class="contents-slide"
									style="width: 240px; margin-right: 10px;">
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
										<div>
											<h3 class=content-name>
												<span class="content-title"><c:out
														value="${content.m_title}" /></span>
											</h3>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<a data-v-223ac3f7 href="#" class="btn-more all" id="musical_more">더보기</a>
				</div>
			</div>
			<div data-v-223ac3f7 id="mitisection_index_2"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title" id="under-line">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">콘서트</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
							<c:forEach var="content" items="${concertSearchResults}">
								<div data-v-54077454 class="contents-slide"
									style="width: 240px; margin-right: 10px;">
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
										<div>
											<h3 class=content-name>
												<span class="content-title"><c:out
														value="${content.m_title}" /></span>
											</h3>
										</div>

									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<a data-v-223ac3f7 href="#" class="btn-more all" id="concert_more">더보기</a>
				</div>
			</div>
			<div data-v-223ac3f7 id="mitisection_index_3"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title" id="under-line">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">페스티벌</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
							<c:forEach var="content" items="${festivalSearchResults}"
								varStatus="loop">
								<div data-v-54077454 class="contents-slide"
									style="width: 240px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a href='#' id="f_s_contents${loop.index }">
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src=<c:out value = "${content.f_img}"/> class="thumb-img">
													</picture>
												</div>
											</div>
										</a>
										<div>
											<h3 class=content-name>
												<span class="content-title"><c:out
														value="${content.f_title}" /></span>
											</h3>
										</div>
									</div>
								</div>
								<div class="festaList${loop.index }" style="display: none;">
									<div class="top clearfix">
										<div class="slide-wrap mini-slide floatleft">
											<div class="big-img">
												<img src="${content.f_img}">
											</div>
										</div>
										<div class="app-info">
											<p class="app-title mo-hide">${content.f_title}</p>
											<div class="tab-content tab-content1 on">
												<h4 class="blind">기본정보</h4>
												<table class="table-type1" id="table1" tabindex="0">
													<tbody>
														<tr>
															<td class="th">전화명</td>
															<td>${content.f_adress}</td>
														</tr>
														<tr>
															<td class="th">전화번호</td>
															<td>${content.f_tel}</td>
														</tr>
														<c:choose>
															<c:when test="${not empty content.f_link}">
																<tr>
																	<td class="th">홈페이지</td>
																	<td>
																		<div class="ft-blue2">${content.f_link}</div>
																	</td>
																</tr>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${not empty content.f_tel}">
																<tr>
																	<td class="th">연락처</td>
																	<td>
																		<div class="ft-blue2">${content.f_tel}</div>
																	</td>
																</tr>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
														<tr>
															<td class="th">주소</td>
															<td><div>${content.f_infoadr }&nbsp;</div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="bot">
										<ul>
											<li><strong>개요</strong>
												<p>
												<div class="gaeyo">${content.f_text }</div>
												</p></li>
										</ul>
									</div>
								</div>
							</c:forEach>
							<input type="hidden" value="${length}" id="fList_length" />
						</div>
					</div>
					<a data-v-223ac3f7 href="#" class="btn-more all" id="festival_more">더보기</a>
				</div>

			</div>
			<div data-v-223ac3f7 id="mitisection_index_4"
				class="multi portrait-cell">
				<div data-v-223ac3f7 class="title" id="under-line">
					<h1 data-v-223ac3f7 tabindex="0" class="title-area">
						<span data-v-223ac3f7 class="label">출연</span>
					</h1>
				</div>
				<div data-v-223ac3f7>
					<div data-v-54077454 data-v-223ac3f7 class="session-contents"
						cell-type="band_14">
						<div class="contents-wrapper">
							<c:forEach var="content" items="${actorSearchResults}"
								varStatus="loop">
								<div data-v-54077454 class="contents-slide"
									style="width: 240px; margin-right: 10px;">
									<div data-v-54077454 class="thumb portrait"
										loaded-fn="function() { [navice cod]}" cell-index="0">
										<a href='<c:out value = "${content.a_link}"/>' target="_black">
											<div class="thumb-image">
												<div class="picture-area">
													<picture> <img
														src=<c:out value = "${content.a_img}"/> class="thumb-img">
													</picture>
												</div>
											</div>
										</a>
										<div>
											<h3 class=content-name>
												<span class="content-title"><c:out
														value="${content.a_name}" /></span>
											</h3>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<a data-v-223ac3f7 href="#" class="btn-more all" id="actor_more">더보기</a>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-festa">
		<div class="modal-content-wrap">
			<div class="modal-header">
				<button type="button" class="modal-close-btn" data-dismiss="modal">닫기</button>
			</div>
			<div class="modal-body">
				<div class="modal-content-container">
					<div class=today-contents>
						<div id="modal-festa-contents"
							class="content-box cb-type1 mb-mt50">
							<!-- 			모달내용자리 -->
						</div>
					</div>
				</div>
			</div>
			<div class=modal-footer></div>
		</div>
	</div>
	<!--모달끝 -->
	<div id="overlay" class="overlay"></div>
	<!--all-contents-list 끝 -->
</body>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
<script>
	$(document)
			.ready(
					function() {
						$("#musical_more")
								.click(
										function(e) {
											e.preventDefault(); // 기본 링크 동작을 막습니다.

											// 현재 검색어를 가져오는 부분을 수정합니다.
											var currentKeyword = $(
													"#header_keyword").val();

											// 더보기 링크로 이동합니다.
											var moreLinkUrl = "/page/searchResult_musical?keyword="
													+ encodeURIComponent(currentKeyword);
											window.location.href = moreLinkUrl;
										});
						$("#concert_more")
								.click(
										function(e) {
											e.preventDefault(); // 기본 링크 동작을 막습니다.

											// 현재 검색어를 가져오는 부분을 수정합니다.
											var currentKeyword = $(
													"#header_keyword").val();

											// 더보기 링크로 이동합니다.
											var moreLinkUrl = "/page/searchResult_concert?keyword="
													+ encodeURIComponent(currentKeyword);
											window.location.href = moreLinkUrl;
										});
						$("#festival_more")
								.click(
										function(e) {
											e.preventDefault(); // 기본 링크 동작을 막습니다.

											// 현재 검색어를 가져오는 부분을 수정합니다.
											var currentKeyword = $(
													"#header_keyword").val();

											// 더보기 링크로 이동합니다.
											var moreLinkUrl = "/page/searchResult_festival?keyword="
													+ encodeURIComponent(currentKeyword);
											window.location.href = moreLinkUrl;
										});
						$("#actor_more")
								.click(
										function(e) {
											e.preventDefault(); // 기본 링크 동작을 막습니다.

											// 현재 검색어를 가져오는 부분을 수정합니다.
											var currentKeyword = $(
													"#header_keyword").val();

											// 더보기 링크로 이동합니다.
											var moreLinkUrl = "/page/searchResult_actor?keyword="
													+ encodeURIComponent(currentKeyword);
											window.location.href = moreLinkUrl;
										});
						// 닫기 버튼 또는 오버레이를 클릭하면 모달을 숨기기
						$('button.modal-close-btn, #overlay').click(function() {
							$("#modal-festa").hide();
							$('#overlay').removeAttr('style');
						});
						//모달
						var f_length = $("#fList_length").val();
						for (let i = 0; i < f_length; i++) {
							$("#f_s_contents" + i).click(function(e) {
								e.preventDefault();
								$("#modal-festa").show();
								$("#overlay").show();
								var $contentsDiv = $("#modal-festa-contents");
								var textString = $(".festaList" + i).html();
								$contentsDiv.html(textString);
							});
						}
					});
</script>
	</html>
</main>