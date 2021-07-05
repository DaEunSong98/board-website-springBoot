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

<c:choose>
	<c:when test="${empty member.id}">
		<a href="/member/login">로그인후 이용가능 합니다. </a>
	</c:when>

	<c:otherwise>
	
		<input type="text" id="content" name="content"/>
		<button id="insert_btn" type="submit">작성</button>
		
	<!-- 리스트 출력 부분 -->
	<div id="replyList"></div>
	</c:otherwise>
</c:choose>


<script>

$(document).ready(function(){
	replyList();
$('#insert_btn').click(function(){
	var content_val=$('#content').val();
	$.ajax({
		type :"post",
		url:"insert",
		dataType:"text",
		data:{"content": content_val,"board_idx":${board_idx}},
		success:function(data){
			if(data=="success")
				alert("댓글이 작성되었습니다.");
			else 
				alert("내용을 입력하세요");
				
		}
	});
	replyList();
});

function replyList(){
	
	$.ajax({
		type:"post",
		url: "list",
		data:{"board_idx":${board_idx}},
		dataType:'json',
		success:function(data){
			var htmls="";
			console.log(data.length);
			if(data.length<1){
				htmls+="등록된 댓글이 없습니다.";
			}
			else{
				$(data).each(function(){
				
					htmls+='<table border=1>'
					htmls+='<tr><td>'+this.idx+"</td><td>"+this.writer+'</td><td>'+this.content+'</td></tr>'
					htmls+='<a href="update?idx='+ this.idx+'&content='+this.content+'">수정</a>'
					htmls+="</table>"
				});
			}
			$('#replyList').html(htmls);
		}
	});

}
});



</script>


</body>
</html>
