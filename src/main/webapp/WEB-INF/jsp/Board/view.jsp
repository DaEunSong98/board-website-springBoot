<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="{%static 'css/bootstrap.css'%}">
<link rel="stylesheet" href="{%static 'css/custom.min.css'%}">
<link rel="stylesheet" href="{%static 'css/font-awesome.min.css'%}">
<link rel="stylesheet" href="{%static 'css/prism-okaidia.css'%}">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
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




<table class="table table-hover">
<tr><td><h1>제목: ${dto.title }</h1></td>
<tr>
	<td>작성자: ${dto.writer }</td>
<tr>
	<td>날짜: <fmt:formatDate value="${dto.wdate}" pattern="yyyy-mm-dd HH:mm"/></td>
</tr>
<tr> 
	<td>조회수: ${dto.hit}</td>
</tr>
<tr>
	<td>내용: <textarea name="contents" class="form-control" id="contnetss" readonly>${dto.contents}</textarea></td>

</table>

<button type="button" class="btn btn-primary" onclick="javascrirpt:location.href='list'">목록</button>
<c:if test="${member.id==dto.writer}">
	<button type="button" class="btn btn-primary" onclick="javascrirpt:location.href='update?idx=${dto.idx}'">글 수정</button>
</c:if><br><br>

	
	<c:choose>
	<c:when test="${empty member.id}">
		<a href="/member/login">로그인후 이용가능 합니다. </a><br>
	</c:when>

	<c:otherwise>
			
		댓글수 : ${count }<br>
	<input class="form-control me-sm-2" type="text" id="content" placeholder="댓글을 입력하세요"><button id="insert_btn" type="submit">작성</button>
		
			
	<!-- 리스트 출력 부분 -->
	<%@include file="Comment/insert.jsp" %>
	
	<div>
  <ul class="pagination">
  	<c:if test="${pageMaker.prev}">
   		 <li class="page-item">
      		<a class="page-link" href="/board/view?pageNo=${pageMaker.startPage-1 }">&laquo;</a>
   		 </li>
   	</c:if>
   	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
    	<c:if test="${pageMaker.criteria.pageNo == num}">
	    	<li class="page-item active">
	      		<a class="page-link" href="/board/view?pageNo=${num}">${num}</a>
	      	</li>
      	</c:if>
      	<c:if test="${pageMaker.criteria.pageNo != num}">
	      	 <li class="page-item">
	     		 <a class="page-link" href="/board/view?pageNo=${num}">${num}</a>
	   		 </li>
   		 </c:if>
   	</c:forEach>
   	<c:if test="${pageMaker.next}">
   		<li class="page-item">
     		 <a class="page-link" href="/board/view?pageNo=${pageMaker.endPage+1}">&raquo;</a>
   		 </li>	
   	</c:if>
   </ul>
</div>   

		<form id="pageForm" action="list" method="post">
			<input type="hidden" name="pageNo" value="${pageMaker.criteria.pageNo}"/>
			<input type="hidden" name="countPerp" value="${pageMaker.criteria.countPerp}"/>
		</form>
		
		
	</c:otherwise>
</c:choose>

</body>
</html>