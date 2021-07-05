<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>게시글 목록 </h2>
<table border=1>
<c:choose>	
	<c:when test="${list.size()!=0}">
		<c:forEach var="board" items="${list}">  <!-- for(MemberDTO member:list) -->
			<tr>
				<td>${board.idx }</td>
				<td><a href="/board/view?idx=${board.idx}">${board.title}</a></td>
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

<a href="insert">글 작성하기</a><br><br>

<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage-1 }">이전</a>
		</c:if>
	
	
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	    	<!--  <li class = "paginate_button"> -->
	    	<a href="${num}" style="color:
	    	<c:if test="${pageMaker.criteria.pageNo == num}">black;</c:if>
	    	<c:if test="${pageMaker.criteria.pageNo != num}">grey;</c:if>">${num}</a>
	
	    </c:forEach>

   		
   		
		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage+1}">다음</a>
		</c:if>
		
		
		<form id="pageForm" action="list" method="post">
			<input type="hidden" name="pageNo" value="${pageMaker.criteria.pageNo}"/>
			<input type="hidden" name="countPerp" value="${pageMaker.criteria.countPerp}"/>
		</form>
		
		

</body>
</html>