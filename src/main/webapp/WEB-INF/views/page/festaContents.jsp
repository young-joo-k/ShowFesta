<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/festivalheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/N_contents.css?after" rel="stylesheet"
	type="text/css">
<body class="genreContents">
	<!-- 유형별 페이지 입니다. -->
	<!-- 어떤 유형인지 나타냄 -->
	<!-- 날짜 선택할 수 있는 곳 -->
	<div class="contentSearchBox">
		<div class="contentSearchBox-wrap">
			<form action="/page/festaContentSearchDate" method="post">
				<label for="startDate">시작일 <input type="date" id="startDate"
					name="startDate" max="2026-12-31" min="2023-01-01" required>
				</label>&nbsp;&nbsp; <label for="endDate">종료일 <input type="date"
					id="endDate" name="endDate" max="2026-12-31" min="2023-01-01"
					required>
				</label>
				<button class="contentSearchBtn" type="submit">검색</button>
			</form>
		</div>
	</div>
	<div class="all-contents-wrap">
		<!-- 여기서부터 컨텐츠 리스트 입니다. 한 줄에 네 개의 컨텐츠가 들어갑니다. -->
		<c:if test="${empty searchResult }">
			<div class=all-contents-list>
				<c:choose>
					<c:when test="${empty festaContents }">
						<div class="no-data-message">
							<p class="no-message">표시할 내용이 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="content" items="${festaContents}" varStatus="loop">
							<div class=contents-list>
								<div class="contents">
									<div class=list-wrap>
										<!-- 상세페이지로 들어가는 링크 넣기 -->
										<a style="cursor: pointer;" href='#'
											id="f_contents${loop.index}">
											<div class=list-inner-wrap>
												<!--DB에 저장된 이미지 링크 가져올겁니다 -->
												<img class="comImg" src=<c:out value = "${content.f_img}"/>>
												<div class=list-txt>
													<div class="list-tit1">${content.f_title}</div>
													<div class="list-tit2">
														<p class="dateDate">${content.f_s_date}&nbsp;~&nbsp;</p>
														<p class="dateDate">${content.f_e_date}</p>
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
														<li class = "modal-li"><strong>개요</strong>
															<p>
															<div class="gaeyo">${content.f_text }</div>
															</p></li>
													</ul>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="clear"></div>
		</c:if>
		<c:if test="${empty festaContents }">
			<div class="search-contents-list">
				<c:choose>
					<c:when test="${empty searchResult}">
						<div class="no-data-message">
							<p class="no-message">검색 결과가 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="content" items="${searchResult}" varStatus="loop">
							<div class="contents-list">
								<!-- 여기에 검색 결과를 표시하는 코드를 작성 -->
								<a style="cursor: pointer;" href='#'
									id="f2_contents${loop.index}">
									<div class=list-inner-wrap>
										<!--DB에 저장된 이미지 링크 가져올겁니다 -->
										<img class="comImg" src=<c:out value = "${content.f_img}"/>>
										<div class=list-txt>
											<div class="list-tit1">${content.f_title}</div>
											<div class="list-tit2">
												<p class="dateDate">${content.f_s_date}&nbsp;~&nbsp;</p>
												<p class="dateDate">${content.f_e_date}</p>
											</div>
										</div>
									</div>
									<div class="festa2List${loop.index }" style="display: none;">
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
								</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="clear"></div>
			<!-- 검색 결과 표시 부분 끝 -->
		</c:if>
	</div>
	<input type="hidden" value="${length}" id="fList_length" />
	<input type="hidden" value="${searchLength}" id="f_s_List_length" />
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var f_length = $("#fList_length").val();
	console.log(f_length);
	var f_s_length = $("#f_s_List_length").val();
	console.log(f_s_length);
	for (let i = 0; i < f_length; i++) {
		$("#f_contents" + i).click(function(e) {
			e.preventDefault();
			$("#modal-festa").show();
			$("#overlay").show();
			var $contentsDiv = $("#modal-festa-contents");
			var textString = $(".festaList" + i).html();
			$contentsDiv.html(textString);
		});
	}
	for (let i = 0; i < f_s_length; i++) {
		$("#f2_contents" + i).click(function(e) {
			e.preventDefault();
			$("#modal-festa").show();
			$("#overlay").show();
			var $contentsDiv = $("#modal-festa-contents");
			var textString = $(".festa2List" + i).html();
			$contentsDiv.html(textString);
		});
	}
	$(document).ready(function() {
		// 닫기 버튼 또는 오버레이를 클릭하면 모달을 숨기기
		$('button.modal-close-btn, #overlay').click(function() {
			$("#modal-festa").hide();
			$('#overlay').removeAttr('style');
		});
		// 현재 날짜를 가져오는 함수
		function getCurrentDate() {
			var today = new Date();
			var year = today.getFullYear();
			var month = (today.getMonth() + 1).toString().padStart(2, '0');
			var day = today.getDate().toString().padStart(2, '0');
			return year + "-" + month + "-" + day;
		}

		// 오늘 날짜를 가져와서 input 요소의 value에 설정
		var currentDate = getCurrentDate();
		$("#startDate").val(currentDate); // 시작일 input 요소에 설정
		$("#endDate").val(currentDate); // 종료일 input 요소에 설정

	});
</script>