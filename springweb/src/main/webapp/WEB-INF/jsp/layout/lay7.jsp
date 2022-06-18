<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("uid", 11);
	//String uid = (String)session.getAttribute("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>접속자에 따라 버튼 감추고 보이기</title>
<script>
function deleteIt() {
	var uid = '${uid}';
	alert('아이디가 ['+uid+']이므로 삭제할 수 있습니다');
}
</script>
</head>
<body>
<c:if test="${uid==11}">
	<button type="button" onclick="deleteIt()">삭제</button>
</c:if>
</body>
</html>