<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${empty member.id}">
		<script>
			alert('로그인 후에 이용할 수 있습니다. ');
			location.href='/member/login';
		</script>
</c:if>	

<c:if test="${msg==true}">
	<script>
	alert("글이 작성되었습니다");
	location.href="list";
	</script>
</c:if>

<form action="insert" method="post">
	제목: <input type="text" name="title"><br>
	내용: <input type="text" name="contents"><br>
	<input type="submit" value="글 작성"/>
</form>
</body>
</html>