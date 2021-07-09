<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
<title>회원가입</title>
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
<h2>회원가입</h2>

<form id="joinForm" action="join" method="post">
	<div class="form-group">
      <label for="id" class="form-label mt-4">아이디</label>
      <input type="text" class="form-control" name="id" id="id" autofocus placeholder="아이디"  >
      <p class="text-danger" id="idCheck"></p>
    </div>
    <div class="form-group">
      <label for="password" class="form-label mt-4">비밀번호</label>
      <input type="password" class="form-control" name="pw" id="pw"  placeholder="비밀번호">
      <p class="text-danger" id="pwCheck1"></p>
    </div>
    <div class="form-group">
      <label for="password_check" class="form-label mt-4">비밀번호 확인</label>
      <input type="password" class="form-control" name="pw_check" id="pw_check" placeholder="비밀번호 확인" >
     <p class="text-danger" id="pwCheck2"></p>
    </div>
    <div class="form-group">
      <label for="name" class="form-label mt-4">이름</label>
      <input type="text" class="form-control" name="name" id="name" placeholder="이름">
      <p class="text-danger" id="nameCheck"></p>
    </div>
    <div class="form-group">
      <label for="email" class="form-label mt-4">이메일</label>
      <input type="text" class="form-control" name="email" id="email" placeholder="이메일">
      <p class="text-danger" id="emailCheck"></p>
    </div>
    <div class="form-group">
      <label for="mobile" class="form-label mt-4">핸드폰 번호 *__-___-___형식으로 작성해주세요</label>
      <input type="text" class="form-control" name="mobile" id="mobile" placeholder="핸드폰 번호">
      <p class="text-danger" id="mobileCheck"></p>
    </div>
    <div class="form-group">
      <label for="address" class="form-label mt-4">주소</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="주소"><br>
    </div>
    <button type="submit" class="btn btn-primary">회원가입</button>
 </form>  
    

	<script>
	
	var id_check=false;
	var num_check=false;
	var pw_check=false;
	var pw2_check=false;
	var email_check=false;
	
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var reg2 = /^.*(?=.{8,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	
 
	  
	$( "#id" ).blur(function() {
		
		$.ajax({
			url:"idChk",
			data: {"id" : $("#id").val()},
			success:function(data){
				if(data==1){
					 $('#idCheck').text("이미 사용중인 아이디입니다.");
				}
				else if(data==0){	 
					$('#idCheck').text("사용가능한 아이디입니다.");
					id_check=true;
				}
				else{
					$('#idCheck').text("아이디는 필수 입력 값입니다. ");
				}
			},error:function(){
				console.log("시스템 오류입니다.");
			}
		});
	});
	
	
		
	$('#joinForm').submit(function(){
		
		if(id_check==false ){ $('#id').focus(); return false;}
		var pw=$('#pw').val();
		var pw_check=$('#pw_check').val();
		
		if(pw==""){
			$('#pwCheck1').text("비밀번호는 필수 입력 값입니다. ");
			$('#pw').focus(); return false;
		}
		else $('#pwCheck1').text("");
		
		
		if(reg2.test(pw)==false){
			$('#pwCheck1').text("비밀번호 형식에 맞지 않습니다. ");
			$('#pw').focus(); return false;
		}
		else $('#pwCheck1').text("");
		
		if(pw!=pw_check) {
			$('#pwCheck2').text("비밀번호가 일치하지 않습니다.");
			$('#pw').focus(); return false;
		}
		else $('#pwCheck2').text("");
		
		if($('#name').val()==""){
			$('#nameCheck').text("이름은 필수 입력 값입니다. ");
			$('#name').focus(); return false;
		}
		else $('#nameCheck').text("");
		
		var email=$('#email').val();
		if(reg.test(email)==false){
			$('#emailCheck').text("이메일 형식에 맞지 않습니다.  ");
			$('#email').focus(); return false;
		}
		else $('#emailCheck').text("");
		
		alert("회원 가입이 완료되었습니다. ");
	});
	
	function check(re,data){
		if(reg.test(data.value)) return true;
		else 
			return false;
	}
			
	
</script>





	<!-- <label for = "gender">성별 : </label> -
	성별: 
  <input type = "radio" name = "gender" value = "남자" id="woman" checked = "checked"> 남자    
  <input type = "radio" name = "gender" value = "여자" id="man"> 여자<br>
  -->
 <!--  생년 월일: 
  <input type="text" name="birthYear" placeholder="년(4글자)">	
  <select name="birthMonth">
  	<option value="1">1월</option>
  	<option value="2">2월</option>
  	<option value="3">3월</option>
  </select> 
  <input type="text" name="birthDate" placeholder="일"><br>
 --> 

	<!-- <input type="button" value="취소" onclick="javascript:location.href='index';">  -->

</body>
</html>