<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<title>Insert title here</title>
</head>

<body>
<form action="delete" method="post" onsubmit="return confirm('탈퇴하시겠습니까?');">
	<input type="text" name="pw" placeholder="패스워드"><br>
	<input type="text" name="pw_check" placeholder="패스워드 확인"><br>
	<button type="submit" id="submit" onclick="pw_check();">회원탈퇴</button>
	
	<input type="button" value="취소" onclick="javascript:location.href='index';">
</form>

<c:if test="${msg==true}"> <!-- 비밀번호가 틀린  경우 -->
	<script>
	alert("비밀번호가 맞지 않습니다.");
	</script>
</c:if>

<c:if test="${msg==false}"> <!-- 비밀번호가 일치하지 않는 경우  경우 -->
	<script>
	alert("비밀번호가 일치하지 않습니다.");
	</script>
</c:if>

<c:if test="${empty member.id}"> <!-- 비밀번호가 일치하지 않는 경우  경우 -->
	<script>
	alert("탈퇴가 완료되었습니다.");
	location.href="/home";
	</script>
</c:if>


</body>
</html>