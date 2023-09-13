<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!-- <title>캘린더</title> -->
<!-- <link href="/resources/assets/css/calendar.css" rel="stylesheet"	type="text/css"> -->
<link href="/resources/css/calendar.css?after" rel="stylesheet" type="text/css">
<!-- <body> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link href="/resources/assets/css/calendar.css" rel="stylesheet" type="text/css"> -->
<form name="calendarFrm" id="calendarFrm" action="" method="GET">

	<div class="calendar">
		<!--날짜 네비게이션  -->
		<div class="navigation">
			<a class="before_after_year"
				href="./calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
				&lt;&lt; <!-- 이전년도 --></a> 
			<a class="before_after_month"
				href="./calendar?year=${today_info.before_year}&month=${today_info.before_month}">
				&lt; <!-- 이전 달 --></a> 
			<span class="this_month"> &nbsp;${today_info.search_year}. 
				<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
			</span> 
			<a class="before_after_month"
				href="./calendar?year=${today_info.after_year}&month=${today_info.after_month}">
				<!-- 다음달 --> &gt; </a> 
			<a class="before_after_year"
				href="./calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
				<!-- 다음년도 --> &gt;&gt; </a>
		</div>

		<!--유형 선택 페이지 -->
		<div class="searchBox">
			<form id='searchForm' action="#" method='get'>
				<select id="typeSearch" name='type'>
					<option value="${pageMaker.cri.type == null?'selected':'' }">유형</option>
					<option value="M"
						<c:out value="${pageMaker.cri.type eq 'M' ? 'selected':'' }"/>>뮤지컬</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/>>콘서트</option>
					<option value="L"
						<c:out value="${pageMaker.cri.type eq 'L' ? 'selected':'' }"/>>지역축제</option>
					<option value="F"
						<c:out value="${pageMaker.cri.type eq 'F' ? 'selected':'' }"/>>페스티벌</option>
				</select> <input type='text' name='keyword'
					value='<c:out value ="${pageMaker.cri.keyword }"/>' />
				<button class='searchFormBtn'>찾기</button>
			</form>
		</div>
		<!--유형선택 페이지 끝 -->

		<!--오늘날짜로 가는 버튼 -->
		<div class="today_button_div">
			<input type="button" class="today_button"
				onclick="javascript:location.href='./calendar'" value="오늘날짜로" />
		</div>
		<!--오늘날짜로 가는 버튼 끝 -->
		
		<!--달력 몸체 -->
		<table class="calendar_body">
			<thead>
				<tr bgcolor="#CECECE">
					<td class="day sun">일</td>
					<td class="day">월</td>
					<td class="day">화</td>
					<td class="day">수</td>
					<td class="day">목</td>
					<td class="day">금</td>
					<td class="day sat">토</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<td class="today">
									<div class="date">${dateList.date}</div> 
									<%-- 										<div class = "cnt" > 공연 개수 : ${todayCnt}</div> --%>

									<a class="cnt">뮤지컬 : ${musicalCnt}</a><br>
									<a class="cnt">콘서트 : ${concertCnt}</a>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">${dateList.date}</div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun">${dateList.date}</div>
						<div></div>
					</td>
							</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date">${dateList.date}</div>
							<!--<div></div> -->
							<!-- 여기에 매일 공연 개수 나타나야해 -->
<%-- 							<a class="cnt">공연 개수 : ${getPerformanceCount(dateList.date)}</a> --%>
						</td>
					</c:otherwise>
						</c:choose>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<!--달력몸체끝 -->
	</div>

	
	<!-- 모달 -->
	<div id="modal" class="modalFade">
		<!--모달내용 -->
		<div class="modal-content">
			<div class ="modal-header">
			<h2>상세정보</h2>
			<button type = "button" class = "btn btn-default" data-dismiss="modal">닫기</button>
			</div>
			<div class = "modal-body">
			<!--<span class="close-modal" id="close-modal">&times;</span> -->
			<h2>제발 되주겠니</h2>
			</div>
		<!-- <div class = "modal-footer"> </div>-->
		</div>
	</div>

	<div id="overlay" class="overlay"></div>
</form>
<!-- </body> -->

<!-- </html> -->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 모달 기능을 위한 JavaScript
	$(document).ready(function() {
		// cnt 요소를 클릭하면 모달과 오버레이를 표시합니다.

		$('.cnt').click(function() {
			$('#modal').show();
			$('#overlay').show();
		});

		// 닫기 버튼 또는 오버레이를 클릭하면 모달을 숨깁니다.
		$('button, #overlay').click(function() {
			$('#modal').hide();
			$('#overlay').hide();
		});

// 		var searchForm = $("#searchForm");

// 		$("#searchFormBtn").on("click", function(e) {

// 			if (!searchForm.find("option:selected").val()) {
// 				alert("검색유형을 선택하세요");
// 				return false;
// 			}
// 			if (!searchForm.find("input[name='keyword']").val()) {
// 				alert("검색내용을 입력하세요");
// 				return false;
// 			}

// 			searchForm.find("input[name='pageNum']").val("1");

// 			e.preventDefault();

// 			searchForm.submit();

// 		})
	});
</script>

<%@include file="../includes/footer.jsp"%>
