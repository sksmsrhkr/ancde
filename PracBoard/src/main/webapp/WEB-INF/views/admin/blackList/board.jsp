<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<style>

	body{
		font-family: 'SBAggroL';
		heigth: 100%;
	}
	
	#adminSlider{
		float: left;
		width: 15%;
		height: 1000px;
	 	background-color: white; 
		padding: 50px 0px 0px 60px;
	}
	
	#adminSlider> h2{
		color: #8AB78A;
		font-weight: bold;
	}
	
	#adminSlider> p{
		font-size: 20px;
	}

  table {   
	width: 100%;  
    border-top: 1px solid #bebebe;
  }

  th, td {
    border-bottom: 1px solid #bebebe;
    text-align: center;
    padding: 10px;
    font-family: 'SBAggroL'
  }
  
  #regulist{
  	padding-top: 45px;
  	background-color: white;
  	display: inline-block;
  	width: 75%;  
  	margin-top: 45px;
  	margin-left: 7%; 	
  }
  
  a{
  	text-decoration: none;
  	color: black;
  }
  

</style>

<script type="text/javascript">

function filterSelect(){
	console.log("click")
	console.log($("#filter").val())
	
	var filter = $("#filter").val();
	var keyword = $("#keyword").val();
	
	location.href = "/admin/blackList/board?curPage=1" + "&filter=" + filter + "&keyword=" + keyword ; 
}
</script>

<script>
window.onload = function() {
	
	document.getElementById("searchBtn").onclick = function(){
	
	console.log("click")
	
	let keyword = $("#keyword").val();
	let filter = $("#filter").val();
	
	console.log(keyword)
	
	location.href = "/admin/blackList/board?curPage=1" + "&filter=" + filter + "&keyword=" + keyword;
	
	}
	var input = document.getElementById("keyword");

	input.addEventListener("keyup", function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			document.getElementById("searchBtn").click();
		}
	});
	
}

</script>
<body>

<div id="adminSlider">

<h2>회원 관리</h2>
<p><a href="/admin/userList">회원 정보 수정</a></p>
<p ><a href="/admin/blackList/board" style="color: #497649; font-size: 30px;">블랙 리스트 관리</a></p>
<br>
<h2>신고 관리</h2>
<p ><a href="/admin/regulateBoard">글 신고 내역</a></p>
<p><a href="/admin/regulateComm">댓글 신고 내역</a></p>
<br>
<h2>고객 센터</h2>
<p><a href="/admin/serviceCenter">문의 내역</a></p>
<br>
<h2>공지 사항</h2>
<p>작성 내역</p>
</div>

<div id="regulist">

<div id="filterBox" style="float: left;">
<select class="array" id="filter" name="filter" onchange="filterSelect()">
	<c:choose>
		<c:when test="${filter eq 'userDesc' }">
			<option value="userNo">낮은번호순</option>
			<option value="userDesc" selected>높은번호순</option>
		</c:when>
		<c:otherwise>
			<option value="userNo">낮은번호순</option>
			<option value="userDesc">높은번호순</option>
		</c:otherwise>
	</c:choose>
</select>
</div>

<div id="searchBox" style="display: inline-block; float: right; margin-bottom: 10px;">
	<input name="keyword" id="keyword" type="text" value="${keyword}" style="border: none; background-color: #F7F7F7;">
	<button  type="button" onclick="search()" id="searchBtn" style="border: none; background-color: #8AB78A; color: white;" >검색</button>
</div>

<table>
	<thead>
	<tr>
		<th>규제 회원</th>
		<th>글번호</th>
		<th>글 제목</th>	
		<th>블랙리스트</th>	
	</tr>
	</thead>
	<c:forEach items="${blackboardlist}" var="boardBlack">
	
	<tr>
		<td>${boardBlack.USER_NO }</td>
		<td>${boardBlack.BOARD_NO }</td>
		<td>
		<c:choose>
			<c:when test="${fn:length(boardBlack.TITLE) gt 26}">
			<a href="/board/view?boardNo=${boardBlack.BOARD_NO}#${boardBlack.TITLE}" style="color: #787878;">
			<c:out value="${fn:substring(boardBlack.TITLE, 0, 25)}"/>...</a>
			</c:when>
			<c:otherwise>
			<a href="/board/view?boardNo=${boardBlack.BOARD_NO}" style="color: #787878;">
			${boardBlack.TITLE }</a>
			</c:otherwise>
		</c:choose>
		</td>
		<td>
		<c:if test="${ boardBlack.BLACKCNT lt 3}"> 경고 ${ boardBlack.BLACKCNT} 회</c:if>
		<c:if test="${ boardBlack.BLACKCNT ge 3}"> 글 작성 제한</c:if>
		</td>
	</tr>
	
	</c:forEach>
</table>

	<div style="margin-bottom: 50px; margin-top: 50px;">
		<!-- href로 링크만 넣어주면 됨 -->
		<ul class="pagination justify-content-center">

			<%--첫 페이지로 이동 --%>
			<!--1번이 아닐때 = ne  -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./blackList/board?filter=${filter}&keyword=${keyword}">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./blackList/board?filter=${filter}&keyword=${keyword}">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./blackList/board?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./blackList/board?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./blackList/board?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&keyword=${keyword}">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./blackList/board?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&keyword=${keyword}">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./blackList/board?curPage=${paging.curPage -1 }&filter=${filter}&keyword=${keyword}">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./blackList/board?curPage=${i }&filter=${filter}&keyword=${keyword}">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./blackList/board?curPage=${i }&filter=${filter}&keyword=${keyword}">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./blackList/board?curPage=${paging.curPage +1 }&filter=${filter}&keyword=${keyword}">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}&filter=${filter}&keyword=${keyword}">
				<li class="page-item"><a class="page-link"
					href="./blackList/board?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./blackList/board?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./blackList/board?curPage=${paging.totalPage }&filter=${filter}&keyword=${keyword}">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./blackList/board?curPage=${paging.totalPage }&filter=${filter}&keyword=${keyword}">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>
</div>
</body>
</html>