<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
	<script>
 	
		function reserv() {

			 if(!confirm('정말로 예약하시겠습니까?')) {
				alert('정상적으로 취소했습니다.');
				return false;
			} 
		
			  /* alert('hi'); */
			  var serData = $('#RESER').serialize();
			  /* alert(serData); */
			
			 $.ajax({
				url : '/uj/reservation',
				method : 'post',
				cache : false,
				data : serData,
				dataType : 'json',
				success : function(res) {
					 if(res.rv) {
						 alert('예약 성공!');
					 } else {
						 alert('예약 실패');						 
					 }
						 location.href = "/uj/reservation"; 
				},
				error : function(xhr, status, err) {
					alert('err' + err);
				} 
			}); 
			return false;  
		}
	  
		   
	</script>
</head>
<body>
	<form id = "RESER" onsubmit = "return reserv();">
		<input type = hidden id = "ruid" name = "ruid" value = "${user.uid}">
		<input type = hidden id = "rnum" name = "rnum" value = "${ujr.rnum}">
		 <%-- <input type="hidden" id="rinfo" name="rinfo" value="${ujr.rinfo}"> --%> 
		 <%--  <input type="hidden" id="rinfo" name="rinfo" value="${list.rinfo}">   --%>
		   
		아이디 : ${user.uid } <br>
		<%-- 예약번호 : ${ujr.rnum} <br> --%>
		인원 : <input type = number min='0' max='10' id = "rp" name = "rp" value = "${ujr.rp }"> <br>
		요일 : <input type = date id = "rinfo" name = "rinfo" > <br>
		시간 : <!-- <input type = text id = "rtime" name = "rtime" value ="런치">  -->
		 <select id="rtime" name = "rtime" class="form-control">
			<option id ="rtime"  value = "런치 : 11시30분">런치 : 11시30분</option>
			<option id ="rtime"  value = "런치 : 13시05분">런치 : 13시05분</option>
			<option id ="rtime"  value = "디너 : 17시30분">디너 : 17시30분</option>
			<option id ="rtime"  value = "디너 : 19시05분">디너 : 19시05분</option>
		</select> 
			<div>
				<button type = "submit">저장</button>
				<button type = "reset">초기화</button>
				<button type="button" 
					onclick="location.href='/uj/home';">홈</button>
			</div>
			
		
	</form>
			 <div><label>날짜</label><label>인원</label><label>타임</label></div>
			<c:forEach var="r" items="${list}">
			<div><label>${r.rinfo}</label>
			<label>${r.rtime}</label>
			<label>${r.rp}명</label>
			</div>
		</c:forEach> 
</body>
</html>

