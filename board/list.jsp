<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판</title>
<meta name ="viewport" content = "width=device-width, initial-scale = 1">
 


 <link rel="stylesheet" type="text/css" href="/css/style2.css"> 
 <style>
 	/* 스마트폰 세로 */
@media screen and (max-device-width: 320px){
    .bbsList {
        width: 80vmin;
        height: 80vmin;
    }
}
/* 태블릿 세로 */
@media screen and (min-width : 321px) and (max-width : 767px) and (orientation : portrait ) {
    .bbsList {
        width: 90vmin;
        height: 90vmin;
    }
}
/* iPad Pro 세로 */
@media screen and (min-width : 768px) and (orientation : portrait ) {
    .bbsList {
        width: 100%;
        height: 100%;
    }
}
/* 스마트폰 가로 */
@media screen and (max-width : 767px) and (orientation : landscape ) {
    .bbsList {
        width: 70vmax;
        height: 60vmin;
    }
}
/* 태블릿 가로 */
@media screen and (min-width : 768px) and (max-width : 1365px) and (orientation : landscape ) {
    .bbsList {
        width: 90vmax;
        height: 70vmin;
    }
}
/* iPad Pro 가로, 데스크탑 */
@media screen and (min-width : 1366px) and (max-width : 1599px) and (orientation : landscape ) {
    .bbsList {
        width: 90vmax;
        height: 80vmin;
    }
}
/* 큰 모니터 16:9 */
@media screen and (min-width : 1600px) {
    .bbsList {
        width: 100%;
        height: 100%;
    }
     const { width, height } = div.getBoundingClientRect();
	div.width = width;
	div.height = height; 
	
	
	
    
    
}
 </style>
</head>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>

	
	<div class="container managergrounp" id="container" name="container" >
	<h3>게시판</h3>
	<hr>
		<a class="btn" href="/uj/home" >홈 <span class="btn_txt_small">▶</span></a>
    	<a class="btn" href="#" >소개 <span class="btn_txt_small">▶</span></a>
    	<a class="btn" href="/uj/naverMap" >오시는길 <span class="btn_txt_small">▶</span></a>
        <a class="btn" href="/uj/rlist" >예약하기 <span class="btn_txt_small">▶</span></a>
        <a class="btn" href="http://instagram.com/gimsehwan5504" >SNS <span class="btn_txt_small">▶</span></a>
	
		<div class="right" >
                
                <select id="cntPerPage" class="select_btn" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
                
            </div>
	<table class="bbsList" summary="">
                          
      <thead class="head">
			<tr>
                 
                 <th>글번호</th>
                 <th>제목</th>   
                 <th>글쓴이</th>
                 <th>날짜</th>
           </tr> 
		</thead>
		<tbody class="body">
		<tr>
		 <c:forEach var = "b" items="${viewAll }">
			
			<tr>
				<th>${b.num }.</th>
				<th><a href="/uj/detail?num=${b.num}" >${b.title }</a></th>
				<th> ${b.author } </th>
				<th> ${b.bdate } </th>
			</tr>
			
		 		
		 	         	
		</c:forEach> 
		
		</tr>
		</tbody>
		
		<tfoot class="foot">
                    <tr>
                        <td colspan="9">
                            <span class="arrow radius-right">≪</span>
                            <span class="arrow radius-left">＜</span>
                            
                            <c:if test="${paging.startPage != 1 }">
			<a href="/uj/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/uj/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/uj/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>

                            <span class="arrow radius-right">＞</span>
                            <span class="arrow radius-left">≫</span>
                        </td>
                    </tr>    
                </tfoot>
            </table>
        </div>
            <div class="btn_wrap">
                <a class="btn_org" href="/uj/badd"><span class="txt_white">글쓰기</span></a>
            </div>
		
</body>
</html>