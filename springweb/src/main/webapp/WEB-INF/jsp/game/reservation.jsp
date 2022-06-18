<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>예약하기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/reservation.css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">예약하기</h4>
				<form class="validation-form" novalidate id="validation-form" onsubmit="return reserv();">
					<input type=hidden id="ruid" name="ruid" value="${user.uid}">
					<div class="row">
						<div class="col-md-10 mb-3">
							<label for="ruid">예약자 : </label><span> ${user.uid } </span>
						</div>
					</div>

					<div class="mb-3">
						<label for="rp">인원</label> <input type="number"
							class="form-control" id="rp" name="rp" min='1' max='10' required>
						<div class="invalid-feedback">인원을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="rinfo">요일</label> <input type="date"
							class="form-control" id="rinfo" name="rinfo" required>

						<div class="invalid-feedback">요일을 선택해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="rtime">시간</label> <select id="rtime" name="rtime"
							class="form-control" required>
							<option id="rtime" value="런치 : 11시30분">런치 : 11시30분</option>
							<option id="rtime" value="런치 : 13시05분">런치 : 13시05분</option>
							<option id="rtime" value="디너 : 17시30분">디너 : 17시30분</option>
							<option id="rtime" value="디너 : 19시05분">디너 : 19시05분</option>
						</select>
						<div class="invalid-feedback">시간을 선택해주세요.</div>
					</div>

					<div>
						<button class="button1" type="submit">예약</button>
						<button class="button1" type="reset">초기화</button>
						<button class="button2" type="button"
							onclick="location.href='/uj/rlist';">예약목록</button>
					</div>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 PSY</p>
		</footer>
	</div>
	<script src="/js/reservation.js"></script>
</body>
</html>

