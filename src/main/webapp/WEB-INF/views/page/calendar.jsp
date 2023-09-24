<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/calendarheader.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!-- <title>캘린더</title> -->
<link href="/resources/css/N_calendar.css?after" rel="stylesheet"
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
				</span>
				<!--오늘날짜로 가는 버튼 -->
				<div class="today_button_div">
					<input type="button" class="today_button"
						onclick="javascript:location.href='./calendar'" value="오늘" />
				</div>
				<!--오늘날짜로 가는 버튼 끝 -->
				<a class="before_after_month"
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
							<input type="hidden" value="${endDay}" id="dateList_length" />
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<td class="today">

										<div class="date">
											<div class="circle"></div>
											${dateList.date}일
										</div>
										<div class="contentsCount">
											<a href="#" id="m_btn${dateList.date }" class="contentsCnt1"
												data-event-type="뮤지컬" data-date="${dateList.date }">뮤지컬
												: ${dateList.musicalCnt}</a><br> <a href="#"
												id="c_btn${dateList.date }" class="contentsCnt2"
												data-event-type="콘서트" data-date="${dateList.date }">콘서트
												: ${dateList.concertCnt}</a><br> <a href="#"
												id="f_btn${dateList.date }" class="contentsCnt3"
												data-event-type="축제" data-date="${dateList.date }">축제 :
												${dateList.festivalCnt}</a>
										</div> <c:forEach var="musicalList"
											items="${dateList.m_all_contents }">
											<div class="musicalList${dateList.date }"
												style="display: none;">
												<a href='/page/musical_info?m_num=${musicalList.m_num}'>
													<div class=list-inner-wrap>
														<img class="modal-comImg"
															src=<c:out value = "${musicalList.m_img}"/>>
														<div class=modal-list-txt>
															<div class="modal-list-tit1">${musicalList.m_title}</div>
															<div class="modal-list-tit2">
																<p class="dateDate">${musicalList.m_start_date}&nbsp;~&nbsp;</p>
																<p class="dateDate">${musicalList.m_end_date}</p>
															</div>
															<div class="modal-list-tit3">${musicalList.m_place}</div>
														</div>
													</div>
												</a>
											</div>
										</c:forEach> <c:forEach var="concertList"
											items="${dateList.c_all_contents }">
											<div class="concertList${dateList.date }"
												style="display: none;">
												<a href='/page/concert_info?m_num=${concertList.m_num}'>
													<div class=list-inner-wrap>
														<img class="modal-comImg"
															src=<c:out value = "${concertList.m_img}"/>>
														<div class=modal-list-txt>
															<div class="modal-list-tit1">${concertList.m_title}</div>
															<div class="modal-list-tit2">
																<p class="dateDate">${concertList.m_start_date}&nbsp;~&nbsp;</p>
																<p class="dateDate">${concertList.m_end_date}</p>
															</div>
															<div class="modal-list-tit3">${concertList.m_place}</div>
														</div>
													</div>
												</a>
											</div>
										</c:forEach> <c:forEach var="festivalList"
											items="${dateList.f_all_contents }">
											<div class="festivalList${dateList.date }"
												style="display: none;">
												<a href='/page/festaContents'>
													<div class=list-inner-wrap>
														<img class="modal-comImg"
															src=<c:out value = "${festivalList.f_img}"/>>
														<div class=modal-list-txt>
															<div class="modal-list-tit1">${festivalList.f_title}</div>
															<div class="modal-list-tit2">
																<p class="dateDate">${festivalList.f_s_date}&nbsp;~&nbsp;</p>
																<p class="dateDate">${festivalList.f_e_date}</p>
															</div>
															<div class="modal-list-tit3">${festivalList.f_adress}</div>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat">
											<c:choose>
												<c:when test="${not empty dateList.date}">
											      ${dateList.date}일
											    </c:when>
												<c:otherwise>
													<div></div>
												</c:otherwise>
											</c:choose>
										</div> <c:if
											test="${not empty dateList.date and dateList.date ne ''}">
											<a href="#" id="m_btn${dateList.date }" class="contentsCnt1"
												data-event-type="뮤지컬" data-date="${dateList.date }">뮤지컬
												: ${dateList.musicalCnt }</a>
											<br>
											<a href="#" id="c_btn${dateList.date }" class="contentsCnt2"
												data-event-type="콘서트" data-date="${dateList.date }">콘서트
												: ${dateList.concertCnt }</a>
											<br>
											<a href="#" id="f_btn${dateList.date }" class="contentsCnt3"
												data-event-type="축제" data-date="${dateList.date }">축제 :
												${dateList.festivalCnt }</a>
										</c:if> <c:forEach var="musicalList"
											items="${dateList.m_all_contents }">
											<div class="musicalList${dateList.date }"
												style="display: none;">
												<a href='/page/musical_info?m_num=${musicalList.m_num}'>
													<div class=list-inner-wrap>
														<img class="modal-comImg"
															src=<c:out value = "${musicalList.m_img}"/>>
														<div class=modal-list-txt>
															<div class="modal-list-tit1">${musicalList.m_title}</div>
															<div class="modal-list-tit2">
																<p class="dateDate">${musicalList.m_start_date}&nbsp;~&nbsp;</p>
																<p class="dateDate">${musicalList.m_end_date}</p>
															</div>
															<div class="modal-list-tit3">${musicalList.m_place}</div>
														</div>
													</div>
												</a>
											</div>
										</c:forEach> <c:forEach var="concertList"
											items="${dateList.c_all_contents }">
											<div class="concertList${dateList.date }"
												style="display: none;">
												<a href='/page/concert_info?m_num=${concertList.m_num}'>
													<div class=list-inner-wrap>
														<img class="modal-comImg"
															src=<c:out value = "${concertList.m_img}"/>>
														<div class=modal-list-txt>
															<div class="modal-list-tit1">${concertList.m_title}</div>
															<div class="modal-list-tit2">
																<p class="dateDate">${concertList.m_start_date}&nbsp;~&nbsp;</p>
																<p class="dateDate">${concertList.m_end_date}</p>
															</div>
															<div class="modal-list-tit3">${concertList.m_place}</div>
														</div>
													</div>
												</a>
											</div>
										</c:forEach> <c:forEach var="festivalList"
											items="${dateList.f_all_contents }">
											<div class="festivalList${dateList.date }"
												style="display: none;">
												<a href='/page/festaContents'>
													<div class=list-inner-wrap>
														<img class="modal-comImg"
															src=<c:out value = "${festivalList.f_img}"/>>
														<div class=modal-list-txt>
															<div class="modal-list-tit1">${festivalList.f_title}</div>
															<div class="modal-list-tit2">
																<p class="dateDate">${festivalList.f_s_date}&nbsp;~&nbsp;</p>
																<p class="dateDate">${festivalList.f_e_date}</p>
															</div>
															<div class="modal-list-tit3">${festivalList.f_adress}</div>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</td>
					</tr>
					</c:when>
					<c:when test="${date_status.index%7==0}">

						<tr class="cal-list">
							<td class="sun_day">
								<div class="sun">
									<c:choose>
										<c:when test="${not empty dateList.date}">
								      ${dateList.date}일
								    </c:when>
										<c:otherwise>
											<div></div>
										</c:otherwise>
									</c:choose>
								</div> <c:if test="${not empty dateList.date and dateList.date ne ''}">
									<a href="#" id="m_btn${dateList.date }" class="contentsCnt1"
										data-event-type="뮤지컬" data-date="${dateList.date }">뮤지컬 :
										${dateList.musicalCnt }</a>
									<br>
									<a href="#" id="c_btn${dateList.date }" class="contentsCnt2"
										data-event-type="콘서트" data-date="${dateList.date }">콘서트 :
										${dateList.concertCnt }</a>
									<br>
									<a href="#" id="f_btn${dateList.date }" class="contentsCnt3"
										data-event-type="축제" data-date="${dateList.date }">축제 :
										${dateList.festivalCnt }</a>
								</c:if> <c:forEach var="musicalList"
									items="${dateList.m_all_contents }">
									<div class="musicalList${dateList.date }"
										style="display: none;">
										<a href='/page/musical_info?m_num=${musicalList.m_num}'>
											<div class=list-inner-wrap>
												<img class="modal-comImg"
													src=<c:out value = "${musicalList.m_img}"/>>
												<div class=modal-list-txt>
													<div class="modal-list-tit1">${musicalList.m_title}</div>
													<div class="modal-list-tit2">
														<p class="dateDate">${musicalList.m_start_date}&nbsp;~&nbsp;</p>
														<p class="dateDate">${musicalList.m_end_date}</p>
													</div>
													<div class="modal-list-tit3">${musicalList.m_place}</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach> <c:forEach var="concertList"
									items="${dateList.c_all_contents }">
									<div class="concertList${dateList.date }"
										style="display: none;">
										<a href='/page/concert_info?m_num=${concertList.m_num}'>
											<div class=list-inner-wrap>
												<img class="modal-comImg"
													src=<c:out value = "${concertList.m_img}"/>>
												<div class=modal-list-txt>
													<div class="modal-list-tit1">${concertList.m_title}</div>
													<div class="modal-list-tit2">
														<p class="dateDate">${concertList.m_start_date}&nbsp;~&nbsp;</p>
														<p class="dateDate">${concertList.m_end_date}</p>
													</div>
													<div class="modal-list-tit3">${concertList.m_place}</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach> <c:forEach var="festivalList"
									items="${dateList.f_all_contents }">
									<div class="festivalList${dateList.date }"
										style="display: none;">
										<a href='/page/festaContents'>
											<div class=list-inner-wrap>
												<img class="modal-comImg"
													src=<c:out value = "${festivalList.f_img}"/>>
												<div class=modal-list-txt>
													<div class="modal-list-tit1">${festivalList.f_title}</div>
													<div class="modal-list-tit2">
														<p class="dateDate">${festivalList.f_s_date}&nbsp;~&nbsp;</p>
														<p class="dateDate">${festivalList.f_e_date}</p>
													</div>
													<div class="modal-list-tit3">${festivalList.f_adress}</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</td>
					</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date">
								<c:choose>
									<c:when test="${not empty dateList.date}">
								      ${dateList.date}일
								    </c:when>
									<c:otherwise>
										<div></div>
									</c:otherwise>
								</c:choose>
							</div> <c:if test="${not empty dateList.date and dateList.date ne ''}">
								<a href="#" id="m_btn${dateList.date }" class="contentsCnt1"
									data-event-type="뮤지컬" data-date="${dateList.date }">뮤지컬 :
									${dateList.musicalCnt }</a>
								<br>
								<a href="#" id="c_btn${dateList.date }" class="contentsCnt2"
									data-event-type="콘서트" data-date="${dateList.date }">콘서트 :
									${dateList.concertCnt }</a>
								<br>
								<a href="#" id="f_btn${dateList.date }" class="contentsCnt3"
									data-event-type="축제" data-date="${dateList.date }">축제 :
									${dateList.festivalCnt }</a>
							</c:if> <c:forEach var="musicalList" items="${dateList.m_all_contents }">
								<div class="musicalList${dateList.date }" style="display: none;">
									<a href='/page/musical_info?m_num=${musicalList.m_num}'>
										<div class=list-inner-wrap>
											<img class="modal-comImg"
												src=<c:out value = "${musicalList.m_img}"/>>
											<div class=modal-list-txt>
												<div class="modal-list-tit1">${musicalList.m_title}</div>
												<div class="modal-list-tit2">
													<p class="dateDate">${musicalList.m_start_date}&nbsp;~&nbsp;</p>
													<p class="dateDate">${musicalList.m_end_date}</p>
												</div>
												<div class="modal-list-tit3">${musicalList.m_place}</div>
											</div>
										</div>
									</a>
								</div>
							</c:forEach> <c:forEach var="concertList" items="${dateList.c_all_contents }">
								<div class="concertList${dateList.date }" style="display: none;">
									<a href='/page/concert_info?m_num=${concertList.m_num}'>
										<div class=list-inner-wrap>
											<img class="modal-comImg"
												src=<c:out value = "${concertList.m_img}"/>>
											<div class=modal-list-txt>
												<div class="modal-list-tit1">${concertList.m_title}</div>
												<div class="modal-list-tit2">
													<p class="dateDate">${concertList.m_start_date}&nbsp;~&nbsp;</p>
													<p class="dateDate">${concertList.m_end_date}</p>
												</div>
												<div class="modal-list-tit3">${concertList.m_place}</div>
											</div>
										</div>
									</a>
								</div>
							</c:forEach> <c:forEach var="festivalList"
								items="${dateList.f_all_contents }">
								<div class="festivalList${dateList.date }"
									style="display: none;">
									<a href='/page/festaContents'>
										<div class=list-inner-wrap>
											<img class="modal-comImg"
												src=<c:out value = "${festivalList.f_img}"/>>
											<div class=modal-list-txt>
												<div class="modal-list-tit1">${festivalList.f_title}</div>
												<div class="modal-list-tit2">
													<p class="dateDate">${festivalList.f_s_date}&nbsp;~&nbsp;</p>
													<p class="dateDate">${festivalList.f_e_date}</p>
												</div>
												<div class="modal-list-tit3">${festivalList.f_adress}</div>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
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
		<div id="modal-musical">
			<div class="modal-content-wrap">
				<div class="modal-header">
					<h2 class=modal-title></h2>
					<button type="button" class="modal-close-btn" data-dismiss="modal">닫기</button>
				</div>
				<div class="modal-body">
					<div class="modal-content-container">
						<div class=today-contents>
							<!-- 					이 안에 이제 내용 -->
						</div>
					</div>
				</div>
				<div class=modal-footer></div>
			</div>
		</div>

		<!--모달끝 -->
		<div id="overlay" class="overlay"></div>

	</form>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 모달 기능을 위한 JavaScript 
	var dateListLength = $("#dateList_length").val();

	console.log(dateListLength);

	for (let i = 1; i <= dateListLength; i++) {
		$("#m_btn" + i).click(function(e) {
			e.preventDefault();
			$("#modal-musical").show();
			$("#overlay").show();
			var $contentsDiv = $(".today-contents");
			var textString = '';
			$(".modal-title").text("뮤지컬");
			$('.musicalList' + i).each(function() {
				textString += $(this).html();
			});
			$contentsDiv.html(textString);
		});
		$("#c_btn" + i).click(function(e) {
			e.preventDefault();
			$("#modal-musical").show();
			$("#overlay").show();
			var $contentsDiv = $(".today-contents");
			var textString = '';
			$(".modal-title").text("콘서트");
			$('.concertList' + i).each(function() {
				textString += $(this).html();
			});
			$contentsDiv.html(textString);
		});
		$("#f_btn" + i).click(function(e) {
			e.preventDefault();
			$("#modal-musical").show();
			$("#overlay").show();
			var $contentsDiv = $(".today-contents");
			$(".modal-title").text("페스티벌");
			var textString = '';
			$('.festivalList' + i).each(function() {
				textString += $(this).html();
			});
			$contentsDiv.html(textString);
		});
	}

	var mdate;
	$(document).ready(function() {
		// 닫기 버튼 또는 오버레이를 클릭하면 모달을 숨기기
		$('button.modal-close-btn, #overlay').click(function() {
			$("#modal-musical").hide();
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
<%-- <%@include file="../includes/footer.jsp"%> --%>