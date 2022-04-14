<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head> <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>예약하기</title> 
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
		.button1 { width : 90px; height: 37px;  }	
		.button2 { width : 90px; height: 37px; 
					margin-top: 0px;

    				margin-right: 0px;

    				margin-bottom: 0px;

    				margin-left: 350px; 
    				position : absolute;
    				}	
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
 		},  false);
 	});
 },
 false);
	
 	 /* var rvcheck = false;  */
 	function reserv() {
		
 		var rp = $('#rp').val();
		var rinfo = $('#rinfo').val();
		var rtime = $('#rtime').val();
		/* var total = $('#total').val();
	
		alert(total);
		if(total.length>5) {
			alert('만석입니다.');
			return false;
		} */
		
		if(rp.length < 1) {
			return false;
		}
		if(rinfo=="") {
			return false;
		} 
		if(rtime=="") {
			return false;
		}
		
		
 		
		 if(!confirm('정말로 예약하시겠습니까?')) {
			alert('정상적으로 취소했습니다.');
			return false;
		} 
		 
		 /* if(rvcheck == false) {
				alert('예약 가능 여부를 확인을 해주세요');
				return false;
			}  */
	
		  
		  var serData = $('#validation-form').serialize();
		  
		
		 $.ajax({
			url : '/uj/reservation',
			method : 'post',
			cache : false,
			data : serData,
			dataType : 'json',
			success : function(res) {
				 if(res.rv) {
					 alert('예약 성공!');
				 } else {
					 alert('만석입니다.');
					 location.reload();
					 return false;
				 }
					 location.href = "/uj/rlist"; 
			},
			error : function(xhr, status, err) {
				alert('err' + err);
			} 
		}); 
		return false;  
	}
 	
 	/* function idchecked() {
			
 		var serData = $('#uid').serialize();
		
		$.ajax({
			url : '/uj/checkNum',
			method : 'post',
			cache : false,
			data : serData,
			dataType : 'json',
			success : function(res) {
				 if(res.check) {
					 alert('예약 가능합니다.');
					 rvcheck = true;
				 } else {
					 alert('만석입니다.');
				 }
			},
			
			error : function(xhr, status, err) {
				
				 alert(err); 
			} 
		}); 
		
} */
 	
 	   
	</script>
	 						

<div class="container">
<div class="input-form-backgroud row">
<div class="input-form col-md-12 mx-auto">
<h4 class="mb-3">예약하기</h4>
<form class="validation-form" novalidate id = "validation-form"    onsubmit = "return reserv();">
<input type = hidden id = "ruid" name = "ruid" value = "${user.uid}">
<div class="row"> 
<div class="col-md-10 mb-3">
				<%-- 	 <c:forEach var = "r" items="${list }">
			
					<input type = number id = "total" name = "total" value = "${r.total}">
				 
					</c:forEach> --%>
					  
	
	<label for="ruid">예약자 : </label><span> ${user.uid } </span>
	</div>
	</div>
		
		<div class="mb-3">
	    <label for="rp">인원</label>
	    <input type="number" class="form-control" id="rp" name = "rp" min='1' max='10'  required>
	    <div class="invalid-feedback"> 인원을 입력해주세요. </div> </div> 

	            	 
	        	<div class="mb-3">
	        	<label for="rinfo">요일</label>
	             <input type="date" class="form-control" id="rinfo" name = "rinfo" required>
	                    
	            <div class="invalid-feedback"> 요일을 선택해주세요.</div> </div> 
	            
	            <div class="mb-3">
	    		<label for="title">시간</label>
	    		<select id="rtime" name = "rtime" class="form-control" required>
					<option id ="rtime"  value = "런치 : 11시30분">런치 : 11시30분</option>
					<option id ="rtime"  value = "런치 : 13시05분">런치 : 13시05분</option>
					<option id ="rtime"  value = "디너 : 17시30분">디너 : 17시30분</option>
					<option id ="rtime"  value = "디너 : 19시05분">디너 : 19시05분</option>
				</select>
	    		
	    		<div class="invalid-feedback"> 시간을 선택해주세요. </div> </div>
	            
	
	                     		<div>
	                         	 <button class = "button1"  type="submit">예약</button>
	                         	 <button class = "button1" type="reset">초기화</button>
	                         	 <button class = "button2" type="button"
	                         							onclick="location.href='/uj/rlist';" >예약목록</button>
	              				</div>
	                         	 
	                            
</form></div></div> 
	<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2022 PSY</p> </footer> </div>
</body>
</html>

