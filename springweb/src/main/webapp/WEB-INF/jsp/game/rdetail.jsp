<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>나의 예약</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/rdetail.css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form ENCTYPE="multipart/form-data">

					<h4 class="mb-3">나의 예약</h4>
					<input type=hidden id="ruid" name="ruid" value="${user.uid}">

					<div class="row">
						<div class="col-md-10 mb-3">
							<label for="ruid">예약자 : </label><span> ${user.uid} </span>
						</div>
					</div>
					
					<div class="mb-3"></div>
					<c:forEach var="u" items="${list}">

						<div class="mb-3">
							<label for="rnum">예약번호 : </label> <span>${u.rnum }</span>
						</div>

						<div class="mb-3">
							<label for="rinfo">날짜 : </label> <span>${u.rinfo }</span>
						</div>

						<div class="mb-3">
							<label for="rtime">타임 : </label> <span>${u.rtime }</span>
						</div>

						<div class="mb-3">
							<label for="rp">인원 : </label> <span>${u.rp }</span> &nbsp;&nbsp;<a
								class="link_del" href="javascript:rdelete(${u.rnum});">예약취소</a>
						</div>

						<hr>
					</c:forEach>
					<div></div>
					<div>
						<button class="button2" type="button" onclick="location.href='/uj/rlist';">예약목록</button>
					</div>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 PSY</p>
		</footer>
	</div>
	<script src="/js/rdetail.js"></script>
</body>
</html>