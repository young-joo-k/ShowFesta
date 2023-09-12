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
						<form role="form" action="/page/notice_modify" method="post">
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
												<td><input class="form-control" name='b_title'
													value='<c:out value="${notice.b_title}" />'></td>
												<td>
													<p class="noti-date">
														<fmt:formatDate pattern="yyyy-MM-dd"
															value="${notice.updatedate }" />
													</p>
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" class="form-control" name='b_num'
										value='<c:out
											value="${notice.b_num}" />'>
									<input class="form-control" name='b_content'
										value='<c:out
											value="${notice.b_content}" />'>

									<button type="submit"  data-oper='modify'
										class="btn btn-default">수정</button>
									<button type="submit"  data-oper='remove'
										class="btn btn-danger">삭제</button>
									<button type="submit"  data-oper='list'
										class="btn btn-info">목록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);

			 if (operation === 'modify') {
		            formObj.attr("action", "/page/notice_modify"); // 수정 처리 서블릿 또는 컨트롤러 URL로 변경
		        } else if (operation === 'remove') {
		        	formObj.attr("action", "/page/notice_remove"); // 삭제 처리 서블릿 또는 컨트롤러 URL로 변경
		        } else if (operation === 'list') {
		            self.location = "/page/notice_list";
		            return;
		        }
			formObj.submit();
		});
	});
</script>
</html>

