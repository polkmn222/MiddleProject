<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<style>
		#containner01 > div { width : 70px; 
			border : 1px solid black; 
			text-align: center; 
			margin-right: 5px;	
		}
		.left {
			float : left;
		}
		.right {
			float : right;
		}
		#containner02 {
			margin-top : 20px;
			width : 500px;
		}
		#dumb {
			clear : both;
		}
		#containner02 { margin-top : 20px; border : 1px solid black; padding : 5px; }
		#containner02 > img { float : left; margin-right : 10px; }
		#containner02::after { content :""; clear : both; display : table }
	</style>
</head>
<body>
	<div id = "containner01">
		<div class = "left">A</div>
		<div class = "left">B</div>
		<div class = "left">C</div>
		<div class = "right">D</div>
		<div class = "right">E</div>	
	</div>
	
	<div id = "dumb"></div>
	
	<div id = containner02>
		<img src = "/img/dog.jpg" style="width : 400px;">
		Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, ByeHi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye Hi, Hello, Bye
	</div>
</body>
</html>