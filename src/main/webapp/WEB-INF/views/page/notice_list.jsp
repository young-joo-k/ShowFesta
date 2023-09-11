<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_list.css?after" rel="stylesheet">
<title>Insert title here</title>
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
						<li class="customer-1depth-on">
							<a href="/page/notice_list" aria-current="page" class="router-link-exact-active router-link-active">공지사항</a>
						</li> 
						<li class="customer-1depth">
							<a href="/page/user_qna" aria-current="page" class="router-link-exact-active router-link-active">1:1 문의</a>
						</li> 
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
									<col style="width:139px;">
								</colgroup>
								<thead>
									<tr>
										<th>구분</th>
										<th>제목</th>
										<th>등록일</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="notice">
								<tbody>
									<tr class>
												<td class = "noti-type"><c:out value="${notice.b_num}" /></td>
												<td class = "noti-type"><c:out value="${notice.b_title}" /></td>
												<td class = "noti-type"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.b_updatedate }"/></td>			
									</tr>
								</tbody>
								</c:forEach>
							</table>
						</div>
						<div class="paging-type02">
							<a href="#" class="on">1</a>
							<a href="#" class>2</a>
							<a href="#" class>3</a>
							<a href="#" class>4</a>
							<a href="#" class>5</a>
							<a href="#" class>6</a>
							<a href="#" class>7</a>
							<a href="#" class>8</a>
							<a href="#" class>9</a>
							<a href="#" class>10</a>
							<a id="next-page" href="#" class="arrow">
								<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAAAXNSR0IArs4c6QAAAPBJREFUSA1jYBgFoyEwMkJg+fLlCuT6lIlYjf///w9bs2aNKrHqkdURbcm/f/+W/fr1K3DZsmXayAYQw2YkRhFMzcaNG8W/fPkSy8TEtDcyMvI8TJwQTbRPQAb5+/u/ZGRkXAAMOkdgHJkTMhwmT5IlIE1RUVFvODk55wGDzxNmCCGaZEtABn779s0EGGTfCRkOk2eBMYihgcHEuGrVKs+/f//K8vDwTCZGD0gN0REPtIAJGA9+QFpYSkpqqaOj4w9iLWEmVqGmpmY4MB641NXVl1pbW/8iVh9IHUnBBfTBMhMTkz+kWDCqdjQEhkEIAADVzUfIdyQB3wAAAABJRU5ErkJggg==" alt="다음 10개 페이지">
							</a>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>