<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_list.css?after" rel="stylesheet">
</head>
<body>
	<div id="app">
		<div class="body">
			<main id="contents" class="top-padding">

				<div class="wrap">
					<div class="cs-body">
						<div>

							<div class="cs-table02-wrap">
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
											<th>제목</th>
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
											<td><span><c:out value="${qna.b_title}" /></span></td>
											<td>
												<p class="noti-date">
													<fmt:formatDate pattern="yyyy-MM-dd"
														value="${qna.updatedate }" />
												</p>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="noti-detail-wrap">
									<textarea name='b_content' readonly="readonly"><c:out
											value="${qna.b_content}" /></textarea>
									<button id=listBtn data-oper='list' class="btn btn-info"
										onclick="location.href='/page/qna_list'">목록</button>
								</div>


							</div>

						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script type="text/javascript"">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#b_num").remove();
			operForm.attr("action", "/page/qna_list")
			operForm.submit();
		});
	});
</script>
</html>

