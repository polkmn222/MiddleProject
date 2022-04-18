// 페이지 갯수 변경
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href = "list?nowPage=${paging.nowPage}&cntPerPage=" + sel;
}