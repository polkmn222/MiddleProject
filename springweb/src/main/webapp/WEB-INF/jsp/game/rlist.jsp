<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약리스트</title>
<meta name="viewport" content="width=device-width, initial-scale = 1">
<link rel="stylesheet" type="text/css" href="/css/list.css">
</head>
<body>
	<div class="container managergrounp" id="container" name="container">
		<h3>예약리스트</h3>
		<hr>
			<a class="btn" href="/uj/home">홈 <span class="btn_txt_small">▶</span></a>
			<a class="btn" href="/uj/info">소개 <span class="btn_txt_small">▶</span></a> 
			<a class="btn" href="/uj/naverMap">오시는길 <span class="btn_txt_small">▶</span></a>
			<a class="btn" href="/uj/list">게시판 <span class="btn_txt_small">▶</span></a>
			<a class="btn" href="/uj/rdetail">나의 예약 <span class="btn_txt_small"></span></a>
			<a class="btn" href="http://instagram.com/gimsehwan5504">SNS <span class="btn_txt_small">▶</span></a>

		<table class="bbsList" summary="">
			<thead class="head">
				<tr>
					<th>날짜</th>
					<th>타임</th>
					<th>인원</th>
				</tr>
			</thead>
			<tbody class="body">
				<tr>
					<c:forEach var="r" items="${list }">
						<tr>
							<th>${r.rinfo }</th>
							<th>${r.rtime }</th>
							<c:choose>
								<c:when test="${r.total >=10 }">
									<th class="red">만석</th>
								</c:when>
								<c:otherwise>
									<th>${r.total }명</th>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_wrap">
		<a class="btn_org" href="/uj/reservation"><span class="txt_white">예약하기</span></a>
	</div>
</body>
</html>