<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border=1>
<tr>
	<td>번호</td> <td>${dto.idx }</td>
</tr>	
<tr>	
	<td>제목</td> <td>${dto.title}</td>
</tr>
<tr>
	<td>내용</td> <td>${dto.contents }</td>
</tr>
<tr>
	<td>날짜 </td> <td><fmt:formatDate value="${dto.wdate}" pattern="yyyy-mm-dd HH:mm"/>
</tr>

<tr> 
	<td>조회수</td> <td>${dto.hit }</td>
</tr>
</table>

	<c:if test="${member.id==dto.writer}">
		<a href="update?idx=${dto.idx}">수정하기</a><br>
	</c:if>

	<!-- 댓글 부분 추가  -->
	<%@include file="Comment/insert.jsp" %>
</body>
</html>