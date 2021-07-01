<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>


<c:if test="${empty member.id}">
		<script>
			alert('로그인 후에 이용할 수 있습니다. ');
			location.href='/member/login';
		</script>
</c:if>
	
<c:set var="writer" value="${dto.writer}"/>
<c:set var="id" value="${member.id}"/>

<c:if test="${writer ne id}">
	<script>
		alert("본인 작성글만 수정 가능합니다.");
		location.href="list";
	</script>
</c:if>


<form id="updateForm" action="update" method="post">
<input type="hidden" name="idx" value="${dto.idx}">
<table border=1>
<tr>
	<td>번호</td> <td>${dto.idx }</td>
</tr>	
<tr>	
	<td>제목</td> <td><input type="text" id="title" name="title" value="${dto.title}"/></td>
</tr>
<tr>
	<td>내용</td> <td><input type="text" id="contents" name="contents" value="${dto.contents}"/></td>
</tr>
</table>
<input type="submit" value="수정하기"/>

<button id="delete" onclick="javascript:location.href='delete?idx=${dto.idx}';">삭제하기</button>


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
	
</script>

</body>
</html>