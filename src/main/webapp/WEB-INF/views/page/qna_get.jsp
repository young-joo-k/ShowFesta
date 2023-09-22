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

				<div class="wrap">
					<div class="cs-body">
						<div>

							<div class="cs-table02-wrap">
								<ul class="cs-2depth">
									<li class="cs-2depth-on">
										<button>전체</button>
									</li>
								</ul>
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
													<c:out value="${qna.b_num}" />
												</p>
											</td>
											<td><span><c:out value="${qna.b_title}" /></span></td>
											<td>
												<p class="noti-date">
													<fmt:formatDate pattern="yyyy-MM-dd"
														value="${qna.updatedate }" />
												</p>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="noti-detail-wrap">
									<textarea name='b_content' readonly="readonly"><c:out
											value="${qna.b_content}" /></textarea>
									<div>
										<i>답변</i>
									</div>
									<div class="panel-body">
										<ul class="chat">
											<li class="left clearfix" data-rno='12'>
												<div>
													<strong class="primary-font"> user00 </strong> <small
														class="pull-right text-muted"> 2018-01-01 13:13 </small>
												</div>
												<p>Good job!</p>
										</ul>
										<i class="fa fa-comments fa-fw"></i> Reply<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>답변 작성</button>
									</div>
									<button id=listBtn data-oper='list' class="btn btn-info"
										onclick="location.href='/page/qna_list'">목록</button>
								</div>


							</div>

						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>답변 내용</label>
						<input class="form-control" name='reply' value='New Reply!!!'>
					</div>
										<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name='replyer'>
					</div>
										<div class="form-group">
						<label>작성일</label>
						<input class="form-control" name='replyDate'>
					</div>
					<div class="modal-footer">
					
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
					<button id='modalRegisterBtn' type="button"class='btn btn-plus' data-dismiss='modal'>등록</button>
					<button id='modalCloseBtn' type="button" class='btn btn-default' data-dismiss='modal'>취소</button>
					
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function() {

    var operForm = $("#operForm");

    $("button[data-oper='list']").on("click", function(e) {
        operForm.find("#b_num").remove();
        operForm.attr("action", "/page/qna_list");
        operForm.submit();
    });

    $("button[data-oper='modify']").on("click", function(e) {
        operForm.attr("action", "/page/notice_modify").submit();
    });

    var b_numValue = '<c:out value="${qna.b_num}"/>';
    var replyUL = $(".chat");

    showList(1);

    function showList(page) {
        replyService.getList({ b_num: b_numValue, page: page || 1 }, function(list) {
            var str = "";

            if (list == null || list.length == 0) {
                replyUL.html("");
                return;
            }

            for (var i = 0, len = list.length || 0; i < len; i++) {
                str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
                str += "<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</Strong>";
                str += " <small class='pull-right text-muted'>" + list[i].replyDate + "</small></div>";
                str += " <p>" + list[i].reply + "</p></div></li>";
            }

            replyUL.html(str);
        });
    }
    
  var modal = $(".modal");
  var modalInputReply = modal.find("input[name='reply']");
  var modalInputReplyer = modal.find("input[name='replyer']");
  
  var modalRegisterBtn = $("#modalRegisterBtn");
  
  $("#addReplyBtn").on("click", function(e){
	  modal.find("input").val("");
	  modal.find("button[id !='modalCloseBtn']").hide();
	  
	  modalRegisterBtn.show();
	  
	  $(".modal").modal("show");
  });
});
</script>
</html>

