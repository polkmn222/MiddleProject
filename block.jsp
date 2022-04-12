<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name ="viewport" content = "width=device-width, initial-scale = 1">
 
<meta charset="utf-8">
	<style>
		canvas { background: #eee; }
		canvas {
    width: 500px;
    height: 500px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0px 0px 3px rgba(0, 0, 0, 0.5);
    position: relative;
    margin-left : 1em;
}
/* 스마트폰 세로 */
@media screen and (max-device-width: 320px){
    canvas {
        width: 80vmin;
        height: 80vmin;
    }
}
/* 태블릿 세로 */
@media screen and (min-width : 321px) and (max-width : 767px) and (orientation : portrait ) {
    canvas {
        width: 90vmin;
        height: 90vmin;
    }
}
/* iPad Pro 세로 */
@media screen and (min-width : 768px) and (orientation : portrait ) {
    canvas {
        width: 900px;
        height: 900px;
    }
}
/* 스마트폰 가로 */
@media screen and (max-width : 767px) and (orientation : landscape ) {
    canvas {
        width: 70vmax;
        height: 60vmin;
    }
}
/* 태블릿 가로 */
@media screen and (min-width : 768px) and (max-width : 1365px) and (orientation : landscape ) {
    canvas {
        width: 90vmax;
        height: 70vmin;
    }
}
/* iPad Pro 가로, 데스크탑 */
@media screen and (min-width : 1366px) and (max-width : 1599px) and (orientation : landscape ) {
    canvas {
        width: 90vmax;
        height: 80vmin;
    }
}
/* 큰 모니터 16:9 */
@media screen and (min-width : 1600px) {
    canvas {
        width: 1600px;
        height: 900px;
    }
    const { width, height } = canvas.getBoundingClientRect();
	canvas.width = width;
	canvas.height = height;
    
    
}
	</style>
<title>벽돌깨기 게임</title>
</head>
<body>
	<h3>마우스로 움직이세요.</h3>
	<canvas id="myCanvas" width="480" height="320"></canvas>
	<script src="/js/game.js"></script>
		<p>
		<button type = "button" onclick = "location.href='/uj/home';">홈</button>
	
</body>
</html>