<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<h2>인덱스 페이지</h2>


<a href="board/list">자유게시판</a>

<c:choose>
	<c:when test="${empty member.id }">	
		<a href="member/login">로그인</a>
		<a href="join">회원 가입</a>
	</c:when>
	
	<c:otherwise>
		<a href="member/logout">로그아웃</a>
		<a href="member/update">회원정보 수정</a>
		<a href="member/delete">탈퇴</a>
	</c:otherwise>
</c:choose>

<a href="comment/insert?board_idx=41">댓글 작성</a>


<div class="row">
	<div class="col-lg-3 col-md-4 col-sm-6" style="background-color: red;">
	A
	</div>
	<div class="col-lg-3 col-md-4 col-sm-6" style="background-color: yellow;">
	B
	</div>
	<div class="col-sm-3 col-md-4 col-sm-6" style="background-color: blue;">
	B
	</div>
</div>
</body>
</html>