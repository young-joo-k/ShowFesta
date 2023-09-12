<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
										<th>번호</th>
										<th>제목</th>
										<th>등록일</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="notice">
									<tbody>
									<tr>
												<td>
													<p class = "noti-type"><c:out value="${notice.b_num}" /></p>
												</td>
												<td>
													<span><c:out value="${notice.b_title}" /></span>
												</td>
												<td>
													<p class = "noti-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.updatedate }"/></p>
												</td>			
									</tr>
									</tbody>
								</c:forEach>
							</table>
							<div class="noti-detail-wrap">
							</div>
							<div class="list-btn">
								<a href="#">
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAqCAYAAADFw8lbAAAAAXNSR0IArs4c6QAABGRJREFUWAnNmT9ME1Ecx7mjZSgMENGkNQya4EpIcJMN0GhAYjcZ1DgcJkyUQBcZcAFCmUjkBhEHjAuGYvBPYcNNjHHVRBONbeKfwAAdKFC/3+u742qP9nrS417y7r17997v97nf+3Pv/U6q+s+gqqp/a2vrvCzLwf39/RDEMTIkq6urkwcHB6n6+voviqJkcsXOrpKTZjMzM6e2t7cvS5J0He27EH9ls9kU7pPIMzKEUBZCWRD504iruF+qq6t7MzAw8IcVygllgU5MTNBaY4hhKF0HRBxWiw8NDf0upnRqaqoRlu1B7EWbdtRdRBwdGRnRX6pYc+2ZLVBacGdnJwK4frRSGxoaHqAr0yWlW1TAUAlsbm7exyMF0LO1tbUxOxYuCRqLxVr29vZeAHK1pqZmdHBw8IeF/rKLpqenz+7u7rJ3Ovx+f08kEvlYTEhRUHT1DTRW8ea3hoeHXxYT5PTZ+Pj4NcifR3sFQ+H5UXKOBAXkHVhxDkIuQsDGUQKOoxy91opeew1ZUeh6bCXTElRY8qHP52tDl3y3anjcZYBtymQy32CYsJVl5X8VckyiTAXkFbcgyUBd7D3qFgwsNkIeKGc33moZXX4bDT8YtVzKcIhRNxnIYlabB8olCA/XotHoirmSm3mhe02wGKoNUC7meJt+LkHG0xPKkIEsZNIRDFAUjCGqx7VO6gqcpIJBFUyaCA1UjIcwvzhOBFeijWAJ62NVA+UGA6Zed/pZrAQoWchENsr38YJlgbugOPN2w8LCQtZuXXO9vr4+y7XbXEfPY+u4BNhe3D+VuZ9Epou7IL2CV1KALoOlk4wSFtcLWLdWsCw0ewXQzIGZ/wn33TL2iFwCbO8LzULcyKPrUzw9yMgEMUZTbih1ogNsSR5xfADlQl+2Rd2YTOLFyBYyL/hOXti1Nj6aFtq4aykrlLPMlCW4sDLn0HuZ45PjtPC5N0o4NHnsxoSStTHgDaxCChgySN+AJBwIP0HdXOrYaxbjxmTiMRsz/jMcGGdk4cFIoICfUU8FwZQgo/6t5zf1Jigf2SV1YzKBicZ7RiZteQoEAgnkL9E5wEIvBLJgfLbTBUQeDVR4KhaFB8MLnFWCZVH3opgXfB5BFHowTppUMCjgMI5FBihOgEmYela4WU6UlQxkIZMOYoCygA4rJB10s+gV3E4nJyevArJTsBjq80A5HuiwQsV57APbjFouZbA3bsVMfwLnR7c+NnXVeaAshOOBXjUFDd6hYZNesdIpdQn/kyIY8lQWgPIpfT/4tN5Fww2+ZV6LCtyw9+h3gmg6ySw9epagZIGbcQ7JPcAmKjlmhexXGG50jll68shT8kQIi7bQF4S6a5515PJNGOgE8LxrPIeauwpf0BjuwohvEZfs/mzgBoPfbnRx5X425DAPr7RwOp3ugmI6B5jyrwg/GNyEa4s08jyLcUPOXziNSBO4j7vy+wbKCgL3s3C7nOOxm2CIPDrQ+6KBc2MOuK9iO1nQ3m7BXyxZH4vsix6+AAAAAElFTkSuQmCC" alt>
									<span>목록</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>