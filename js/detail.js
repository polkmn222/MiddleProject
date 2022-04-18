// 수정
function go(num) {

	var url = "/uj/bedit?num=" + num;
	location.href = url;
}

// 게시글 삭제
function del_board(num) {

	if (!confirm('정말 삭제 하시겠습니까?')) {
		return;
	}

	var obj = {};
	obj.num = num;

	$.ajax({
		url: '/uj/bdelete',
		method: 'post',
		cache: false,
		data: obj,
		dataType: 'json',
		success: function(res) {
			alert(res.deleted ? '삭제 성공' : '삭제 실패!');
			location.href = '/uj/list';
		},
		error: function(xhr, status, err) {
			alert('에러 : ' + err);
		}
	});
}

// 파일 삭제
function delete_file(num) {

	if (!confirm('정말로 삭제하시겠어요?')) {
		return;
	}
	var obj = {};
	obj.num = num;
	$.ajax({
		url: '/uj/file/delete',
		method: 'post',
		cache: false,
		data: obj,
		dataType: 'json',
		success: function(res) {
			alert(res.deleted ? '삭제 성공' : '삭제 실패');
			location.reload();
		},
		error: function(xhr, status, err) {
			alert('에러:' + err);
		}
	});
}

// 이미지 미리보기
function setThumbnail(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("style", "width:32%;height:width;");
			document.querySelector("div#image_container").appendChild(img);

		};

		console.log(image);
		reader.readAsDataURL(image);
	}
}