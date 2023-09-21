<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/contents.css?after" rel="stylesheet" type="text/css">
<body class = "genreContents">
<!-- 유형별 페이지 입니다. -->
<!-- 어떤 유형인지 나타냄 -->
<div class = categoryTop>
	<p class = list-title>페스티벌</p>
</div>
<!-- 여기서부터 컨텐츠 리스트 입니다. 한 줄에 네 개의 컨텐츠가 들어갑니다. -->
<div class = all-contents-list>
	<c:choose>
		<c:when test="${empty festaContents }">
			<div class = "no-data-message">
				<p class = "no-message">표시할 내용이 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var = "content" items = "${festaContents}" varStatus="loop">
				<div class = contents-list>
				    <div class="contents">
				    	<div class = list-wrap>
						<!-- 상세페이지로 들어가는 링크 넣기 -->
					      <a style="cursor:pointer;" href='#'>
					        <div class = list-inner-wrap>
								<!--DB에 저장된 이미지 링크 가져올겁니다 -->
						        <img class ="comImg" src= <c:out value = "${content.f_img}"/>>
						        <div class = list-txt>
									<div class = "list-tit1">${content.f_title}</div>
									<div class = "list-tit2">
   										 <p class="dateDate">${content.f_s_date}&nbsp;~&nbsp;</p>
   										 <p class="dateDate"> ${content.f_e_date}</p>
									</div>
						        </div>
							</div>
					      </a>
						</div>
				     </div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<div class="clear"></div>

	<!--all-contents-list 끝 -->

</body>
</html>