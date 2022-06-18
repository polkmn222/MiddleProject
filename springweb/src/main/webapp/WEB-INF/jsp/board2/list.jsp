<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판 목록 보기</title>
<style>
	main > div { border-bottom:1px solid black; width:fit-content; }
	div>label {display:inline-block; width:60px; margin:5px 10px; }
	div>label:nth-child(3) { width:150px; }
	a { text-decoration: none; }
	div#header {border-bottom:3px solid black; background-color:#eeeeee;}
</style>
</head>
<body>
	<h3>게시판 목록보기</h3>
	<main>
	<div id="header"><label>글 번호</label><label>제 목</label><label>글 작성일</label><label>파일</label></div>
		<c:forEach var = "b" items = "${list }">
			<div><label>${b.num }.</label>
			<label> <a href="/bbs/detail?num=${b.num}" >${b.title }</a></label>
			<label> ${b.bdate } </label>
		 		<c:forEach var = "a" items = "${b.attach }">
		 		${a.filename }. <%-- ${a.filesize } --%> 
		 		</c:forEach>
		 	</div>         	
		</c:forEach>
	<p>
	</main>
	[<a href = "/bbs/add">게시글 추가</a>]   <!-- get방식 -->
	<button type="button" 
		onclick="location.href='/bbs/add';">게시글 추가</button>
	
	
	
</body>
</html>