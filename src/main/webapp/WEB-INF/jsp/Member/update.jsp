<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="{%static 'css/bootstrap.css'%}">
<link rel="stylesheet" href="{%static 'css/custom.min.css'%}">
<link rel="stylesheet" href="{%static 'css/font-awesome.min.css'%}">
<link rel="stylesheet" href="{%static 'css/prism-okaidia.css'%}">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

<h2>회원 정보 수정</h2>


<c:choose>
<c:when test="${empty member.id}">
	<script>alert("로그인이 필요합니다.");
			location.href='login';
	</script>
</c:when>
<c:otherwise>
	<form id="updateForm" action="update" method="post"onsubmit="return confirm('수정하시겠습니까?');">
		<table class="table table-hover">
			<tr><td>아이디: ${member.id }</td></tr>
			<tr><td>이름: <p class="text-danger" id="nameCheck"></p> <input type="text" class="form-control" name="name" id="name" value="${member.name }"/></td></tr>
			<tr><td>이메일: <input type="email" class="form-control" name="email" value="${member.email}"/>
			<tr><td>주소: <input type="text" class="form-control" name="address" value="${member.address} "></td></tr>	
	 		<tr><td>전화번호: <input type="text" class="form-control" name="mobile" value="${member.mobile }"  ></td></tr>
		</table>
		<button class="btn btn-primary" type="submit" >수정</button>
</form>
</c:otherwise>
</c:choose>

<script>
$(document).ready(function(){
	$('#updateForm').submit(function(){
		if($('#name').val()==""){
			$('#nameCheck').text("이름을 입력해주세요");
			$('#nameCheck').focus();
			return false;
		}
		alert('회원정보가 수정되었습니다.');
	});
});
</script>

</body>
</html>