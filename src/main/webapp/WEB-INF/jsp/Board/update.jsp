<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="{%static 'css/bootstrap.css'%}">
<link rel="stylesheet" href="{%static 'css/custom.min.css'%}">
<link rel="stylesheet" href="{%static 'css/font-awesome.min.css'%}">
<link rel="stylesheet" href="{%static 'css/prism-okaidia.css'%}">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>


<c:if test="${empty member.id}">
		<script>
			alert('로그인 후에 이용할 수 있습니다. ');
			location.href='/member/login';
		</script>
</c:if>

<form id="updateForm" action="update" method="post">
<input type="hidden" name="idx" value="${dto.idx}">
	<table class="table table-hover">
	<tr><td>제목:<input type="text" class="form-control" name="title" id="title" value="${dto.title }"/></td>
	<tr>
		<td>작성자: ${dto.writer }</td>
	<tr>
		<td>날짜: <fmt:formatDate value="${dto.wdate}" pattern="ayyyy-mm-dd HH:mm"/></td>
	</tr>
	<tr> 
		<td>조회수: ${dto.hit}</td>
	</tr>
	<tr>
		<td>내용: <textarea name="contents" class="form-control" id="contents" >${dto.contents }</textarea></td>
	</table>
	<button class="btn btn-primary" type="submit" >수정</button>
	<button class="btn btn-primary" id="delete_btn" type="button" >삭제하기</button>

</form>

<script>
$("#updateForm").submit(function(){

		if($('#title').val()==""){
			alert("제목을 입력해주세요.");
			return false;
		}
		if($('#contents').val()==""){
			alert("내용을 입력해주세요.");
			return false;
		}
		alert("글이 수정 되었습니다. ");
	
	});
	
	$('#delete_btn').click(function(){
		if(confirm("삭제하겠습니까?"))
			location.href='delete?idx=${dto.idx}';
	})
	
</script>

</body>
</html>