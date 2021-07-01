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


<form id="insertForm" action="insert" method="post" enctype="multipart/form-data">
	제목: <input type="text" id="title" name="title"><br>
	<!-- 첨부파일: <input type="file" name="file" multiple> -->
	내용: <input type="text" id="contents" name="contents"><br>
	<input type="submit" value="글 작성"/>
</form>

<script>
$("#insertForm").submit(function(){

		if($('#title').val()==""){
			alert("제목을 입력해주세요.");
			return false;
		}
		if($('#contents').val()==""){
			alert("내용을 입력해주세요.");
			return false;
		}
		alert("글이 작성되었습니다. ");
		
	});
	
</script>
</body>
</html>