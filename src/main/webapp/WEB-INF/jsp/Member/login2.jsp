<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="{%static 'css/bootstrap.css'%}">
<link rel="stylesheet" href="{%static 'css/custom.min.css'%}">
<link rel="stylesheet" href="{%static 'css/font-awesome.min.css'%}">
<link rel="stylesheet" href="{%static 'css/prism-okaidia.css'%}">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
</head>
<body>



<c:choose>
	<c:when test="${empty member.id}">
		<form action="login" method="post">
			 <div class="form-group">
	    		  <label for="id" class="form-label mt-4">id</label>
	     		 <input type="text" class="form-control" id="id"  placeholder="아이디를 입력해주세요">
	      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	    </div>
	    <div class="form-group">
	      <label for="password" class="form-label mt-4">Password</label>
	      <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
    </div>
    
			<input type="text" name="id" placeholder="아이디"> <br>
			<input type="text" name="pw" placeholder="패스워드"><br>
			<input type="submit" value="로그인" onclick="check()">
			<input type="button" value="취소" onclick="javascript:location.href='index';">
		</form>
	</c:when>
	<c:otherwise>
		 ${member.id }님은 로그인 되셨습니다.<br>
		<a href='home'>인덱스 페이지로 이동</a>
	</c:otherwise>
</c:choose>
</body>
</html>