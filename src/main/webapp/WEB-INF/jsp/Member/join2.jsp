<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>

<body> 
<h2>회원가입</h2>


<form id="joinForm" action="join" method="post"> <!-- 여기서의 form은 매핑 이름 -->
	<input type="text" id="id" name="id" placeholder="아이디" value="${dto.id}">
	<div class="check_font" id="idCheck"></div>
    <!-- ${valid_id}<br> -->    
	<input type="password" id="pw" name="pw" placeholder="패스워드">
	<div class="check_font" id="pwCheck1"></div>
	<!-- ${valid_pw}<br> -->
	<input type="password" id="pw_check" name="pw_check" placeholder="패스워드 확인">
	<div class="check_font" id="pwCheck2"></div>
	<input type="text" id="name" name="name" placeholder="이름" value="${dto.name}">	
	<div class="check_font" id="nameCheck"></div>
	<!-- ${valid_name}<br> -->
	<input type="text" id="email" name="email" placeholder="이메일" value="${dto.email}">
	<div class="check_font" id="emailCheck"></div>
	<!--  ${valid_email}<br>-->	
	<input type="text" name="mobile" placeholder="전화번호" value="${dto.mobile}"><br>
	<input type="text" name="address" placeholder="주소" value="${dto.address}" ><br>
 	<input type="submit" value="회원가입"/>	
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
	$( "#name" ).blur(function() {
		if($('#name').val()==""){
			$('#nameCheck').text("이름은 필수 입력 값입니다. ");
		}
		else {
			$('#nameCheck').text("");
			name_check=true;
		}
			
	});
	$( "#pw" ).blur(function() {
		var pw=$('#pw').val();
		if(pw==""){
			$('#pwCheck1').text("비밀번호는 필수 입력 값입니다. ");
		}
		else if(reg2.test(pw)==false){
			$('#pwCheck1').text("비밀번호 형식에 맞지 않습니다. ");
		}
		else{
			$('#pwCheck1').text("");
			pw_check=true;
		}
			
	});
	
	$( "#pw_check" ).blur(function() {
		var pw=$('#pw').val();
		var pw_check=$('#pw_check').val();
		if(check)
		if(pw!=pw_check) {
			$('#pwCheck2').text("비밀번호가 일치하지 않습니다.");
		}
		else { 
			$('#pwCheck2').text("");
			pw2_check=true;
		
		}
	});
	
	$( "#email" ).blur(function() {
		var email=$('#email').val();
		if(reg.test(email)==false){
			$('#emailCheck').text("이메일 형식에 맞지 않습니다.  ");
		}
		else{
			email_check=true;
			$('#emailCheck').text("");
		}
		});
	
		
	$('#joinForm').submit(function(){
		if(id_check==false || pw_check==false || pw2_check==false || name_check==false
			|| email_check==false){
			return false;
		}
		else{
			alert("회원가입이 완료되었습니다.");
		}
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