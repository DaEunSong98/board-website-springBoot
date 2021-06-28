<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>

<body> 
<h2>회원가입</h2>


<form action="join" method="post"> <!-- 여기서의 form은 매핑 이름 -->
	<input type="text" id="id" name="id" placeholder="아이디" value="${dto.id}">
	<button class="idChk" type="button" id="id_check" onclick="fn_Check();" >중복 확인</button>
    ${valid_id}<br>    
	<input type="password" id="pw" name="pw" placeholder="패스워드">
	${valid_pw}<br>
	<input type="password" id="pw_check" name="pw_check" placeholder="패스워드 확인">
	<div class="check_font" id="pwCheck"></div>
	<input type="text" name="name" placeholder="이름" value="${dto.name}">	
	${valid_name}<br>
	<input type="text" name="email" placeholder="이메일" value="${dto.email}">
	${valid_email}<br>	
	<input type="text" name="mobile" placeholder="전화번호" value="${dto.mobile}"><br>
	<input type="text" name="address" placeholder="주소" value="${dto.address}" ><br>
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