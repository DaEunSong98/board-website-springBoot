<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

</head>


<body>
<h2>회원가입</h2>
${checkingValue}
<form action="join" method="post"> <!-- 여기서의 form은 매핑 이름 -->
	<input type="text" name="id" id="id" placeholder="아이디" value="${dto.id}">
	<button class="idChk" type="button" id="idChk" onclick="fn_Check();" >중복 확인</button>
    ${valid_id}<br>    
	<input type="password" name="pw" id="pw"placeholder="패스워드">
	${valid_pw}<br>
	<input type="password" name="pw_check" id="pw_check" placeholder="패스워드 확인">
	<!--  ${check}<br>-->
	<div class="check_font" id="pwCheck"></div>
	
=======
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
<script type="text/javascript">
function joinCheck(){
	var $id=$("#id");
	var $pw=$("#pw");
	
	if($id.val().trim().length==0){
		alert('아이디를 입력하세요');
		$id.focus();
		return false;
	}
	
	if($pw.val().trim().length==0){
		alert('비밀번호를 입력하세요')
		$pw.focus();
		return false;
	}
	if(confirm("회원가입 하시겠습니까?")){
		alert("회원가입이 완료되었습니다.");
		$("form").submit();
	}
	return true;
}
	

</script>
 -->

<h2>회원가입</h2>

<form action="join" method="post"> <!-- 여기서의 form은 매핑 이름 -->
	<input type="text" name="id" placeholder="아이디" value="${dto.id}">
    ${valid_id}<br>    
	<input type="password" name="pw" placeholder="패스워드">
	${valid_pw}<br>
	<input type="password" name="pw_check" placeholder="패스워드 확인">
	${check}<br>
>>>>>>> b67e7d9fb1d52cc32043668afb99a5ff0489ee3e
	<input type="text" name="name" placeholder="이름" value="${dto.name}">	
	${valid_name}<br>
	<input type="text" name="email" placeholder="이메일" value="${dto.email}">
	${valid_email}<br>	
	<input type="text" name="mobile" placeholder="전화번호" value="${dto.mobile}"><br>
	<input type="text" name="address" placeholder="주소" value="${dto.address}" ><br>
<<<<<<< HEAD
 	<input type="submit" value="회원가입" onclick="idCheck();"/>	
	</form>
	
	
	
	<script>
	function valid(){
		if(checkingValue==true)
			alert('회원가입이 완료되었습니다.');
			
	}
	
	
	function fn_Check(){
		
		$.ajax({
			url:"idChk",
			data: {"id" : $("#id").val()},
			success:function(data){
				if(data==1){
					alert("중복된 아이디입니다. ");
				}
				else alert("사용가능한 아이디입니다.");
			},error:function(){
				console.log("시스템 오류입니다.");
			}
		});
	}
	
	$( "#pw_check" ).blur(function() {
		var pw=$('#pw').val();
		var pw_check=$('#pw_check').val();
		if(pw!=pw_check) $('#pwCheck').text("비밀번호가 일치하지 않습니다.");
		else  $('#pwCheck').text("");
	});
					
			
	
</script>

	
=======
 	<input type="submit" value="회원가입"/>	
	</form>
	
	
>>>>>>> b67e7d9fb1d52cc32043668afb99a5ff0489ee3e
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