<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%
	//로그인된 아이디가 있는지 읽어와보기
	String uid =(String)session.getAttribute("uid");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/kotton-css@1.0.0/dist/kotton-style.min.css">
<meta name ="viewport" content = "width=device-width, initial-scale = 1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" /> 
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/home.css">
<title>home</title>
</head>
<body class="kotton-style">
	<div class="wrapper">
     <div class="head">
       <div class="slide-open" id="slide-open">
          <span class="burgur" id="burgur">
          <span class="top-line"></span>
          <span class="bot-line"></span>
       </span>
       </div>
      
       <div class="logo">우정초밥</div>
     </div>
     <div class="body">
         <img src="/img/uj1.png" width="100%" height="100%"  alt="" class="thumb" />
       <div class="content">
       </div>
       <div class="slide" id="slide">
         <div class="slide-title">
           메 뉴 
         </div>
         
         <ul>
           <%if(uid==null){%>
           <li><strong><button type="button" 
					onclick="location.href='/uj/login';">로그인</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/add';">회원가입</button></strong></li>
          	<%}else{ %>
          
           <li><strong><button type="button" 
					onclick="location.href='/uj/logout';">로그아웃</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/edit';">회원정보 수정</button></strong></li>
          	<%} %>
          
           <li><strong><button type="button" 
					onclick="location.href='/uj/info';">소개</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/naverMap';">오시는길</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/list';">게시판</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/rlist';">예약</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='http://instagram.com/gimsehwan5504';">인스타그램</button></strong></li>
			<li><strong><button type="button" 
					onclick="location.href='/uj/game';">게임</button></strong></li>			
			<li><strong><button type="button" 
					onclick="location.href='/uj/clock';">시계</button></strong></li>			
         </ul>
       </div>
     </div>
  </div> 
	<div data-role = "footer">
	<h3>매장번호 : <a href="tel:050713472333">050713472333</a> 주소 : 서울특별시 성북구 종암동 종암로3길 31 Copyright © 2022 우정초밥 All rights reserved.</h3></div>
	<script src="/js/home.js"></script>
</body>
</html>