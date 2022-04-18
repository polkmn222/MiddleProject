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
<title>글쓰기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/detail.css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<FORM ENCTYPE="multipart/form-data">

					<h4 class="mb-3">게시판</h4>
					<input type=hidden id="author" name="author" value="${user.uid}">
					<div class="row">
						<div class="col-md-10 mb-3">
							<input type="hidden" id="num" name="num" value="${bbs.num }">
							<label for="author">작성자 : </label><span> ${bbs.author } </span>
						</div>
					</div>
					<div class="mb-3">
						<label for="title">글 제목 : </label><span>${bbs.title }</span>
					</div>
					<c:choose>
						<c:when test="${fn:length(bbs.attach)>0}">
							<c:forEach var="f" items="${bbs.attach}">
								<a href="/uj/file/download/${f.num}"> <img src="/images/${f.filename}" width="100px" height="100px" alt="" class="thumb" /></a>
								 &nbsp; <a class="link_del" href="javascript:delete_file(${f.num});">삭제</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							첨부파일 없음
						</c:otherwise>
					</c:choose>
					<div class="mb-3">
						<label for="contents">내용 : </label> <span>${bbs.contents }</span>
					</div>
					
					<div>
						<button class="button1" type="button" onclick="go('${bbs.num }');">수정</button>
						<button class="button1" type="button" onclick="del_board('${bbs.num }');">삭제</button>
						<button class="button2" type="button" onclick="location.href='/uj/list';">목록</button>
					</div>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 PSY</p>
		</footer>
	</div>
	<script src="/js/detail.js"></script>
</body>
</html>

