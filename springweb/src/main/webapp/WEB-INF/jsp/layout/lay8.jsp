<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Drag and Drop examples</title>
<style type="text/css">
	.container { display:flex; padding:1em; width:500px;}
	.container > div { border:1px solid black; display:inline-block; 
			width:220px; margin:1em; }
	#target { width:1000px;  }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
function dragstart_handler(ev) {
	ev.dataTransfer.dropEffect = "copy";
	console.log("dragStart");
	// 데이터 전달 객체에 대상 요소의 id를 추가합니다.
	ev.dataTransfer.setData("text/plain", ev.target.id);
	
	if(ev.target instanceof Image){
		ev.dataTransfer.setDragImage(ev.target, 10, 10); //드래그 시 마우스포인터 위치
	}
}

function dragover_handler(ev) {
	 ev.preventDefault();
	 // dropEffect를 move, copy 등으로 설정.
	 ev.dataTransfer.dropEffect = "copy";
}

function drop_handler(ev) {
	ev.preventDefault();
	// 대상의 id를 가져와 대상 DOM에 움직인 요소를 추가합니다.
	const data = ev.dataTransfer.getData("text/plain");
	var elem = document.getElementById(data)
	ev.target.appendChild(elem);
}

function dragend_handler(evt) {
	//alert('드래그 종료');
}

window.addEventListener('DOMContentLoaded', () => {
	// id를 통해 element를 가져옵니다.
	const element1 = document.getElementById("item1");
	// 'dragstart' 이벤트 리스터를 추가합니다.
	element1.addEventListener("dragstart", dragstart_handler);
	
	const element2 = document.getElementById("item2");
	element2.addEventListener("dragstart", dragstart_handler);
	
});

function showAll() {
	var arr = new Array();
	
	$('#target').children().each(function(index, item){
		arr.push($(item).attr('data-item'));
	});
	
	alert(arr);
	
	var obj = {};
	obj.fruits = arr;
}
</script>
</head>
<body>
<h3>Drag and Drop examples</h3>
<div class="container">
	<div id="item1"  draggable="true" data-item="수박"  data-price="10000">
		품목 : 수박
		가격 : 10000
	</div>
	<img src="/images/flower.jpg" id="item2"  draggable="true" data-item="flower"  data-price="5000">
	<div id="target" ondrop="drop_handler(event)" 
			ondragover="dragover_handler(event)"
			ondragend="dragend_handler(event)">
	</div>
</div>
<button type="button" onclick="showAll()">확인</button>
</body>
</html>