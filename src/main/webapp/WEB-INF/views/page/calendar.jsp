<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!-- <title>캘린더</title> -->
<link href="/resources/css/calendar.css?after" rel="stylesheet"
	type="text/css">
</head>
<body class="calendarBody">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">
		<div class="calendar">
			<!--날짜 네비게이션  -->
			<div class="cal-navigation">
				<a class="before_after_year"
					href="./calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt; <!-- 이전년도 -->
				</a> <a class="before_after_month"
					href="./calendar?year=${today_info.before_year}&month=${today_info.before_month}">
					&lt; <!-- 이전 달 -->
				</a> <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> 			<!--오늘날짜로 가는 버튼 -->
			<div class="today_button_div">
				<input type="button" class="today_button"
					onclick="javascript:location.href='./calendar'" value="오늘" />
			</div>
			<!--오늘날짜로 가는 버튼 끝 --><a class="before_after_month"
					href="./calendar?year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="./calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					<!-- 다음년도 --> &gt;&gt;
				</a>
			</div>

			<!--유형 선택 페이지 -->
			<!--       <div class="searchBox"> -->
			<!--          <form id='searchForm' action="#" method='get'> -->
			<!--             <select id="typeSearch" name='type'> -->
			<%--                <option value="${pageMaker.cri.type == null?'selected':'' }">전체</option> --%>
			<!--                <option value="M" -->
			<%--                   <c:out value="${pageMaker.cri.type eq 'M' ? 'selected':'' }"/>>뮤지컬</option> --%>
			<!--                <option value="C" -->
			<%--                   <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/>>콘서트</option> --%>
			<!--                <option value="L" -->
			<%--                   <c:out value="${pageMaker.cri.type eq 'L' ? 'selected':'' }"/>>축제</option> --%>
			<!--             </select> <input type='text' name='keyword' -->
			<%--                value='<c:out value ="${pageMaker.cri.keyword }"/>' /> --%>
			<!--             <button class='searchBoxBtn'>찾기</button> -->
			<!--          </form> -->
			<!--       </div> -->
			<!--유형선택 페이지 끝 -->



			<!--달력 몸체 -->
			<table class="calendar_body">
				<thead>
					<tr class=week>
						<td class="day sunday">일</td>
						<td class="day">월</td>
						<td class="day">화</td>
						<td class="day">수</td>
						<td class="day">목</td>
						<td class="day">금</td>
						<td class="day satday">토</td>
					</tr>
				</thead>
				<tbody class="calendar-body">
					<tr class="cal-list">
						<c:forEach var="dateList" items="${DateList}"
							varStatus="date_status">
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<td class="today">
										<div class="date">${dateList.date}일</div>
										<div class="contentsCount">
											<a href="#" class="contentsCnt1" data-event-type="뮤지컬"
												data-date="${dateList.date }">뮤지컬 :
												${dateList.musicalCnt}</a><br> <a href="#"
												class="contentsCnt2" data-event-type="콘서트"
												data-date="${dateList.date }">콘서트 :
												${dateList.concertCnt}</a><br> <a href="#"
												class="contentsCnt3" data-event-type="축제"
												data-date="${dateList.date }">축제 :
												${dateList.festivalCnt}</a>
										</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat">${dateList.date}일</div> <c:if
											test="${not empty dateList.date and dateList.date ne ''}">
											<a href="#" class="contentsCnt1" data-event-type="뮤지컬"
												data-date="${dateList.date }">뮤지컬 :
												${dateList.musicalCnt }</a>
											<br>
											<a href="#" class="contentsCnt2" data-event-type="콘서트"
												data-date="${dateList.date }">콘서트 :
												${dateList.concertCnt }</a>
											<br>
											<a href="#" class="contentsCnt3" data-event-type="축제"
												data-date="${dateList.date }">축제 :
												${dateList.festivalCnt }</a>
										</c:if>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
									<!--             			</tr> -->
									<tr class="cal-list">
										<td class="sun_day">
											<div class="sun">${dateList.date}일</div> <c:if
												test="${not empty dateList.date and dateList.date ne ''}">
												<a href="#" class="contentsCnt1" data-event-type="뮤지컬"
													data-date="${dateList.date }">뮤지컬 :
													${dateList.musicalCnt }</a>
												<br>
												<a href="#" class="contentsCnt2" data-event-type="콘서트"
													data-date="${dateList.date }">콘서트 :
													${dateList.concertCnt }</a>
												<br>
												<a href="#" class="contentsCnt3" data-event-type="축제"
													data-date="${dateList.date }">축제 :
													${dateList.festivalCnt }</a>
											</c:if>
										</td>
								</c:when>
								<c:otherwise>
									<td class="normal_day">
										<div class="date">${dateList.date}일</div> <c:if
											test="${not empty dateList.date and dateList.date ne ''}">
											<a href="#" class="contentsCnt1" data-event-type="뮤지컬"
												data-date="${dateList.date }">뮤지컬 :
												${dateList.musicalCnt }</a>
											<br>
											<a href="#" class="contentsCnt2" data-event-type="콘서트"
												data-date="${dateList.date }">콘서트 :
												${dateList.concertCnt }</a>
											<br>
											<a href="#" class="contentsCnt3" data-event-type="축제"
												data-date="${dateList.date }">축제 :
												${dateList.festivalCnt }</a>
										</c:if>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tr>
				</tbody>
			</table>
			<!--달력몸체끝 -->
		</div>
		<!-- 달력 끝 -->

		<!-- 모달에 내용을 넣기 위한 HTML -->

		<!--모달 -->
		<c:set var="mList" value="${ModalList }" />
		<c:set var="mlength" value="${fn:length(mList)-1 }" />
		<c:forEach var="i" begin="0" end="${mlength}"
			varStatus="loop">
			<div id="modal-musical-${loop.index }" class="modal-musical">
				<div class="modal-content-wrap">
					<div class="modal-header">
						<h2 class=modal-title>뮤지컬</h2>
						<button type="button" class="modal-close-btn" data-dismiss="modal">닫기</button>
					</div>
					<!-- 모달헤더 끝 -->
					<div class="modal-body">
						<div class="modal-content-container">
							<!-- 데이터베이스에서 가져온 데이터 삽입 -->
							<div class=today-contents>
								<c:choose>
									<c:when test="${empty mList.get(i).getM_all_contents() }">
										<div class="no-data-message">
											<p class="no-message">표시할 내용이 없습니다.</p>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="content"
											items="${mList.get(i).getM_all_contents()}">
											<div class=modal-contents-list>
												<div class="contents">
													<div class=list-wrap>
														<!--상세페이지로 들어가는 링크 넣기 -->
														<a href='/page/musical_info?m_num=${content.m_num}'>
															<div class=list-inner-wrap>
																<!--DB에 저장된 이미지 링크 가져올겁니다 -->
																<img class="modal-comImg"
																	src=<c:out value = "${content.m_img}"/>>
																<div class=modal-list-txt>
																	<div class="modal-list-tit1">${content.m_title}</div>
																	<div class="modal-list-tit2">
																		<p class="dateDate">${content.m_start_date}&nbsp;~&nbsp;</p>
																		<p class="dateDate">${content.m_end_date}</p>
																	</div>
																	<div class="modal-list-tit3">${content.m_place}</div>
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
						</div>
					</div>
					<!--          <div class = modal-footer></div> -->
				</div>
			</div>
			<!-- 뮤지컬 모달 끝-->
			<!-- 콘서트 모달 -->
			<div id="modal-concert-${loop.index }" class="modal-concert">
				<div class="modal-content-wrap">
					<div class="modal-header">
						<h2 class=modal-title>콘서트</h2>
						<button type="button" class="modal-close-btn" data-dismiss="modal">닫기</button>
					</div>
					<!-- 모달헤더 끝 -->
					<div class="modal-body">
						<div class="modal-content-container">
							<!-- 데이터베이스에서 가져온 데이터 삽입 -->
							<div class=today-contents>
								<c:choose>
									<c:when test="${empty mList.get(i).getC_all_contents() }">
										<div class="no-data-message">
											<p class="no-message">표시할 내용이 없습니다.</p>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="content" items="${mList.get(i).getC_all_contents()}">
											<div class=modal-contents-list>
												<div class="contents">
													<div class=list-wrap>
														<!--상세페이지로 들어가는 링크 넣기 -->
														<a href='/page/musical_info?m_num=${content.m_num}'>
															<div class=list-inner-wrap>
																<!--DB에 저장된 이미지 링크 가져올겁니다 -->
																<img class="modal-comImg"
																	src=<c:out value = "${content.m_img}"/>>
																<div class=modal-list-txt>
																	<div class="modal-list-tit1">${content.m_title}</div>
																	<div class="modal-list-tit2">
																		<p class="dateDate">${content.m_start_date}&nbsp;~&nbsp;</p>
																		<p class="dateDate">${content.m_end_date}</p>
																	</div>
																	<div class="modal-list-tit3">${content.m_place}</div>
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
						</div>
					</div>
					<!--          <div class = modal-footer></div> -->
				</div>
			</div>
			<!-- 콘서트 모달 끝 -->
			<!-- 페스티벌 모달 -->
			<div id="modal-festival-${loop.index }" class="modal-festival">
				<div class="modal-content-wrap">
					<div class="modal-header">
						<h2 class=modal-title>페스티벌</h2>
						<button type="button" class="modal-close-btn" data-dismiss="modal">닫기</button>
					</div>
					<!-- 모달헤더 끝 -->
					<div class="modal-body">
						<div class="modal-content-container">
							<!-- 데이터베이스에서 가져온 데이터 삽입 -->
							<div class=today-contents>
								<c:choose>
									<c:when test="${empty mList.get(i).getF_all_contents() }">
										<div class="no-data-message">
											<p class="no-message">표시할 내용이 없습니다.</p>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="content"
											items="${mList.get(i).getF_all_contents()}">
											<div class=modal-contents-list>
												<div class="contents">
													<div class=list-wrap>
														상세페이지로 들어가는 링크 넣기 <a
															href='/page/musical_info?m_num=${content.m_num}'>
															<div class=list-inner-wrap>
																DB에 저장된 이미지 링크 가져올겁니다 <img class="modal-comImg"
																	src=<c:out value = "${content.m_img}"/>>
																<div class=modal-list-txt>
																	<div class="modal-list-tit1">${content.m_title}</div>
																	<div class="modal-list-tit2">
																		<p class="dateDate">${content.m_start_date}&nbsp;~&nbsp;</p>
																		<p class="dateDate">${content.m_end_date}</p>
																	</div>
																	<div class="modal-list-tit3">${content.m_place}</div>
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
						</div>
					</div>
					<!--          <div class = modal-footer></div> -->
				</div>
			</div>
		</c:forEach>
		<!-- 페스티벌 모달 끝 -->
		<!--모달끝 -->
		<div id="overlay" class="overlay"></div>

	</form>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 모달 기능을 위한 JavaScript 
	var mdate;
	$(document).ready(function() {
		// 뮤지컬 모달 띄워줌
		$('.contentsCnt1').click(function(e) {
			e.preventDefault();
			mdate = $(this).attr("data-date") - 1;
			console.log(mdate);
			$('#modal-musical-' + mdate).css('display', 'block');
			$('#overlay').css('display', 'block');
		});

		//콘서트 모달 띄워줌
		$('.contentsCnt2').click(function(e) {
			e.preventDefault();
			mdate = $(this).attr("data-date") - 1;
			console.log(mdate);
			$('#modal-concert-' + mdate).css('display', 'block');
			$('#overlay').css('display', 'block');
		});

		//페스티벌 모달 띄워줌
		$('.contentsCnt3').click(function(e) {
			e.preventDefault();
			mdate = $(this).attr("data-date") - 1;
			console.log(mdate);
			$('#modal-festival-' + mdate).css('display', 'block');
			$('#overlay').css('display', 'block');
		});

		// 닫기 버튼 또는 오버레이를 클릭하면 모달을 숨기기
		$('button.modal-close-btn, #overlay').click(function() {
			$('#modal-musical-' + mdate).removeAttr('style');
			$('#overlay').removeAttr('style');
		});

		$('button.modal-close-btn, #overlay').click(function() {
			$('#modal-concert-' + mdate).removeAttr('style');
			$('#overlay').removeAttr('style');
		});

		$('button.modal-close-btn, #overlay').click(function() {
			$('#modal-festival-' + mdate).removeAttr('style');
			$('#overlay').removeAttr('style');
		});
		

	});
</script>
<%@include file="../includes/footer.jsp"%>