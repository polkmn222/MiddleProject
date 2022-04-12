<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>회원가입 화면</title> 
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

		 var idcheck = false; 
		 
		 
	function addUser() {
			var uid_val = $("#uid").val();
			var pwd_val = $("#pwd").val();
			var name_val = $("#name").val();
			var email_val = $("#email").val();
    	 	
    	 	if(uid_val=="") {
    	 		return false;
    	 	}
    	 	if(pwd_val=="") {
    	 		return false;
    	 	}
    	 	if(name_val=="") {
    	 		return false;
    	 	}
    	 	if(email_val=="") {
    	 		return false;
    	 	}
    	 	
    	 	 if (uid_val.length > 13 || uid.val_length <4) {
               
                return false;
            } 
    	 	 if (pwd_val.length > 13 || pwd.val_length <4) {
               
                return false;
            } 
    	 	 if (name_val.length > 6 || name_val.length <2) {
               
                return false;
            } 
    	 	
    	 	if(!idTest(uid_val)) {
	                return false;
			}
    	 	if(!pwdTest(pwd_val)) {
	                return false;
			}
    	 	if(!nameTest(name_val)) {
	                return false;
			}
    	 	if(!emailTest(email_val)) {
	                return false;
			}
    	 	 

    	 	 
			 if(!confirm('정말로 저장하시겠습니까?')) {
				alert('정상적으로 취소했습니다.');
				return false;
			} 
			 if(idcheck == false) {
				alert('아이디 중복확인을 해주세요');
				return false;
			} 
			 
			
			 var serData = $('#validation-form').serialize();
			
			$.ajax({
				url : '/uj/add',
				method : 'post',
				cache : false,
				data : serData,
				dataType : 'json',
				success : function(res) {
					 if(res.add) {
						 alert('가입 되었습니다!');
					 } else {
						 alert('가입에 실패했습니다.');						 
					 }
						 location.href = "/uj/login"; 
				},
				error : function(xhr, status, err) {
					alert('err ' + err);
				} 
			});
			return false; 
		}
		
		function idchecked() {
 			var serData = $('#uid').serialize();
			var uid_val = $("#uid").val();
			
			if (uid_val.length > 13 || uid_val.length <4) {
	             alert('양식에 맞춰주세요.');
                return false;
            } 
			//checkUserId();
			// alert(checkUserId()); 
			 //alert('bye');
			if(!idTest(uid_val)) {
				 alert('양식에 맞춰주세요.');
	                return false;
			}
				
			
			$.ajax({
				url : '/uj/idcheck',
				method : 'post',
				cache : false,
				data : serData,
				dataType : 'json',
				success : function(res) {
					 if(res.check) {
						 alert('사용 가능한 아이디입니다.');
						 idcheck = true;
					 } else {
						 alert('중복된 아이디입니다.');
					 }
				},
				
				error : function(xhr, status, err) {
					
					 alert(err); 
				} 
			}); 
			
		   //return false;
}
		
function idTest(uid){
	//alert("돌아갑니다");
	var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
    if (!idRegExp.test(uid)) {
        /*alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");*/
        
        //alert('양식에 맞춰주세요.');
        return false;
    }
    return true; //확인이 완료되었을 때
}

function pwdTest(pwd) {
  
    var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
    if (!password1RegExp.test(pwd)) {
       
        return false;
    }
    
}

function emailTest(email) {
    
    var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
    if (!emailRegExp.test(email)) {
      
        return false;
    }
    return true; //확인이 완료되었을 때
}

function nameTest(name) {
 
    var nameRegExp = /^[가-힣]{2,5}$/;
    if (!nameRegExp.test(name)) {
        
        return false;
    }
    return true; //확인이 완료되었을 때
}
	
	</script>
<div class="container">
<div class="input-form-backgroud row">
<div class="input-form col-md-12 mx-auto">
<h4 class="mb-3">회원가입</h4>
<form class="validation-form" novalidate id = "validation-form"  onsubmit = "return addUser();">
 <div class="row"> 
<div class="col-md-10 mb-3">
	
	<label for="uid">아이디</label>
	<input type="text" class="form-control" id="uid" name = "uid"  minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" placeholder="4~12자의 영문 대소문자와 숫자로만 입력해주세요." value="" required>
	<div class="invalid-feedback"> 4~12자의 영문 대소문자와 숫자로만 입력해주세요. </div> 
	</div>
		<button type ="button" class="button button1"  onclick = "idchecked()">중복확인</button>
	</div>
		
		<!-- <div class="row"> --> 
		<div class="mb-3">
	    <label for="pwd">비밀번호</label>
	    <input type="password" class="form-control" id="pwd" name = "pwd" minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" placeholder="4~12자의 영문 대소문자와 숫자로만 입력해주세요." value="" required>
	    <div class="invalid-feedback"> 4~12자의 영문 대소문자와 숫자로만 입력해주세요. </div> </div> <!-- </div>  -->
		
		<!-- <div class="row"> --> 
		<div class="mb-3">
	    <label for="name">이름</label>
	    <input type="text" class="form-control" id="name" name = "name" minlength="2" maxlength="12" size="15" placeholder="이름은 두 글자 이상입니다." value="" required>
	    <div class="invalid-feedback"> 이름을 입력해주세요. </div> </div> <!-- </div>  -->
	
		
	    	
	    	<div class="mb-3"> 
	        <label for="phone">전화번호</label>
	        <input type="tel" class="form-control" id="phone" name = "phone" placeholder="010-1234-5678" pattern = "[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
	        <div class="invalid-feedback"> 전화번호 입력해주세요. </div> </div> 
	    	
	    	<div class="mb-3"> 
	        <label for="email">이메일</label>
	        <input type="email" class="form-control" id="email" name = "email" placeholder="abc@abc.com" pattern = "^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$" required>
	        <div class="invalid-feedback"> 이메일을 입력해주세요. </div> </div> 
	        
	        	<div class="mb-3">
	        	<label for="address">주소</label>
	            <input type="text" class="form-control" id="address" name = "address" placeholder="서울특별시 강남구" required>
	            <div class="invalid-feedback"> 주소를 입력해주세요. </div> </div>
	            <!-- 	<div class="mb-3"> <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
	                 <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요."> </div> -->
	            	
	            	<div class="row"> <div class="col-md-8 mb-3"> <label for="root">가입 경로</label> <select class="custom-select d-block w-100" id="root" name = "root">
	                <option value=""></option> <option>검색</option> <option>지인추천</option> <option>SNS</option> </select> <div class="invalid-feedback"> 가입 경로를 선택해주세요. </div> </div>
	                	<!-- <div class="col-md-4 mb-3"> <label for="code">추천인 코드</label> <input type="text" class="form-control" id="code" placeholder="" required>
	                        <div class="invalid-feedback"> 추천인 코드를 입력해주세요. </div> </div> --></div>
	                         <hr class="mb-4"> <div class="custom-control custom-checkbox">
	                         <input type="checkbox" class="custom-control-input" id="aggrement" required>
	                         <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> </div>
	                         	<div class="mb-4"></div> <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
	                            
</form></div></div> 
	<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2022 PSY</p> </footer> </div>
</body>
</html>

