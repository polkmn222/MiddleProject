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
<title>게시판정보 수정</title>
	 <script>
	 
	 function updateBoard() {
			var serData = $('#updateForm').serialize();
			/* alert(serData); */
			$.ajax({
				url:'/bbs/update',
				method:'post',
				cache:false,
				data:serData,
				dataType:'json',
				success:function(res){
					/* alert(res); */
					 if(res.updated) {
						alert('수정성공!');
					} else {
						alert('수정 실패');
					}
					location.href = "/bbs/list"; 
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
	<h3>게시판 정보를 변경해주세요</h3>
	<form id="updateForm" onsubmit="return updateBoard();">
	 <input type="hidden" id="num" name="num" value="${bbs.num}"> 
	<div><label>작성자</label>${bbs.author}</div>
	<%-- <div><label>작성일</label>${bbs.bdate}</div> --%>
	<div><label>제 목</label>${bbs.title}
		<%-- <input type="text" id="title" name="title" value="${bbs.title}"> --%>
	</div>
	<div><label>글 내용</label>
		<div><label for="contents"></label><textarea name="contents" cols="40" rows="5"></textarea></div>
	</div>
	<div><label>첨부파일</label><input type="file" name="files" multiple></div>
		<div>
			<button type = "submit">저장</button>
			<button type = "reset">초기화</button>
			<button type="button" 
					onclick="location.href='/bbs/list';">목록</button>
			</div>
	</form>
</body>
</html>