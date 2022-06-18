// 예약 취소
function rdelete(num) {
	if (!confirm('정말로 예약을 취소하시겠어요?')) {
		return;
	}
	var obj = {};
	obj.num = num;
	$.ajax({
		url: '/uj/rDeleted',
		method: 'post',
		cache: false,
		data: obj,
		dataType: 'json',
		success: function(res) {
			alert(res.rDeleted ? '예약을 취소했습니다.' : '취소 하지 않았습니다.');
			location.reload();
		},
		error: function(xhr, status, err) {
			alert('에러:' + err);
		}
	});
}