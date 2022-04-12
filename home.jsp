<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/kotton-css@1.0.0/dist/kotton-style.min.css">

<meta name ="viewport" content = "width=device-width, initial-scale = 1">
 <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" /> 
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<style>
		*{
  margin:0;
  padding:0;
  box-sizing:border-box;
}
.wrapper{
  width:100%;
}
/* .container{
  width:100%;
  max-width:500px;
  margin:0 auto;
  border:1px solid #e1e1e1;
} */
.head{
  width:100%;
  height:50px;
  border-bottom:1px solid #e1e1e1;
  position:relative;
}
.logo{
  text-align:center;
  font-size:32px;
  font-style:italic;
  font-weight:800;
  padding-top:8px;
}
.body{
  height:800px;
  position:relative;
  overflow:hidden;
}
.content{
  height:100%;
  font-size:30px;
  display:flex;
  justify-content:center;
  align-items:center;
}
.slide-open{
  position:absolute;
  top:0;
  right:0;
  width:50px;
  height:50px;
  cursor:pointer;
}
.burgur{
right: 15px;
top: 23px;
position: absolute;
width: 20px;
height: 2px;
background: #000000;
}
.burgur .top-line{
width: 20px;
height: 2px;
background-color: #000000;
bottom: -5px;
content: '';
position: absolute;
right: 0;
-webkit-transition:  -webkit-transform .3s;
transition: transform .3s;

}
.burgur .bot-line {
width: 20px;
height: 2px;
background-color: #000000;
top: -5px;
content: '';
position: absolute;
right: 0;
-webkit-transition:  -webkit-transform .3s;
transition: transform .3s;
}

.burgur.on {
width: 0;
}
.burgur.on .bot-line {
-webkit-transform: translateY(5px) rotate(135deg);
transform: translateY(5px) rotate(135deg);
}
.burgur.on .top-line{
-webkit-transform: translateY(-5px) rotate(-135deg);
transform: translateY(-5px) rotate(-135deg);
}
.slide{
  width:100%;
  
  position:absolute;
  left:-100%;
  top:0;
  right:0;
  bottom:0;
  -webkit-transition: left .3s;
  -moz-transition: left .3s;
  -ms-transition: left .3s;
  -o-transition: left .3s;
  transition: left .3s;
  background-color:#cccccc;
}
.slide-title{
  width:100%;
  height:100px;
  font-size:42px;
  display:flex;
  justify-content:center;
  align-items:center;
  border-bottom:1px solid #e1e1e1;
}
.slide.on{
  left:0;
}
.slide ul li{
  display:inline-block;
  width:100%;
  padding:7px;
  border-bottom:1px solid #e1e1e1;
}


	</style>
<title>Insert title here</title>
	<script>
	$(function(){
		 
		  $("#slide-open").click(function()    {
		    if($("#burgur").hasClass('on')){
		      $("#burgur").removeClass('on');
		      $("#slide").removeClass('on');
		     
		    } else{
		      $("#burgur").addClass('on');
		     $("#slide").addClass('on'); 
		    }
		  });
		  
		});
	</script>

</head>
<body class="kotton-style">
	<div class="wrapper">
  <!-- <div class="container"> -->
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
           <!-- <li><strong><a href = "/uj/home">홈</a></strong></li> -->
            <%
			//로그인된 아이디가 있는지 읽어와보기
			String uid =(String)session.getAttribute("uid");
            
			%>
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
           
           <li><strong>소 		개</strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/naverMap';">오시는길</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/list';">게시판</button></strong></li>
           <li><strong><button type="button" 
					onclick="location.href='/uj/reservation';">예약</button></strong></li>
          
          
           <li><strong><button type="button" 
					onclick="location.href='http://instagram.com/gimsehwan5504';">인스타그램</button></strong></li>
		<li><strong><button type="button" 
					onclick="location.href='/uj/game';">게임</button></strong></li>			
          	
         </ul>
       </div>
     </div>
  </div> 
<!-- </div> -->
	<div data-role = "footer">
	<h3>매장번호 : <a href="tel:050713472333">050713472333</a> 주소 : 서울특별시 성북구 종암동 종암로3길 31
Copyright © 2022 우정초밥 All rights reserved.</h3></div>
</body>
</html>