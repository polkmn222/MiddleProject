<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>회원정보 수정</title> 
<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style> body { min-height: 100vh; background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
				 background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
				 background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
				 background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
				 background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); } 
		.input-form { max-width: 680px; margin-top: 80px; padding: 32px; background: #fff;
					 -webkit-border-radius: 10px; -moz-border-radius: 10px; border-radius: 10px;
					 -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
					  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) } 
		.button1 { width : 90px; height: 37px; margin : 33px 0; }
		span {
			font-size : 24px;
		}			  
</style> 
</head> 
<body>
 <script>
 	window.addEventListener('load', () => { 
 		const forms = document.getElementsByClassName('validation-form'); 
 		
 		Array.prototype.filter.call(forms, (form) => { 
 			form.addEventListener('submit', function (event) { 
 				if (form.checkValidity() === false) { 
 					event.preventDefault(); event.stopPropagation(); 
 				} 
 				
 		form.classList.add('was-validated');
 		}, false);
 	});
 },
 false);

 </script>
	<script>
	function updateUser() {
		var serData = $('#updateForm').serialize();
		$.ajax({
			url:'/uj/update',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				if(res.updated) {
					alert('수정성공!');
				} else {
					alert('수정 실패');
				}
				location.href = "/uj/home";
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
		return false;
	}
	
	</script>
	<script>
	
	function del_user(uid){
		
		if(!confirm('정말 삭제 하시겠습니까?')){
	         return;
	      }
	      
	      var obj = {};
	      obj.uid = uid;
	      /* alert(obj.uid); */
	      
	      $.ajax({
	         url : '/uj/delete',
	         method : 'post',
	         cache : false,
	         data : obj,
	         dataType : 'json',
	         success : function(res){
	            alert(res.deleted ? '삭제 성공' : '삭제 실패!');
	            location.href = '/uj/logout';
	         },
	         error : function(xhr, status, err){
	            alert('에러 : ' + err);
	         }
	      });
	}
	</script>
	
<div class="container">
<div class="input-form-backgroud row">
<div class="input-form col-md-12 mx-auto">
<h4 class="mb-3">회원정보 수정</h4>
<form class="validation-form" novalidate id = "updateForm" >
 <div class="row"> 
<div class="col-md-10 mb-3">
	<input type="hidden" id="uid" name="uid" value="${user.uid}">
	<label for="uid">아이디 :<span> ${user.uid}</span></label>
	</div>
	</div>
		
		<!-- <div class="row"> --> 
		<div class="mb-3">
	    <label for="pwd">비밀번호</label>
	    <input type="password" class="form-control" id="pwd" name = "pwd" minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" placeholder="4~12자의 영문 대소문자와 숫자로만 입력해주세요." value="" required>
	    <div class="invalid-feedback"> 4~12자의 영문 대소문자와 숫자로만 입력해주세요. </div> </div> <!-- </div>  -->
		
		<!-- <div class="row"> --> 
		<div class="mb-3">
	    <label for="name">이름 :<span> ${user.name}</span></label>
	    
	    </div> <!-- </div>  -->
	
		
	    	
	    	<div class="mb-3"> 
	        <label for="phone">전화번호</label>
	        <input type="tel" class="form-control" id="phone" name = "phone" placeholder="010-1234-5678" pattern = "[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
	        <div class="invalid-feedback"> 전화번호 입력해주세요. </div> </div> 
	        
	        	<div class="mb-3">
	        	<label for="address">주소 :<span> ${user.address}</span></label>
	            </div>
	        		<div class="mb-3">
	        		<label for="email">이메일 :<span> ${user.email}</span></label>
	            	</div>
	            <!-- 	<div class="mb-3"> <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
	                 <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요."> </div> -->
	            	
	            	<div class="row"> <div class="col-md-8 mb-3"> 
	                  </div>
	                	<!-- <div class="col-md-4 mb-3"> <label for="code">추천인 코드</label> <input type="text" class="form-control" id="code" placeholder="" required>
	                        <div class="invalid-feedback"> 추천인 코드를 입력해주세요. </div> </div> --></div>
	                         <hr class="mb-4"> <div class="custom-control custom-checkbox">
	                         <input type="checkbox" class="custom-control-input" id="aggrement" required>
	                         <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> </div>
	                         	<div class="mb-4"></div> 
	                         	<button class="btn btn-primary btn-lg btn-block" onclick = "updateUser();">수정</button>
	                         	<button class="btn btn-primary btn-lg btn-block" type="reset">초기화</button>
	                         	<button class="btn btn-primary btn-lg btn-block" onclick = "del_user('${user.uid }');">삭제</button>
	                         	<button class="btn btn-primary btn-lg btn-block" onclick="location.href='/uj/home';">홈</button>
	                         	
	                            
</form></div></div> 
	<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2022 PSY</p> </footer> </div>
</body>
</html>

