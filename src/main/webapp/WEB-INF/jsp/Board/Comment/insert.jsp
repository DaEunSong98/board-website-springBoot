<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>



<div id="replyList"></div>


<script>
$(document).ready(function(){
	replyList();
	
	$('#insert_btn').click(function(){
		var content_val=$('#content').val();
		$.ajax({
			type :"post",
			url:"/comment/insert",
			dataType:"text",
			data:{"content": content_val,"board_idx":${dto.idx}},
			success:function(data){
				if(data=="success"){
					alert("댓글이 작성되었습니다.");
					replyList();
				}
					
				else 
					alert("내용을 입력하세요");
					
			}
		});
		
	});
	
});
function replyList(){
	console.log("1");
	console.log(${idx});
	$.ajax({
		type:"post",
		url: "/comment/list",
		data:{"board_idx":${dto.idx},"pageNo":${pageMaker.criteria.pageNo}},
		dataType:'json',
		success:function(data){
			var htmls="";
			if(data.length<1){
				htmls+="등록된 댓글이 없습니다.";
			}
			else{
				$(data).each(function(){
					htmls+='<div id="'+this.idx+'">'
					htmls+=this.idx+"   "+this.writer+'   '+this.content+'    '+this.wdate
					if(this.writer=="${member.id}"){
						htmls+='<button id="updateBtn" onclick="ClickUpdate('+this.idx+',\''+this.content+'\')">수정</button><br>'
						htmls+='<button id="deleteBtn" onclick="ClickDelete('+this.idx+')">삭제</button><br>'
					}
					htmls+="</div>"
				});
			}
			$('#replyList').html(htmls);
		
		}
	});
	
}
function ClickUpdate(idx,content){
	console.log(content);
	htmls="";
	htmls+='<input type="hidden" id="idx" name="idx" value='+idx+'></input>'
	htmls+='<input type="text" name="edit_content" id="edit_content'+'" value='+content+'></input>'
	htmls+='<button type="submit" id="update_btn" onclick="update('+idx+')">수정</button>'
	
	$('#'+idx).replaceWith(htmls);  //리플레이스가 안됨퓨ㅠㅠㅠㅠㅠ--테이블 떄문이었음!
	
}
function update(idx){
	var edit_content=$('#edit_content').val();
	$.ajax({
		type :"post",
		url:"/comment/update",
		dataType:"text",
		data:{"content": edit_content,"idx":idx},
		success:function(data){
			if(data=="success"){
				alert("댓글이 수정되었습니다.");
				replyList();
			}
			else 
				alert("내용을 입력하세요");
				
		}
	});
}
function ClickDelete(idx){
	if(confirm("댓글을 삭제하시겠습니까?")){
		$.ajax({
			type :"post",
			url:"/comment/delete",
			dataType:"text",
			data:{"idx":idx},
			success:function(data){
				if(data=="success"){
					alert("댓글이 삭제되었습니다.");
					replyList();
				}
				else 
					alert("시스템 오류");
					
			}
		});
	}
	
}
</script>


</body>
</html>