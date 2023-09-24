<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_list.css?after" rel="stylesheet">
<link href="/resources/css/notice_register.css?after" rel="stylesheet">
</head>
<body>
	<div class="cs-table02-wrap"
		style="margin-left: 450px; margin-top: 200px;">
		<ul class="cs-2depth">
			<li class="cs-2depth-on">
				<button>전체</button>
			</li>
		</ul>
		<table class="cs-table-02">
			<caption>공지사항 리스트</caption>
			<colgroup>
				<col style="width: 139px;">
				<col>
				<col style="width: 139px;">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<p class="noti-type">
							<c:out value="${qna.b_num}" />
						</p>
					</td>
					<td>
						<p class="noti-type">
							<c:out value="${qna.id}" />
						</p>
					</td>
					<td><c:out value="${qna.b_title}" /></td>
					<td><c:out value="${qna.b_content }" /></td>
					<td>
						<p class="noti-date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${qna.updatedate }" />
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 					댓글부분 -->
		<c:choose>
			<c:when test='${user.id eq "admin" }'>
				<form id='actionForm' action="/page/qna_get" method='post'>
					<tr>
						<td>답변</td>
						<td>
							<button type="submit">답글 등록</button> <input type="text"
							name="commentText" value="${qna.reply }">
						</td>
						<input type='hidden' name='b_num' value='${qna.b_num}'>
					</tr>
				</form>

			</c:when>
			<c:otherwise>
				<div class="nomal user">
					<div style="display: flex; margin-top: 20px;">
						<div style="margin-left: 48px;">답변</div>
						<div style="margin-left: 120px;">${qna.reply}</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<div class='pull-right'>
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage }">
				<li
					class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }"><a
					href="${num}">${num}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${ pageMaker.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
<form id='actionForm' action="/page/qna_list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

</html>

