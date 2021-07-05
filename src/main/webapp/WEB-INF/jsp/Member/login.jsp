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



<c:choose>
	<c:when test="${empty member.id}">
		<form action="login" method="post">
			<input type="text" name="id" placeholder="아이디"> <br>
			<input type="text" name="pw" placeholder="패스워드"><br>
			<input type="submit" value="로그인" onclick="check()">
			<input type="button" value="취소" onclick="javascript:location.href='index';">
		</form>
	</c:when>
	<c:otherwise>
		 ${member.id }님은 로그인 되셨습니다.<br>
		<a href='home'>인덱스 페이지로 이동</a>
	</c:otherwise>
</c:choose>
</body>
</html>
