<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to Sample!!</title>

<link type="text/css" href="/resources/css/bootstrap-3.3.6/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/resources/css/bootstrap-3.3.6/dashboard.css" rel="stylesheet" />

<link type="text/css" href="/resources/css/jquery-ui-11.4/jquery-ui.css" rel="stylesheet" />

<script type="text/javascript" src="/resources/js/jquery-2.2.4.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-11.4.js"></script>

<script type="text/javascript" src="/resources/js/bootstrap-3.3.6/bootstrap-3.3.6.js"></script>

</head>
<body>

<script type="text/javascript">
$(document).ready(function () {

	$(".btn-success").click(function(){
		$.ajax({
			url : "/board_update",
			type : "POST",
			data : $("#boardForm").serialize(),
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			beforeSend : function() {
				if (!confirm("수정하시겠습니까?")) {
					return false;
				}
			},
			success : function(data) {
				alert("수정이 완료되었습니다.");
				location.href="/";
			},
			error: function(xhr, option, error) {
				alert(error);
			}
		});
	});



	$(".btn-primary").click(function(){
		location.href="/";
	});
});
</script>

<div class="container">
<form id="boardForm" name="boardForm">
<input type="hidden" id="boardSeqno" name="boardSeqno" value="${param.boardSeqno }">
	<h3>글수정</h3>
	<div class="form-group row">
	  <div class="col-xs-2">
	    <label for="ex1">작성자</label>
	    <input class="form-control" id="boardWriter" name="boardWriter" type="text" value="${board.boardWriter }">
	  </div>
	  <div class="col-xs-3">
	    <label for="ex2">작성자ID</label>
	    <input class="form-control" id="registId" name="registId" type="text" value="${board.registId }">
	  </div>
	  <div class="col-xs-3">
	    <label for="ex3">작성일</label>
	    <input class="form-control" id="registDate" name="registDate" type="text" value="${board.registDate }">
	  </div>
	</div>
	<div class="form-group">
	  <label for="pwd">제목:</label>
	  <input type="text" class="form-control" id="boardSubject" name="boardSubject" value="${board.boardSubject }">
	</div>
	<div class="form-group">
	  <label for="comment">본문내용:</label>
	  <textarea class="form-control" rows="5" id="boardContent" name="boardContent">${board.boardContent }</textarea>
	</div>
</form>
</div>
<div style="text-align: center;">
	<button type="button" class="btn btn-success">수정</button>
	<button type="button" class="btn btn-primary">목록</button>
</div>

</body>
</html>