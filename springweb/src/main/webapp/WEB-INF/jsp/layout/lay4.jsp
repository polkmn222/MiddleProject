<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
	<script>
		function selectChange() {
			
			var hobby = $('#hobby').val();
			//alert('선택한 취미 : ' + hobby);
			
			var obj = {};
			obj.hobby = hobby;
			
			$.ajax({
				url:'/layout/lay4',
				method:'post',
				cache:false,
				data:obj,
				dataType:'json',
				success:function(res){
					 
					//alert(JSON.stringify(res));
					$('#res').text(res.msg);
					
				},
				error:function(xhr, status, err) {
					alert('에러: ' + err);
				}
			});
			
		}
		
		var delFile = new Array();

		function removeFile(elemId)
		{
			//alert(elemId);
			delFile.push(elemId);
			$('#'+elemId).remove();
		}

		function updateBoard() {
			// 수정된 글 데이터 
			// 수정된 첨부파일
			var obj = {};
			obj.delfile = delFile; // 배열을 json 오브젝트의 속성에 할당
			$.ajax({
				url :'/layout/arr',
				method:'post',
				cache:false,
				data:obj,
				dataType:'json',
				success:function(res){
					alert(JSON.stringify(res));
				},
				error:function(xhr, status, err){
					alert("에러"+err);
				}
			});
			return false;
		}
		
		function getTable() {
			$.ajax({
				url:'/layout/lay5',
				method:'post',
				cache:false,
				data:{'a':'b'},
				dataType:'text',
				success:function(res){
					//alert(res);
					$('#resTable').html(res);
				},
				error:function(xhr,status,err){
					alert('에러:' + err);
				}
			});
		}
		
		
	</script>
</head>
<body>
	<h3>SELECT 이벤트 처리하기 예제</h3>
	<form>
		<select id="hobby" name = "hobby" onchange ="selectChange();">
		  <option value = "game">게임</option>
		  <option value = "nap">낮잠</option>
		  <option value = "movie">영화</option>
		  <option value = "travel">여행</option>
		</select>
	</form>
	
	<form onsubmit="return updateBoard();">
	<div id="file1"><label>file 1</label>
		<button type="button" onclick="removeFile('file1');">삭제</button></div>
	<div id="file2"><label>file 2</label>
		<button type="button" onclick="removeFile('file2');">삭제</button></div>
	<div id="file3"><label>file 3</label>
		<button type="button" onclick="removeFile('file3');">삭제</button></div>
	<p>
	<button type="submit" >저장</button>
</form>
<hr>
<p>
	<a href="javascript:getTable();">AJAX 요청으로 html 응답받기</a>
	<p>
	<div id="resTable"></div>
	
	<div id = "res"></div>
	
</body>
</html>