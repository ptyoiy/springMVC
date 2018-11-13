<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
.table th,td {
   text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	$(".btn-primary").click(function(){
		location.href="/write";
	});

	$(".btn-danger").click(function(){
		$.ajax({
			url : "/board_delete",
			type : "POST",
			data : {"boardSeqno" : this.id},
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			beforeSend : function() {
				if (!confirm("삭제하시겠습니까?")) {
					return false;
				}
			},
			success : function(data) {
				alert("삭제가 완료되었습니다." + data);
				location.href="/";
			},
			error: function(xhr, option, error) {
				alert(error);
			}
		});
	});
});
</script>

<div class="container">
	<form id="boardForm" name="boardForm">
		<input type="hidden" id="boardMenu" name="boardMenu" value="">
	</form>
	<h3>게시판</h3>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>No</th>
        <th>제목</th>
        <th>작성자</th>
        <th>아이디</th>
        <th>작성일</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
<c:if test="${fn:length(board) == 0}">
		<tr>
			<td colspan="6">해당데이터가 없습니다.</td>
		</tr>
</c:if>
<c:if test="${fn:length(board) > 0}">
	<c:forEach var="list" items="${board}" varStatus="status">
      <tr>
        <td class="col-md-1">${status.count }</td>
        <td class="col-md-4"><a href="/update?boardSeqno=${list.boardSeqno }">${list.boardSubject }</a></td>
        <td class="col-md-2">${list.boardWriter }</td>
        <td class="col-md-2">${list.registId }</td>
        <td class="col-md-2">${list.registDate }</td>
        <td class="col-md-1">
			<button type="button" class="btn btn-danger btn-xs" id="${list.boardSeqno }">삭제</button>
        </td>
      </tr>
	</c:forEach>
</c:if>
    </tbody>
  </table>
</div>

<div style="text-align: center;">
  <button type="button" class="btn btn-primary">글쓰기</button>
</div>

</body>
</html>