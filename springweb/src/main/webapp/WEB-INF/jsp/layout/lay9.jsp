<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CSS Float Property</title>
<style type="text/css">
	#container01 > div { width:70px; border:1px solid black; 
		text-align: center; margin-right:5px; }
	.left { float:left; }
	.right { float:right; }
	#dumb { clear:both; }
	#container02 { margin-top:20px; border:1px solid black; padding:5px; }
	#container02 > img { float:left; margin-right:10px; }
 	#container02::after { content:""; clear:both; display:table; }
</style>
</head>
<body>

<div id="container01">
	<div class="left">A</div>
	<div class="left">B</div>
	<div class="left">C</div>
	<div class="right">D</div>
	<div class="right">E</div>
</div>
<div id="dumb"> </div>

<div id="container02">
	<img src="/images/mountain.jpg">
	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Mauris ante ligula, facilisis sed ornare eu, lobortis in odio. Praesent convallis urna a lacus interdum ut hendrerit risus congue. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta. Cras ac leo purus. Mauris quis diam velit.
</div>
</body>
</html>