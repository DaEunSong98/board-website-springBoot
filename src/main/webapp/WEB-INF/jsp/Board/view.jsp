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
		<a href="/board/update?idx=${dto.idx}">수정하기</a><br>
	</c:if>
	
	<c:choose>
	<c:when test="${empty member.id}">
		<a href="/member/login">로그인후 이용가능 합니다. </a><br>
	</c:when>

	<c:otherwise>
			
		댓글수 : ${count }<br>
		<input type="text" id="content" name="content"/>
		<button id="insert_btn" type="submit">작성</button>
		
			
	<!-- 리스트 출력 부분 -->
	<%@include file="Comment/insert.jsp" %>
	
	<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage-1 }?idx=${dto.idx}">이전</a>
		</c:if>
	
	
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	    	<!--  <li class = "paginate_button"> -->
	    	<a href="/board/view?idx=${dto.idx}&pageNo=${num}" style="color:
	    	<c:if test="${pageMaker.criteria.pageNo == num}">black;</c:if>
	    	<c:if test="${pageMaker.criteria.pageNo != num}">grey;</c:if>">${num}</a>
	
	    </c:forEach>


		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage+1}?idx=${dto.idx}">다음</a>
		</c:if>
		
		
		<form id="pageForm" action="view" method="post">
			<input type="hidden" name="pageNo" value="${pageMaker.criteria.pageNo}"/>
			<input type="hidden" name="countPerp" value="${pageMaker.criteria.countPerp}"/>
		</form>	
	</c:otherwise>
</c:choose>



	
		


</body>
</html>