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
		<a href="/member/login">로그인후 이용가능 합니다. </a>
	</c:when>

	<c:otherwise>
		<form action="insert" method="post">

		<input type="text" id="content" name="content"/>
		<input type="submit" value="작성"/>

	</form>

	<!-- 리스트 출력 부분 -->

	</c:otherwise>
</c:choose>



</body>
</html>
