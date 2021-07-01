<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
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
		<form action="update" method="post" onsubmit="return confirm('수정하시겠습니까?');">
			아이디: ${member.id}<br>
			이름: <input type="text" name="name" value="${member.name}"/><br>	
			이메일: <input type="text" name="email" value="${member.email}"><br>	
			주소: <input type="text" name="address" value="${member.address} "><br>	
	 		전화번호: <input type="text" name="mobile" value="${member.mobile }"  ><br>
	 		수정 시 확인을 위한 본인 패스워드를 입력하세요<br>
	 		패스워드: <input type="password" name="pw" placeholder="패스워드"/><br>	
	 		
	 		
			<input type="submit" value="수정완료">
			<input type="button" value="취소" onclick="javascript:location.href='home';">
		</form>
</c:otherwise>
</c:choose>

<c:if test="${msg==false}">
	<script>alert("비밀번호가 일치하지 않습니다. 다시 수정해주세요.")</script>	
</c:if>

<c:if test="${msg==true}">
	<script>alert("정보 수정이 완료되었습니다. ");
			location.href='/home';
	</script>	
</c:if>
</body>
</html>