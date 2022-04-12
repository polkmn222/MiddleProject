<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons'>
  <meta name ="viewport" content = "width=device-width, initial-scale = 1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
<title>로그인</title>
</head>
<body>
	<script>
	$(document).ready(function() {
		  var panelOne = $('.form-panel.two').height(),
		    panelTwo = $('.form-panel.two')[0].scrollHeight;

		  $('.form-panel.two').not('.form-panel.two.active').on('click', function(e) {
		    e.preventDefault();

		    $('.form-toggle').addClass('visible');
		    $('.form-panel.one').addClass('hidden');
		    $('.form-panel.two').addClass('active');
		    $('.form').animate({
		      'height': panelTwo
		    }, 200);
		  });

		  $('.form-toggle').on('click', function(e) {
		    e.preventDefault();
		    $(this).removeClass('visible');
		    $('.form-panel.one').removeClass('hidden');
		    $('.form-panel.two').removeClass('active');
		    $('.form').animate({
		      'height': panelOne
		    }, 200);
		  });
		});
	</script>
	<script>
	function forgot() {
		var serData = $('#forgot').serialize();
		
		$.ajax({
			url : '/uj/forgot',
			method : 'post',
			cache : false,
			data : serData,
			dataType : 'json',
			success : function(res) {
			/* 	 alert(res.ok ? '로그인 성공' : '로그인 실패');  */ 
				 if(res.ok) {
					alert('회원정보를 변경해주세요.');
					location.href = "/uj/edit"; 
				} else {
					alert('입력된 정보가 옳바르지 않습니다.');
				} 
			},
			error : function(xhr, status, err) {
				alert('err: ' + err);
			} 
		});
		return false;
	}
	</script>
	<script>
		function login() {
			var serData = $('#loginForm').serialize();
			
			$.ajax({
				url : '/uj/login',
				method : 'post',
				cache : false,
				data : serData,
				dataType : 'json',
				success : function(res) {
				/* 	 alert(res.ok ? '로그인 성공' : '로그인 실패');  */ 
					 if(res.ok) {
						alert('로그인 성공!');
						location.href = "/uj/home"; 
					} else {
						alert('로그인 실패');
					} 
				},
				error : function(xhr, status, err) {
					alert('err: ' + err);
				} 
			});
			return false;
		}
	</script>
	
	<div class="form">
    <div class="form-toggle"></div>  
  <div class="form-panel one">
    <div class="form-header">
      <h1>Account Login</h1>
    </div>
    <div class="form-content">
      <form id = "loginForm" >
        <div class="form-group">
          <label for="uid">아이디</label>
          <input type="text" id="uid" name="uid" required="required"/>
        </div>
        <div class="form-group">
          <label for="pwd">비밀번호</label>
          <input type="password" id="pwd" name="pwd" required="required"/>
        </div>
        <div class="form-group">
          <label class="form-remember">
           <!--  <input type="checkbox"/>Remember Me -->
          </label><a class="form-recovery" >Forgot Password? -></a>
          			<%-- <a class="link_del" href="javascript:delete_file(${f.num});">삭제</a> --%>
        </div>
        <div class="form-group">
          <button type="button" onclick = "login()">로그인</button>
        </div>
      </form>
    </div>
  </div>
   
   <div class="form-panel two">
    <div class="form-header">
       <h1>Forgot Account</h1> 
    </div>
    <div class="form-content">
      <form id = "forgot">
        <div class="form-group">
           <label for="username">아이디</label>
          <input type="text" id="uid" name="uid" required="required"/> 
        </div>
        <div class="form-group">
           <label for="password">이름</label>
          <input type="text" id="name" name="name" required="required"/> 
        </div>
        <div class="form-group">
           <label for="cpassword">이메일</label>
          <input type="email" id="email" name="email" required="required"/> 
        </div>
        <div class="form-group">
            <label for="">정보를 입력해주세요.</label>
          <input type="hidden" id="" name="" />  
        </div>
        <div class="form-group">
            <label for=""></label>
          <input type="hidden" />  
        </div>
        <div class="form-group">
           <button type="submit" onclick = "forgot()">찾기</button> 
        </div>
      </form>
    </div>
  </div> 
</div>
<div class="pen-footer"><a href="/uj/home" target="_blank"><i class="material-icons">arrow_backward</i>뒤로 가기</a><a href="/uj/add" target="_blank">회원가입<i class="material-icons">arrow_forward</i></a></div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://codepen.io/andytran/pen/vLmRVp.js'></script>

    <script src="js/index.js"></script>
</body>
</html>