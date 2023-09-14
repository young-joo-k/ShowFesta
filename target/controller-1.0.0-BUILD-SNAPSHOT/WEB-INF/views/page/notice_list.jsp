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
				<div class="page-top">
					<div class="page-top-inner-wrap">
						<h1 tabindex="0" class="page-title">고객센터</h1>
					</div>
				</div>
				<div class="wrap">
					<div class="cs-body">
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
									<c:forEach items="${list}" var="notice">
										<tbody>
											<tr>
												<td>
													<p class="noti-type">
														<c:out value="${notice.b_num}" />
													</p>
												</td>
												<td><span><a href='/page/notice_get?b_num=<c:out value="${notice.b_num }"/>'>
											<c:out value="${notice.b_title}"/></a></span></td>
												<td>
													<p class="noti-date">
														<fmt:formatDate pattern="yyyy-MM-dd"
															value="${notice.updatedate }" />
													</p>
												</td>
											</tr>
<%-- 										<tr>
											<td><c:out value="${notice.b_num}"/></td>
											<td><a href='/page/get?bno=<c:out value="${notice_b_num }"/>'>
											<c:out value="${notice.b_title}"/></a></td>
											<td><c:out value="${board.writer}"/></td>
											<td><fmt:formatDate pattern = "yyy-MM-dd" value = "${notice.b_num }"/></td>
											<td><fmt:formatDate pattern = "yyy-MM-dd" value = "${notice.updateDate}"/>
											</td>
											</tr> --%>
										</tbody>
									</c:forEach>

								</table>
							</div>
							<!-- 												모달
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button"class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>								
									</div>
								</div>
							</div>
						</div> -->
							<button id='regBtn' type="button" class="btn btn-xs pull right">공지사항
								등록</button>
							<div class="paging-type02">
								<a href="#" class="on">1</a> <a href="#" class>2</a> <a href="#"
									class>3</a> <a href="#" class>4</a> <a href="#" class>5</a> <a
									href="#" class>6</a> <a href="#" class>7</a> <a href="#" class>8</a>
								<a href="#" class>9</a> <a href="#" class>10</a> <a
									id="next-page" href="#" class="arrow"> <img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAAAXNSR0IArs4c6QAAAPBJREFUSA1jYBgFoyEwMkJg+fLlCuT6lIlYjf///w9bs2aNKrHqkdURbcm/f/+W/fr1K3DZsmXayAYQw2YkRhFMzcaNG8W/fPkSy8TEtDcyMvI8TJwQTbRPQAb5+/u/ZGRkXAAMOkdgHJkTMhwmT5IlIE1RUVFvODk55wGDzxNmCCGaZEtABn779s0EGGTfCRkOk2eBMYihgcHEuGrVKs+/f//K8vDwTCZGD0gN0REPtIAJGA9+QFpYSkpqqaOj4w9iLWEmVqGmpmY4MB641NXVl1pbW/8iVh9IHUnBBfTBMhMTkz+kWDCqdjQEhkEIAADVzUfIdyQB3wAAAABJRU5ErkJggg=="
									alt="다음 10개 페이지">
								</a>
							</div>


						</div>
					</div>
			</main>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);
				history.replaceState({},null,null);
				function checkModal(result) {
					if (result === ''|| history.state) {
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
			});
</script>
</html>

