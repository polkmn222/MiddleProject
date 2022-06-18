<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Upload Form</title>
</head>
<body>
	<h3>Spring boot 파일 업로드 테스트</h3>

	<form action="upload" method="post" enctype="multipart/form-data">
	   작성자 <input type="text" name="author" value="smith"><br>
	   File <input type="file" name="files" multiple="multiple"><br>
	   <button type="submit">업로드</button>
	</form>

</body>
</html>