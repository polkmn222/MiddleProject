<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Display Table</title>
<style type="text/css">
	#tb { display: table; border:1px solid black; width:100%; }
	.head { display: table-row; background-color:#eeeeee; font-weight: bolder;}
	.tr { display: table-row; }
	.td { display:table-cell; border-bottom:1px dashed black; text-align: center;
		border-right: 1px solid black;
	}
</style>
</head>
<body>
<h3>Display Table examples</h3>
	<div id="tb">
		<div class="head"><div class="td">A</div><div class="td">B</div><div class="td">C</div></div>
		<div class="tr"><div class="td"><img src="/images/mountain.jpg"></div><div class="td"><img src="/images/mountain.jpg"></div><div class="td"><img src="/images/mountain.jpg"></div></div>
		<div class="tr"><div class="td"><img src="/images/mountain.jpg"></div><div class="td"><img src="/images/mountain.jpg"></div><div class="td"><img src="/images/mountain.jpg"></div></div>
		<div class="tr"><div class="td"><img src="/images/mountain.jpg"></div><div class="td"><img src="/images/mountain.jpg"></div><div class="td"><img src="/images/mountain.jpg"></div></div>
	</div>
	
	<h3>Table</h3>
	<table>
		<tr><th>A</th><th>B</th><th>C</th></tr>
		<tr><td><img src="/images/mountain.jpg"></td><td><img src="/images/mountain.jpg"></td><td><img src="/images/mountain.jpg"></td></tr>
		<tr><td><img src="/images/mountain.jpg"></td><td><img src="/images/mountain.jpg"></td><td><img src="/images/mountain.jpg"></td></tr>
		<tr><td><img src="/images/mountain.jpg"></td><td><img src="/images/mountain.jpg"></td><td><img src="/images/mountain.jpg"></td></tr>
	</table>
</body>
</body>
</html>