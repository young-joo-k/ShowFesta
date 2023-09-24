<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/contentsDelete.css?after" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<title>plus</title>
</head>
<body>
	<div class="body">
		<div class="top-padding" style="display: flex; margin-top: 80px; margin-bottom:100px;">
			<div class="wrap" id="g-contents">
				<div class="cs-body">
					<div class="register-top">
						<h1>컨텐츠 삭제</h1>

					</div>
					<form role="form" action="contentsDelete" method="post">
						<div class=chooseContents>
							<div style="display: flex">
								<div>
									<input type="radio" name="contentType" value="musical" checked>뮤지컬
								</div>
								<div style="margin-left: 30px;">
									<input type="radio" name="contentType" value="concert">콘서트
								</div>
							</div>
							<div class="register-btn-wrap">
								<ul style="display: flex">
									<li><input type="submit" name="submitBtn"
										class="contentsDelete-submit" value="삭제"></li>
									<li><a href="/page/adminPage" onclick="onCancel();"
										class="register-cancel">취소</a></li>
								</ul>
							</div>
						</div>
						<div class="musicalContentList">
							<c:choose>
								<c:when test="${empty musicalContents }">
									<div class="no-like-message">
										<p class="no-like-message">데이터가 없습니다.</p>
									</div>
								</c:when>
								<c:otherwise>
									<table class="contentList" style="border-collapse: collapse;">
										<tr class="contentManagement">
											<th class="contentChoice"></th>
											<th class="adminTitle">제목</th>
											<th class="adminStartDate">시작일</th>
											<th class="adminEndDate">종료일</th>
											<th class="adminEndDate">장소</th>
											<th class="adminLink">링크</th>
										</tr>
										<c:forEach var="contents" items="${musicalContents}">
											<tr class="allContentInfo">
												<td class="checkBtn"><input type="checkbox"
													name="selectedcontents" value="${contents.m_num}"></td>
												<td class="allContentInfoTitle"><c:out
														value="${contents.m_title}" /></td>
												<td class="allContentInfo-startDate"><c:out
														value="${contents.m_start_date}" /></td>
												<td class="allContentInfo-endDate"><c:out
														value="${contents.m_end_date}" /></td>
												<td class="allContentInfo-place"><c:out
														value="${contents.m_place}" /></td>
												<td class="allContentInfo-link"><c:out
														value="${contents.m_b_link}" /></td>
											</tr>
										</c:forEach>
									</table>
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="type" value="musical">
						</div>
						<div class="concertContentList" style="display: none;">
							<c:choose>
								<c:when test="${empty concertContents }">
									<div class="no-like-message">
										<p class="no-like-message">데이터가 없습니다.</p>
									</div>
								</c:when>
								<c:otherwise>
									<table class="contentList" style="border-collapse: collapse;">
										<tr class="contentManagement">
											<th class="contentChoice"></th>
											<th class="adminTitle">제목</th>
											<th class="adminStartDate">시작일</th>
											<th class="adminEndDate">종료일</th>
											<th class="adminEndDate">장소</th>
											<th class="adminLink">링크</th>
										</tr>
										<c:forEach var="contents" items="${concertContents}">
											<tr class="allContentInfo">
												<td class="checkBtn"><input type="checkbox"
													name="selectedcontents" value="${contents.m_num}"></td>
												<td class="allContentInfoTitle"><c:out
														value="${contents.m_title}" /></td>
												<td class="allContentInfo-startDate"><c:out
														value="${contents.m_start_date}" /></td>
												<td class="allContentInfo-endDate"><c:out
														value="${contents.m_end_date}" /></td>
												<td class="allContentInfo-place"><c:out
														value="${contents.m_place}" /></td>
												<td class="allContentInfo-link"><c:out
														value="${contents.m_b_link}" /></td>
											</tr>
										</c:forEach>
									</table>
								</c:otherwise>
							</c:choose>
						</div>

					</form>
				</div>
			</div>


		</div>
	</div>
	</div>
</body>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(
			function() {
				// 라디오 버튼 변경 이벤트 처리
				$('input[name="contentType"]').change(
						function() {
							var selectedType = $(
									'input[name="contentType"]:checked').val();

							$('.musicalContentList, .concertContentList').css(
									'display', 'none');

							if (selectedType === "musical") {
								$('.musicalContentList')
										.css('display', 'block');
							} else if (selectedType === "concert") {
								$('.concertContentList')
										.css('display', 'block');
							}
						});
			});
</script>






</html>