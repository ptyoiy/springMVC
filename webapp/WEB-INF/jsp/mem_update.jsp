<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to Sample!!</title>

<link type="text/css" href="/css/bootstrap-3.3.6/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/css/bootstrap-3.3.6/dashboard.css" rel="stylesheet" />

<link type="text/css" href="/css/jquery-ui-11.4/jquery-ui.css" rel="stylesheet" />

<script type="text/javascript" src="/js/jquery-2.2.4.js"></script>
<script type="text/javascript" src="/js/jquery-ui-11.4.js"></script>

<script type="text/javascript" src="/js/bootstrap-3.3.6/bootstrap-3.3.6.js"></script>

</head>
<body>

<script type="text/javascript">
$(document).ready(function () {

	$(".btn-success").click(function(){
		$.ajax({
			url : "/mem_update_data",
			type : "POST",
			data : $("#memForm").serialize(),
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			beforeSend : function() {
				if (!confirm("수정하시겠습니까?")) {
					return false;
				}
			},
			success : function(data) {
				alert("수정이 완료되었습니다.");
				location.href="/mem_list";
			},
			error: function(xhr, option, error) {
				alert(error);
			}
		});
	});



	$(".btn-primary").click(function(){
		location.href="/mem_list";
	});
});
</script>

<div class="container">
<form id="memForm" name="memForm">
<input type="hidden" id="memId" name="memId" value="${param.memId }">
	<h3>회원변경</h3><br>
	<div class="form-group row">
	  <div class="col-xs-2">
	    <label for="ex1">회원명 : ${member.memName }</label>
	  </div>
	  <div class="col-xs-3">
	    <label for="ex2">회원아이디 : ${member.memId }</label>
	  </div>
	  <div class="col-xs-3">
	    <label for="ex2">회원이메일</label>
	    <input class="form-control" id="memEmail" name="memEmail" type="text" value="${member.memEmail }">
	  </div>
	  <div class="col-xs-3">
	    <label for="ex3">회원비밀번호</label>
	    <input class="form-control" id="memPassword" name="memPassword" type="password" value="${member.memPassword }">
	  </div>
	</div>
</form>
</div>
<div style="text-align: center;">
	<button type="button" class="btn btn-success">수정</button>
	<button type="button" class="btn btn-primary">목록</button>
</div>

</body>
</html>