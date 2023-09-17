<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<link href="/resources/css/common.css?after" rel="stylesheet"
	type="text/css">
<link href="/resources/css/goods.css?after" rel="stylesheet"
	type="text/css">
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="container">
	<main id="main">
		<section class="infoSection">
			<div class="content" style="">
				<div class="productWrapper">
					<div class="productMain">
						<div class="productMainTop">
							<div class="summary">
								<div class="summaryTop">
									<h2 class="prdTitle">${festival.m_title }</h2>
								</div>
								<div class="summaryBody">
									<div class="posterBox">
										<img class="posterBoxImage" src="/resources/img/festival/${festival.m_title}.jpg"
											alt="${festival.m_title }">
										<c:set var="contentsName" value="${festival.m_title}" />
										<c:set var="list" value="${likeList }" />
										<a
											class="likeBtn ${fn:contains(list, contentsName) ? 'is-toggled' : ''}"
											data-toggle="self" data-toast="like" aria-checked="false"
											aria-label="즐겨찾기 등록" role="checkbox" href="#"
											data-popup-hover="like"
											data-contents-name="${festival.m_title } " data-type="콘서트"
											data-user-id="${user.id }" data-img="/resources/img/festival/${festival.m_title}.jpg"
											<c:if test="${empty user}">
										        data-empty-user="true"				
										    </c:if>></a>
									</div>
									<div>
										<ul class="info">
											<li class="infoItem"><strong class="infoLabel">제목</strong>
												<div class="infoDesc">
													<p class="infoText">${festival.m_title }</p>
												</div></li>
											<li class="infoItem"><strong class="infoLabel">장소</strong>
												<div class="infoDesc">
													<p class="infoText">${festival.m_place }</p>
												</div></li>
											<li class="infoItem"><strong class="infoLabel">축제기간</strong>
												<div class="infoDesc">
													<p class="infoText">${festival.m_start_date }~
														${festival.m_end_date }</p>
												</div></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="topButtonWrapper ">
				<a href="#" class="topButton"><span class="blind">맨 위로</span></a>
			</div>
		</section>
	</main>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// JavaScript 부분
	$(document).ready(function() {
		// contentToggleBtn를 클릭했을 때 동작하는 함수
		$(".contentToggleBtn").on("click", function(e) {
			e.preventDefault();
			toggleContent();
		});

		// likeBtn를 클릭했을 때 동작하는 함수
		$(".likeBtn").on("click", function(e) {
		    e.preventDefault();
		    var likeBtn = $(this);
		    if (checkUser(likeBtn) === "true") {
		    	window.location.href = "/join/login";
		    } 
		    else {
			    togglelikeBtn(likeBtn);
		    }
		});
		function checkUser(check){
			return check.attr("data-empty-user");
		}

		function togglelikeBtn(likeBtn) {
	    	var contentsName = likeBtn.attr("data-contents-name");
	    	var userId = likeBtn.attr("data-user-id");
	    	var type = likeBtn.attr("data-type");
	    	var img = likeBtn.attr("data-img");
			// castingHeartBtn 토글
			if (likeBtn.hasClass("is-toggled")) {
				likeBtn.removeClass("is-toggled");
		        $.ajax({
		            type: "GET",
		            url: "/like/delete",
		            data: {
		                like_name: contentsName,
		                id: userId,
		                like_type: type,
		                like_img:img
		            },
		            success: function() {
		                console.log("성공 ");
		            },
		            error: function() {
		                console.log("실패: ");
		            }
		        });				
			} else {
				likeBtn.addClass("is-toggled");
		        $.ajax({
		            type: "GET",
		            url: "/like/insert",
		            data: {
		                like_name: contentsName,
		                id: userId,
		                like_type: type,
		                like_img:img
		            },
		            success: function() {
		                console.log("성공 ");
		            },
		            error: function() {
		                console.log("실패: ");
		            }
		        });
			}
		}
	});
</script>
