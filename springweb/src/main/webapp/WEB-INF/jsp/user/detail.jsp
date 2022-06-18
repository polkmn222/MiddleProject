<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사용자정보 상세보기</title>
	<style type="text/css">
		main div { width:fit-content; padding:10px; border-bottom: 1px solid black; }
		main div>label {display:inline-block; width:60px; text-align: right; margin:0 10px; }
		a { text-decoration: none; }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	
	function del_user(uid){
		
		if(!confirm('정말 삭제 하시겠습니까?')){
	         return;
	      }
	      
	      var obj = {};
	      obj.uid = uid;
	      /* alert(obj.uid); */
	      
	      $.ajax({
	         url : '/mb/delete',
	         method : 'post',
	         cache : false,
	         data : obj,
	         dataType : 'json',
	         success : function(res){
	            alert(res.deleted ? '삭제 성공' : '삭제 실패!');
	            location.href = '/mb/list';
	         },
	         error : function(xhr, status, err){
	            alert('에러 : ' + err);
	         }
	      });

	}
	</script>
</head>
<body>
	<main>
 	
	<h3>사용자정보 상세보기</h3>
		<div><label>아이디 :</label>${user.uid }</div>
		<div><label>암 호 : </label>${user.pwd }</div>
		<div><label>이 름 : </label>${user.name }</div>
		<div><label>번 호 : </label>${user.phone }</div>
		<p>
		<div>
		[<a href = "/mb/edit?userid=${user.uid }">수정</a>]
		[<a href = "javascript:del_user('${user.uid }');">삭제</a>]
		<button type = "button" onclick = "del_user('${user.uid }');">삭제</button>
		<button type="button" 
					onclick="location.href='/mb/list';">목록</button>
		</div>
 	
	</main>	
</body>
</html>