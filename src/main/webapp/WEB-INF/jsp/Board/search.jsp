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
<c:choose>	
	<c:when test="${list.size()!=0}">
		<c:forEach var="board" items="${list}">  <!-- for(MemberDTO member:list) -->
			<tr>
				<td>${board.idx }</td>
				<td><a href="/board/view/1?idx=${board.idx}">${board.title}</a></td>
				<td>${board.writer }</td>
				<td>${board.wdate }</td>
				<td><fmt:formatDate value="${dto.wdate}" pattern="yyyy-mm-dd HH:mm"/>
			</tr>
		</c:forEach>
		
		
	</c:when>
	
	<c:otherwise> <!-- colspan==합친 열의 개수/ rowspan -->
		<tr><td colspan=3>데이터 없음</td></tr>
	</c:otherwise>
	
</c:choose>

</table>


</body>
</html>