<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
	h3 { width:fit-content; margin:1em auto; }
	form { width:fit-content; margin:0 auto; padding:10px; border:1px solid black; }
	label { display:inline-block; width:70px; text-align: right; margin-right:20px;}
	form>div:last-child { text-align: center; margin-top:10px; }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>사원정보 수정</title>
	 <script>
	 function updateUser() {
			var serData = $('#updateForm').serialize();
			$.ajax({
				url:'/mb/update',
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
					location.href = "/mb/list";
				},
				error:function(xhr,status,err){
					alert('에러:'+err);
				}
			});
			return false;
		}
	</script>
</head>
<body>
	<h3>사용자 정보를 변경해주세요</h3>
	<form id="updateForm" onsubmit="return updateUser();">
	<input type="hidden" id="uid" name="uid" value="${user.uid}">
	<div><label>아이디</label>${user.uid}</div>
	<div><label>이 름</label>${user.name}</div>
	<div><label>전 화</label>
		<input type="text" id="phone" name="phone" value="${user.phone}">
	</div>
		<div>
			<button type = "submit">저장</button>
			<button type = "reset">초기화</button>
			<button type="button" 
					onclick="location.href='/mb/list';">목록</button>
			</div>
	</form>
</body>
</html>