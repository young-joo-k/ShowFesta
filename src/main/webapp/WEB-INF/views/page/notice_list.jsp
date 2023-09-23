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
					<div class="cs-body">
						<ul id="contents" class="cs-1depth">
							<li class="customer-1depth-on"><a href="/page/notice_list"
								aria-current="page"
								class="router-link-exact-active router-link-active">공지사항</a></li>
							<li class="customer-1depth-off"><a href="/page/user_qna"
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
									<c:forEach items="${list}" var="notice">
										<tbody>
											<tr>
												<td>
													<p class="noti-type">
														<c:out value="${notice.b_num}" />
													</p>
												</td>
												<td><span><a
														href='/page/notice_get?b_num=<c:out value="${notice.b_num }"/>'>
															<c:out value="${notice.b_title}" />
													</a></span></td>
												<td>
													<p class="noti-date">
														<fmt:formatDate pattern="yyyy-MM-dd"
															value="${notice.updatedate }" />
													</p>
												</td>
											</tr>

										</tbody>
									</c:forEach>

								</table>
							</div>
							<%
							String id = (String) session.getAttribute("id");
							%>

							<button id='regBtn' type="button" class="btn btn-xs pull-right"
								<%if ("admin".equals(id)) {%> style="display: block;"
								<%} else {%> style="display: none;" <%}%>>공지사항 등록</button>
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
						</div>
					</div>
			</main>
		</div>
	</div>
</body>
<form id='actionForm' action="/page/notice_list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);
				history.replaceState({}, null, null);
				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + " 번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
				$("#regBtn").on("click", function() {
					self.location = "/page/notice_register";
				});
				var actionForm = $("#actionForm");
				$(".paginate_button a").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();
						});

			});
</script>
</html>

