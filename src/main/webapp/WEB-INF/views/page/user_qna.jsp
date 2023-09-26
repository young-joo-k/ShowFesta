<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/noticeheader.jsp"%>


<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_list.css?after" rel="stylesheet">
<link href="/resources/css/user_qna.css?after" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div id="app">
		<div class="body">
			<main id="contents" class="top-padding">

				<div class="wrap">
					<div class="cs-body" style="border-radius: 18px;">
						<ul id="contents" class="cs-1depth">
							<li class="customer-1depth-off"><a href="/page/notice_list"
								aria-current="page"
								class="router-link-exact-active router-link-active">공지사항</a></li>
							<li class="customer-1depth-on"><a href="/page/user_qna"
								aria-current="page"
								class="router-link-exact-active router-link-active">1:1 문의</a></li>
						</ul>
						<div class="mypooq-inner-wrap">
							<section>
								<div class="wrap">
									<div class="my-user-qna-info">
										<span tabindex="0" class="cs-number">043-249-1852~8</span>
										<div>
											<a href="/page/qna_register" class=qnaBtn>1:1 문의하기</a>
										</div>
										<ul tabindex="0" class="cs-meta-list">
											<li>"평일 09:00~18:00 *점심시간 12:30~13:30"</li>
											<li>주말 및 공휴일 휴무</li>
										</ul>
										<p>
											"ShowFesta 이용 시 불편하면 전화하거나 1:1 문의해 주세요." <br> "최대한 빠르게
											처리해 드리겠습니다."
										</p>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
</html>