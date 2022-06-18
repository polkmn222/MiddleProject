<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사용자 정보 리스트</title>
<style>
	main > div { border-bottom:1px solid black; width:fit-content; }
	div>label {display:inline-block; width:60px; margin:5px 10px; }
	div>label:nth-child(3) { width:150px; }
	a { text-decoration: none; }
	div#header {border-bottom:3px solid black; background-color:#eeeeee;}
</style>
</head>
<body>
	<h3>사용자 정보 리스트</h3>
	<main>
		<div id="header"><label>아이디</label><label>이 름</label><label>전화번호</label></div>
		<c:forEach var="u" items="${list}">
			<div><label>${u.uid}</label><label>
			<a href="/mb/detail?userid=${u.uid}" >${u.name}</a>
			</label><label>${u.phone}</label></div>
		</c:forEach>
	</main>
	<p>
	[<a href = "/mb/add">사용자정보 추가</a>]   <!-- get방식 -->
	<button type="button" 
		onclick="location.href='/mb/add';">사용자정보 추가</button>
	<button type="button" 
		onclick="location.href='/mb/logout';">로그아웃</button>
</body>
</html>