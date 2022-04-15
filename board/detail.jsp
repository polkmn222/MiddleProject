<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  			display: block; 
		}
		
		div[contenteditable=true] {
			  border: 1px solid #ddd;
			  color : #333;
			  font-size: 20px;
			  width: 600px;
			  height: 300px;
			  padding: 5px;
		}
		
/* 		a.btn{
    
    width:80px;
    line-height:30px;
    text-align:center;
    background-color:lightgray;
    color:black;
    border: 1px solid #ddd;
} */
a { text-decoration: none; color:blue; }
	a.link_del { border:1px solid red; color:red; font-size: x-small;}
				  
</style> 
</head> 
<body>
 	<script>
	function go(num){
		 /* alert(num); */ 
		var url = "/uj/bedit?num="+num;
	      location.href=url;
	}
	
	function del_board(num){
		
		if(!confirm('정말 삭제 하시겠습니까?')){
	         return;
	      }
	      
	      var obj = {};
	      obj.num = num;
	      /* alert(obj.uid); */
	      
	      $.ajax({
	         url : '/uj/bdelete',
	         method : 'post',
	         cache : false,
	         data : obj,
	         dataType : 'json',
	         success : function(res){
	            alert(res.deleted ? '삭제 성공' : '삭제 실패!');
	            location.href = '/uj/list';
	         },
	         error : function(xhr, status, err){
	            alert('에러 : ' + err);
	         }
	      });
	}
	</script>
	<script>
	function delete_file(num) {
		
		if(!confirm('정말로 삭제하시겠어요?')){
			return;
		}
		var obj = {};
		obj.num = num;
		$.ajax({
			url:'/uj/file/delete',
			method:'post',
			cache:false,
			data:obj,
			dataType:'json',
			success:function(res){
				alert(res.deleted ? '삭제 성공':'삭제 실패');
				location.reload();
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	}
</script>
	<!-- <script> function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_container").appendChild(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		 
		} 
	
	</script> -->
	<script>
function setThumbnail(event) {
   for (var image of event.target.files) {
      var reader = new FileReader();
 
      reader.onload = function(event) {
         var img = document.createElement("img");
         img.setAttribute("src", event.target.result);
         img.setAttribute("style", "width:32%;height:width;");         
         document.querySelector("div#image_container").appendChild(img);         

         
         //document.querySelector("div#images").appendChild(img);
         
         /* var $li = $("<li>");
         img.appendTo($li);
         $li.appendTo($("#imageinput"));
         //var $li = $("<li>").appendTo($("#imageinput")); */
         
         //document.querySelector("div#image_container").appendChild(img).appendTo($li);
      };
      
      console.log(image);
      reader.readAsDataURL(image);
   }
}

</script>


	
<div class="container">
<div class="input-form-backgroud row">
<div class="input-form col-md-12 mx-auto">
<FORM ENCTYPE="multipart/form-data" >

<h4 class="mb-3">게시판</h4>
<input type = hidden id = "author" name = "author" value = "${user.uid}">
<div class="row"> 
<div class="col-md-10 mb-3">
	<input type = "hidden" id ="num" name = "num" value = "${bbs.num }">
	<label for="author">작성자 : </label><span> ${bbs.author } </span>
	</div>
	</div>
		<div class="mb-3">
	    <label for="title">글 제목 : </label><span>${bbs.title }</span>
	     </div> 
				
			
	    <c:choose>
			<c:when test="${fn:length(bbs.attach)>0}">
				<c:forEach var="f" items="${bbs.attach}">
				
					
						<%-- <a href="/uj/file/download/${f.num}">${f.filename}</a> --%>
					
					<a  href="/uj/file/download/${f.num}">	<img src="/images/${f.filename}"  width="100px" height="100px"  alt="" class="thumb" /> </a>
					 &nbsp;  	<a class="link_del" href="javascript:delete_file(${f.num});">삭제</a>
					
					
				</c:forEach>
			</c:when>
		<c:otherwise>
			첨부파일 없음
		</c:otherwise>
		</c:choose>
	        	<div class="mb-3">
	        	<label for="contents">내용 : </label> <span>${bbs.contents }</span>

	            </div>
		
	            	<div>
	            	
	            	</div>
	                     		<div>
	                         	
	                         	 
	                         	 <button class = "button1" type="button" onclick = "go('${bbs.num }');">수정</button>
	                         	 <button class = "button1" type="button" onclick = "del_board('${bbs.num }');">삭제</button>
	                         	 <button class = "button2" type="button"
	                         							onclick="location.href='/uj/list';" >목록</button>
	              				</div>
	                         
								
	       </FORM>                  	 
	                            
</div></div> 
	<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2022 PSY</p> </footer> </div>
</body>
</html>

