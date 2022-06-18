<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
	h3 { width:fit-content; margin:10px auto; }
	form { width:fit-content; padding:1em; border:1px solid black; margin:0 auto; }
	label { display:inline-block; width: 5em; text-align: right; margin-right:20px; }
	div:last-child { margin-top:1em; text-align: center; }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>추가 양식</title>
	<script>
		 var idcheck = false; 
		function addUser() {
			
			 if(!confirm('정말로 저장하시겠습니까?')) {
				alert('정상적으로 취소했습니다.');
				return false;
			} 
			 if(idcheck == false) {
				alert('아이디 중복확인을 해주세요');
				return false;
			} 
			
			 var serData = $('#addForm').serialize();
			
			$.ajax({
				url : '/mb/add',
				method : 'post',
				cache : false,
				data : serData,
				dataType : 'json',
				success : function(res) {
					 if(res.add) {
						 alert('저장 성공!');
					 } else {
						 alert('저장 실패');						 
					 }
						 location.href = "/mb/list"; 
				},
				error : function(xhr, status, err) {
					alert('중복되는 아이디입니다.');
				} 
			});
			return false; 
		}
		function idchecked() {
			
			var serData = $('#uid').serialize();
			/* alert(serData); */
			$.ajax({
				url : '/mb/idcheck',
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
					alert('err : ' + err);
				} 
			});
			
		   return false;
}  
		   
	</script>
</head>
<body>
	<h3>추가 양식</h3>
	<form id = "addForm"  onsubmit = "return addUser();"> 
			<div><label for ="uid">I D</label> <input type = "text" id="uid" name = "uid" value = "smith"> 
			  <button type = "button" onclick = "idchecked()">중복확인</button>
			 </div>
			<div><label for ="pwd">Password</label> <input type = "text" id="pwd" name = "pwd" value = "smithpwd"> </div>
			<div><label for ="name">Name</label> <input type = "text" id="name" name = "name" value = "smith"> </div>
			<div><label for ="phone">Phone</label> <input type = "text" id="phone" name = "phone" value = "010-1234-5678"> </div>
			<div>
				<button type = "submit">저장</button>
				<button type = "reset">초기화</button>
				<button type="button" 
					onclick="location.href='/mb/list';">목록</button>
			</div>
	</form>
</body>
</html>