<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="{%static 'css/bootstrap.css'%}">
<link rel="stylesheet" href="{%static 'css/custom.min.css'%}">
<link rel="stylesheet" href="{%static 'css/font-awesome.min.css'%}">
<link rel="stylesheet" href="{%static 'css/prism-okaidia.css'%}">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">My Blog</a>
    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse collapse" id="navbarColor03" style="">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="home">홈
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        
     <c:choose>
		<c:when test="${empty member.id }">	
        <li class="nav-item">
          <a class="nav-link" href="login">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="join">회원가입</a>
        </li>
        </c:when>
        <c:otherwise>
          <li class="nav-item">
          	<a class="nav-link" href="logout">로그아웃</a>
        </li>
        <li class="nav-item">
          	<a class="nav-link" href="update">회원정보수정</a>
        </li>
        </c:otherwise>
     </c:choose>
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="text" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<br><br>

<h1>로그인</h1>
<c:choose>
	<c:when test="${empty member.id }">	
		<form id="loginForm" action="login" method="post">
		<fieldset>
			 <div class="form-group">
	    		  <label for="id" class="form-label mt-4"></label>
	     		 <input type="text" class="form-control" id="id" name="id" placeholder="아이디" value="${dto}" >
	     		  <p class="text-danger" id="idCheck"></p>
	     		 <!--  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
	    	</div>
	    	
	    	 
	   		 <div class="form-group">
	     		 <label for="password" class="form-label mt-4"></label>
	     		 <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
	     		 <p class="text-danger" id="pwCheck"></p>
   			 </div>
   			 
   			 <br><br> 
   			<button type="submit" class="btn btn-primary">로그인</button>
    		<button type="button" class="btn btn-primary" onclick="javascript:location.href='join'">회원가입</button><br/><br/>
    		
		</fieldset>
		</form>
		<c:if test="${login==-1}"><script>alert("존재하지 않는 아이디입니다. ");</script></c:if>
		<c:if test="${login==0}"><script>alert("비밀번호를 다시 확인해주세요. ");</script></c:if>
	</c:when>
	<c:otherwise>
		<script>
			alert("로그인되었습니다.");
			location.href="/home"
		</script>	
	</c:otherwise>	
</c:choose>
	
	

<script>
	$('#loginForm').submit(function(){
		if($('#id').val()==""){
	 		$('#idCheck').text("아이디를 입력해주세요"); $('#id').focus();
	 		return false;
		}
		else
			$('#idCheck').text("");
		
		if($('#pw').val()==""){
	 		$('#pwCheck').text("비밀번호를 입력해주세요");$('pw').focus();
	 		return false;
		}
		else
			$('#pwCheck').text("");
});
	
</script>
</body>
</html>