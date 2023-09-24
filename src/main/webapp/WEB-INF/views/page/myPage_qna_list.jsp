<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_list.css?after" rel="stylesheet">
</head>
<!-- <body> -->
	<div >
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
					<c:choose>
						<c:when test= "${empty list }">
							<tr class = "no-data">
								<td colspan="3" class="no-data-message">
									<p class="no-data-message">1:1문의가 없습니다.</p>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="qna">
								<tbody>
									<tr>
										<td>
											<p class="noti-type">
												<c:out value="${qna.b_num}" />
											</p>
										</td>
										<td><span><a href='/page/qna_get?b_num=<c:out value="${qna.b_num }"/>'>
									<c:out value="${qna.b_title}"/></a></span>
									<p style="float:right;">답변 완료</p></td>
										<td>
											<p class="noti-date">
												<fmt:formatDate pattern="yyyy-MM-dd"
													value="${qna.updatedate }" />
											</p>
										</td>
									</tr>
			
								</tbody>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage }">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a href="${ pageMaker.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
<form id= 'actionForm' action="/page/qna_list" method='get'>
	<input type='hidden'  name='pageNum' value = '${pageMaker.cri.pageNum}'>
	<input type='hidden'  name='amount' value = '${pageMaker.cri.amount}'>
</form>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#regBtn").on("click", function() {
					self.location = "/page/qna_register";
				});
				var actionForm = $("#actionForm");
				$(".paginate_button a").on("click", function(e) {
					e.preventDefault();
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();				
				});
			});

</script>
</html>

