<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<link href="/resources/css/common.css?after" rel="stylesheet"
	type="text/css">
<link href="/resources/css/N_goods.css?after" rel="stylesheet"
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
									<h2 class="prdTitle">${concert.m_title }</h2>
								</div>
								<div class="summaryBody">
									<div class="posterBox">
										<img class="posterBoxImage" src="${concert.m_img}"
											alt="${concert.m_title }">
										<c:set var="contentsName" value="${concert.m_title}" />
										<c:set var="list" value="${likeList }" />
										<a
											class="likeBtn ${fn:contains(list, contentsName) ? 'is-toggled' : ''}"
											data-toggle="self" data-toast="like" aria-checked="false"
											aria-label="즐겨찾기 등록" role="checkbox" href="#"
											data-popup-hover="like"
											data-contents-name="${concert.m_title } " data-type="concert"
											data-user-id="${user.id }" data-img="${concert.m_img }"
											data-num = "${concert.m_num }"
											<c:if test="${empty user}">
										        data-empty-user="true"				
										    </c:if>>좋아요</a>
									</div>
									<div>
										<ul class="info">
											<li class="infoItem"><strong class="infoLabel">제목</strong>
												<div class="infoDesc">
													<p class="infoText">${concert.m_title }</p>
												</div></li>
											<li class="infoItem"><strong class="infoLabel">장소</strong>
												<div class="infoDesc">
													<p class="infoText">${concert.m_place }</p>
												</div></li>
											<li class="infoItem"><strong class="infoLabel">공연기간</strong>
												<div class="infoDesc">
													<p class="infoText">${concert.m_start_date }~
														${concert.m_end_date }</p>
												</div></li>
											<li class="infoItem"><strong class="infoLabel">가격정보</strong>
												<div class="infoDesc">
													<c:forEach var="price" items="${priceList}">
														<p class="infoText">${price.p_name } <span style="color: red">${price.p_price }</span>원</p>
													</c:forEach>
												</div></li>														
										</ul>
										<div class="bookBtn">
											<a class="sideBtn is-primary" href="${concert.m_b_link }"
												data-check="false"><span>예매하기</span></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="productMainBody" class="productMainBody">
							<nav class="content">
								<div class="navInfo" style="">
									<div class="stickyWrap">
										<ul class="navList">
											<li class="navItem" style=>공연정보</li>
										</ul>
									</div>
								</div>
							</nav>
							<div>
								<div class="prdContents detail">
									<div class="content description">
										<h3 class="contentTitle">공연상세</h3>
										<div class="contentDetail">
											<c:forEach var="img" items="${ImgList}">
												<p>
													<strong><img src="${img.info_img}" alt=""
														border="0"></strong>
												</p>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// JavaScript 부분
	$(document).ready(function() {
		$(".navItem").on("click", function(e) {
			e.preventDefault();

			$(".navItem").removeClass("is-active");

			$(this).addClass("is-active");

		});
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
		function toggleContent() {
			// 여닫기 상태를 토글
			var expandableWrap = document.querySelector(".expandableWrap");
			var isToggled = expandableWrap.classList.contains("is-toggled");
			if (isToggled) {
				expandableWrap.classList.remove("is-toggled");
			} else {
				expandableWrap.classList.add("is-toggled");
			}
		}


		function togglelikeBtn(likeBtn) {
	    	var contentsName = likeBtn.attr("data-contents-name");
	    	var userId = likeBtn.attr("data-user-id");
	    	var type = likeBtn.attr("data-type");
	    	var img = likeBtn.attr("data-img");
	    	var num = likeBtn.attr("data-num");
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
		                like_img:img,
		                m_num:num
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
		                like_img:img,
		                m_num:num
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
