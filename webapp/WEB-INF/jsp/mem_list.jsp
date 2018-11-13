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
		location.href="/mem_write";
	});

	$(".btn-danger").click(function(){
		$.ajax({
			url : "/mem_delete",
			type : "POST",
			data : {"memId" : this.id},
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			beforeSend : function() {
				if (!confirm("삭제하시겠습니까?")) {
					return false;
				}
			},
			success : function(data) {
				alert("삭제가 완료되었습니다." + data);
				location.href="/mem_list";
			},
			error: function(xhr, option, error) {
				alert(error);
			}
		});
	});
});
</script>

<div class="container">
	<h3>회원목록</h3>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>No</th>
        <th>회원아이디</th>
        <th>회원명</th>
        <th>이메일</th>
        <th>등록일</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
<c:if test="${fn:length(member) == 0}">
		<tr>
			<td colspan="6">해당데이터가 없습니다.</td>
		</tr>
</c:if>
<c:if test="${fn:length(member) > 0}">
	<c:forEach var="list" items="${member}" varStatus="status">
      <tr>
        <td class="col-md-1">${status.count }</td>
        <td class="col-md-4"><a href="/mem_update?memId=${list.memId }">${list.memId }</a></td>
        <td class="col-md-2">${list.memName }</td>
        <td class="col-md-2">${list.memEmail }</td>
        <td class="col-md-2">${list.registDate }</td>
        <td class="col-md-1">
			<button type="button" class="btn btn-danger btn-xs" id="${list.memId }">삭제</button>
        </td>
      </tr>
	</c:forEach>
</c:if>
    </tbody>
  </table>
</div>

<div style="text-align: center;">
  <button type="button" class="btn btn-primary">회원가입</button>
</div>

</body>
</html>