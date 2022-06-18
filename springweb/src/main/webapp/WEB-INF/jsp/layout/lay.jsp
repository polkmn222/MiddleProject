<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CSS Position Property Test</title>
	<style>
		 div { display : inline-block; } 
		div { width : 100px; height: 100px; border : 1px solid black; }
		#div1 { background-color : red;  position : relative; }
		#div2 { background-color : green; top : 50px; left : 50px; position : relative; }
		#div3 { background-color : blue; top : 50px; left : 50px; position : relative; }
		#div4 { background-color : red;  position : relative; }
		#div5 { background-color : green; top : 78px;  left : 50px; position : relative; }
		#div6 { background-color : blue;  top : 78px; left : 50px; position : relative; }
		#div7 { background-color : green; top : 100px; left : 200px; position : absolute; }
		#div8 { background-color : blue; top : 100px; left : 200px; position : absolute; }
	</style>
</head>
<body>
	<h3>CSS Position Test</h3>
	<!-- 
		main, header, footer, article, section, aside, nav...
	 -->
	 <div id= "div1">DIV1
	 	<div id= "div2">DIV2
	 		<div id= "div3">DIV3</div>	 	 
	 	</div>
	 </div>
	 
	 <div id = "div4">DIV4
	 <div id = "div5">DIV5</div>
	 <div id = "div6">DIV6</div>
	 </div>
	 
	 <div id = "div7">DIV7</div>
	 <div id = "div8">DIV8</div>
	 
</body>
</html>