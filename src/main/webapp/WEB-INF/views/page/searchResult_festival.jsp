<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<main id="main">
	<html>
<head>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/N_mainpage.css?after" rel="stylesheet">
<link href="/resources/css/swiper.css?after" rel="stylesheet">
<link href="/resources/css/searchresult.css?after" rel="stylesheet">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<title>Home</title>
</head>
<body>
	<div>
		<div data-v-223ac3f7 class="middle-section">

			<div data-v-223ac3f7 id="mitisection_index_3"
				class="multi portrait-cell" style="
    width: 1300;
">
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
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
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
	$(document).ready(function() {
		// 닫기 버튼 또는 오버레이를 클릭하면 모달을 숨기기
		$('button.modal-close-btn, #overlay').click(function() {
			$("#modal-festa").hide();
			$('#overlay').removeAttr('style');
		});
	});
</script>
	</html>
</main>