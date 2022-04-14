<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head> <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>글쓰기</title> 
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
		
		img {
			width : 100px;
		}
		
		[contenteditable=true]:empty:before{
  content: attr(placeholder);
  display: block; /* For Firefox */
}
div[contenteditable=true] {
  border: 1px solid #ddd;
  color : #333;
  font-size: 20px;
  width: 600px;
  height: 300px;
  padding: 5px;
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
		function update() {
			
			 if(!confirm('정말로 저장하시겠습니까?')) {
				alert('정상적으로 취소했습니다.');
				return false;
			} 
		
			/*  var serData = $('#addForm').serialize(); */
			  var formData = new FormData($("#updateForm")[0]); 
			$.ajax({
				url : '/uj/bupdate',
				method : 'post',
				enctype :'multipart/form-data',
				cache : false,
				data : formData,
				processData: false,
		        contentType: false,
				dataType : 'json',
				success : function(res) {
					 if(res.updated) {
						 alert('저장 성공!');
					 } else {
						 alert('저장 실패');						 
					 }
						 location.href = "/uj/list"; 
				},
				error : function(xhr, status, err) {
					alert('err' + err);
				} 
			});
			return false; 
		}
	  
		   
	</script>
	 <script> function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_container").appendChild(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		} 
	
	</script> 


	
<div class="container">
<div class="input-form-backgroud row">
<div class="input-form col-md-12 mx-auto">
<h4 class="mb-3">글쓰기</h4>
<form class="validation-form" novalidate id = "updateForm"  action="/uj/bupdate" enctype="multipart/form-data" onsubmit = "return update();">
<input type = hidden id = "author" name = "author" value = "${user.uid}">
<input type = hidden id = "num" name = "num" value = "${bbs.num}">
<div class="row"> 
<div class="col-md-10 mb-3">
	
	
	<label for="author">작성자 : </label><span> ${bbs.author } </span>
	
	 
	</div>
		
	</div>
		
		
		<!-- <div class="row"> --> 
		<div class="mb-3">
	    <label for="title">글 제목</label>
	    <input type="text" class="form-control" id="title" name = "title" placeholder="제목을 입력해주세요." value="" required>
	    <div class="invalid-feedback"> 제목을 입력해주세요. </div> </div> <!-- </div>  -->

	        
	        	<div class="mb-3">
	        	<label for="contents">내용</label>
	            	 <div id="image_container"></div>  
	             <!-- <div class="contents" id ="contents" name = "contents" inputype = "text" contenteditable="true"> -->
	                 <textarea id = "contents" name="contents" cols="80" rows="15"  required></textarea>   
	             
	            <div class="invalid-feedback"> 내용을 입력해주세요. </div> <!-- </div> -->
	            
	            	<!-- 	<input type ="file" name="mfiles" multiple="multiple" onchange="setThumbnail(event);"></div>  -->
				</div>
	            	  <div><label>첨부파일</label> <input type="file" name="mfiles" accept="image/*" onchange="setThumbnail(event);" multiple></div> 

	            	
	                     		<div>
	                         	 <button class = "button1"  type="submit">글 작성</button>
	                         	 <button class = "button1" type="reset">초기화</button>
	                         	 <button class = "button2" type="button"
	                         							onclick="location.href='/uj/list';" >목록</button>
	              				</div>
	                         	 
	                         	 
	                            
</form></div></div> 
	<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2022 PSY</p> </footer> </div>
</body>
</html>

