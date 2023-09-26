<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/noticeheader.jsp"%>
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
					<div class="cs-body" style="border-radius: 18px;">
						<ul id="contents" class="cs-1depth">
							<li class="customer-1depth-on"><a href="/page/notice_list"
								aria-current="page"
								class="router-link-exact-active router-link-active">공지사항</a></li>
							<li class="customer-1depth"><a href="/page/user_qna"
								aria-current="page"
								class="router-link-exact-active router-link-active">1:1 문의</a></li>
						</ul>
						<div>
							<ul class="cs-2depth">
								<li class="cs-2depth-on">
									<button>전체</button>
								</li>
							</ul>
							<div class="cs-table02-wrap">
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
													<c:out value="${notice.b_num}" />
												</p>
											</td>
											<td><span><c:out value="${notice.b_title}" /></span></td>
											<td>
												<p class="noti-date">
													<fmt:formatDate pattern="yyyy-MM-dd"
														value="${notice.updatedate }" />
												</p>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="noti-detail-wrap">
									<textarea name='b_content' readonly="readonly"><c:out
											value="${notice.b_content}" /></textarea>
								</div>
							
								<button id=listBtn data-oper='list' class="btn btn-info"
									onclick="location.href='/page/notice_list'">목록</button>
								<form action="/page/notice_modify" method="get">
									<input type='hidden' id='b_num' name='b_num'
										value='<c:out value="${notice.b_num}"/>'>
								</form>
							</div>

						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<footer>
	<%@include file="../includes/footer.jsp"%>
</footer>
<script type="text/javascript"">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']")
		on("click", function(e) {
			operForm.attr("action", "/page/notice_modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#b_num").remove();
			operForm.attr("action", "/page/notice_list")
			operForm.submit();
		});
	});
</script>
</html>

