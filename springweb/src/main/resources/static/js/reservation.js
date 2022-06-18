// 미 작성시 빨간 글씨
window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('validation-form');

	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function(event) {
			if (form.checkValidity() === false) {
				event.preventDefault(); event.stopPropagation();
			}

			form.classList.add('was-validated');
		}, false);
	});
},
	false);

// 예약하기
function reserv() {

	var rp = $('#rp').val();
	var rinfo = $('#rinfo').val();
	var rtime = $('#rtime').val();

	if (rp.length < 1) {
		return false;
	}
	if (rinfo == "") {
		return false;
	}
	if (rtime == "") {
		return false;
	}

	if (!confirm('정말로 예약하시겠습니까?')) {
		alert('정상적으로 취소했습니다.');
		return false;
	}

	var serData = $('#validation-form').serialize();

	$.ajax({
		url: '/uj/reservation',
		method: 'post',
		cache: false,
		data: serData,
		dataType: 'json',
		success: function(res) {
			if (res.rv) {
				alert('예약 성공!');
			} else {
				alert('만석입니다.');
				location.reload();
				return false;
			}
			location.href = "/uj/rlist";
		},
		error: function(xhr, status, err) {
			alert('err' + err);
		}
	});
	return false;
}