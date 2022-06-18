<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사용자정보 상세보기</title>
	<style>
	h3 { width:fit-content; margin:1em auto;}
	table {width:fit-content; border:1px solid black; border-spacing: 0; margin:0 auto; }
	th,td { padding:5px; border-bottom:1px dashed black; }
	th { border-right: 1px solid black; }
	th:first-child { width: 60px; }
	td { width: 400px; }
	tr:last-child>th {border-bottom:none; }
	tr:last-child>td {border-bottom:none; }
	tr:nth-child(3) > td { height:70px; overflow: auto;}
	a { text-decoration: none; color:blue; }
	a.link_del { border:1px solid red; color:red; font-size: x-small;}
</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	
	function del_board(num){
		
		if(!confirm('정말 삭제 하시겠습니까?')){
	         return;
	      }
	      
	      var obj = {};
	      obj.num = num;
	      /* alert(obj.uid); */
	      
	      $.ajax({
	         url : '/bbs/delete',
	         method : 'post',
	         cache : false,
	         data : obj,
	         dataType : 'json',
	         success : function(res){
	            alert(res.deleted ? '삭제 성공' : '삭제 실패!');
	            location.href = '/bbs/list';
	         },
	         error : function(xhr, status, err){
	            alert('에러 : ' + err);
	         }
	      });

	}
	</script>
	<script>
	function delete_file(num)
	{
		if(!confirm('정말로 삭제하시겠어요?')){
			return;
		}
		var obj = {};
		obj.num = num;
		$.ajax({
			url:'/bbs/file/delete',
			method:'post',
			cache:false,
			data:obj,
			dataType:'json',
			success:function(res){
				alert(res.deleted ? '삭제 성공':'삭제 실패');
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	}
</script>
</head>
<body>
	<table>
<tr><th>글번호</th><td>${bbs.num}</td></tr>
<tr><th>제 목</th><td>${bbs.title}</td></tr>
<tr><th>내 용</th><td>${bbs.contents}</td></tr>
<tr><th>첨 부</th><td>
	<c:choose>
		<c:when test="${fn:length(bbs.attach)>0}">
			<c:forEach var="f" items="${bbs.attach}">
				<fmt:formatNumber var="kilo" value="${f.filesize/1024}" maxFractionDigits="0" />
				<div>${f.num}.
					<a href="/bbs/file/download/${f.num}">${f.filename}</a>(${kilo} kb) 
					<a class="link_del" href="javascript:delete_file(${f.num});">삭제</a>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			첨부파일 없음
		</c:otherwise>
	</c:choose>
</td></tr>
<tr><td>
		[<a href = "/bbs/edit?num=${bbs.num }">수정</a>]
		[<a href = "javascript:del_board('${bbs.num }');">삭제</a>]
		<button type = "button" onclick = "del_board('${bbs.num }');">삭제</button>
		<button type="button" 
					onclick="location.href='/bbs/list';">목록</button>
</td></tr>	
</table>
</body>
</html>