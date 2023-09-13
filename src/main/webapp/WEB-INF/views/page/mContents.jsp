<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<link href="/resources/css/contents.css?after" rel="stylesheet" type="text/css">
<body>
<!-- 유형별 페이지 입니다. 뮤지컬 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 어떤 유형인지 나타냄 -->
<div class = CategoryTop>
	<p class = list-title>뮤지컬</p>
</div>
<!-- 여기서부터 컨텐츠 리스트 입니다. 한 줄에 세 개의 컨텐츠가 들어갑니다. -->
<%-- <c:forEach var = "i" begin ="0" end ="${(musicalContents)-1 }"> --%>
	<div class = all-contents-list>
		<div class = contents-list>
		    <div class="contents">
		    	<div class = list-wrap>
				<!-- 상세페이지로 들어가는 링크 넣기 -->
			      <a style="cursor:pointer;" onclick="#">
			        <div class = list-inner-wrap>
						<!--DB에 저장된 이미지 링크 가져올겁니다 -->
				        <img class ="comImg" src="#">
				        <div class = list-txt>
				        	<p class = "list-tit1">공연이름 넣을거야</p>
				        	<p class = "list-tit2">공연기간 넣을거야</p>
				        	<p class = "list-tit3">공연장소 넣을거야</p>
				        </div>
					</div>
			      </a>
				</div>
		     </div>
		</div>
	<!-- 첫 번째 -->
		<div class = contents-list>
		    <div class="contents">
		    	<div class = list-wrap>
				<!-- 상세페이지로 들어가는 링크 넣기 -->
			      <a style="cursor:pointer;" onclick="#">
			        <div class = list-inner-wrap>
						<!--DB에 저장된 이미지 링크 가져올겁니다 -->
				        <img class ="comImg" src="#">
				        <div class = list-txt>
				        	<p class = "list-tit1">공연이름 넣을거야</p>
				        	<p class = "list-tit2">공연기간 넣을거야</p>
				        	<p class = "list-tit3">공연장소 넣을거야</p>
				        </div>
					</div>
			      </a>
				</div>
		     </div>
		</div>
		<!--두 번째 -->
		
		<div class = contents-list>
		    <div class="contents">
		    	<div class = list-wrap>
				<!-- 상세페이지로 들어가는 링크 넣기 -->
			      <a style="cursor:pointer;" onclick="#">
			        <div class = list-inner-wrap>
						<!--DB에 저장된 이미지 링크 가져올겁니다 -->
				        <img class ="comImg" src="#">
				        <div class = list-txt>
				        	<p class = "list-tit1">공연이름 넣을거야</p>
				        	<p class = "list-tit2">공연기간 넣을거야</p>
				        	<p class = "list-tit3">공연장소 넣을거야</p>
				        </div>
					</div>
			      </a>
				</div>
		     </div>
		</div>
		<!--세 번째 -->
		<div class = contents-list>
		    <div class="contents">
		    	<div class = list-wrap>
				<!-- 상세페이지로 들어가는 링크 넣기 -->
			      <a style="cursor:pointer;" onclick="#">
			        <div class = list-inner-wrap>
						<!--DB에 저장된 이미지 링크 가져올겁니다 -->
				        <img class ="comImg" src="#">
				        <div class = list-txt>
				        	<p class = "list-tit1">공연이름 넣을거야</p>
				        	<p class = "list-tit2">공연기간 넣을거야</p>
				        	<p class = "list-tit3">공연장소 넣을거야</p>
				        </div>
					</div>
			      </a>
				</div>
		     </div>
		</div>
		<!--네 번째 -->
	</div>
	<!--all-contents-list 끝 -->
	
<%-- </c:forEach> --%>
</body>
</html>