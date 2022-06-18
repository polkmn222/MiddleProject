<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>글쓰기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/addForm.css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">글쓰기</h4>
				<form class="validation-form" id="validation-form" action="/uj/badd" enctype="multipart/form-data" onsubmit="return add();" novalidate>
					<input type=hidden id="author" name="author" value="${user.uid}">
					
					<div class="row">
						<div class="col-md-10 mb-3">
							<label for="author">작성자 : </label><span> ${user.uid } </span>
						</div>
					</div>

					<div class="mb-3">
						<label for="title">글 제목</label> <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." required>
						<div class="invalid-feedback">제목을 입력해주세요.</div>
					</div>
					
					<div class="mb-3" style="width: 96%; margin-left: 2%;">
						<label for="file" class="form-label"></label> 
						<input type="file" id="image" name="mfiles" accept="image/*" onchange="setThumbnail(event);" multiple>
					</div>
					<div class="mb-3" style="width: 96%; margin-left: 2%;" id="image_container"></div>

					<div class="mb-3">
						<label for="contents">내용</label>
						<textarea class="form-control" id="contents" name="contents"
							cols="80" rows="15" placeholder="내용을 입력해주세요." required></textarea>
						<div class="invalid-feedback">내용을 입력해주세요.</div>
					</div>

					<div>
						<button class="button1" type="submit">글 작성</button>
						<button class="button1" type="reset">초기화</button>
						<button class="button2" type="button"
							onclick="location.href='/uj/list';">목록</button>
					</div>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 PSY</p>
		</footer>
	</div>
	<script src="/js/addForm.js"></script>
</body>
</html>