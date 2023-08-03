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
	var searchType = $("#searchType").val();
	
	location.href = "/admin/userList?curPage=1" + "&filter=" + filter + "&keyword=" + keyword + "&searchType=" + searchType; 
}
</script>

<script>
window.onload = function() {
	
	document.getElementById("searchBtn").onclick = function(){
	
	console.log("click")
	
	let keyword = $("#keyword").val();
	let filter = $("#filter").val();
	var searchType = $("#searchType").val();
	
	console.log(keyword)
	
	location.href = "/admin/userList?curPage=1" + "&filter=" + filter + "&keyword=" + keyword + "&searchType=" + searchType; 
	
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
<p><a href="./userList" style="color: #497649; font-size: 30px;">회원 정보 수정</a></p>
<p>블랙 리스트 관리</p>
<br>
<h2>신고 관리</h2>
<p ><a href="./regulateBoard">글 신고 내역</a></p>
<p><a href="./regulateComm">댓글 신고 내역</a></p>
<br>
<h2>고객 센터</h2>
<p><a href="./serviceCenter">문의 내역</a></p>
<br>
<h2>공지 사항</h2>
<p>작성 내역</p>
</div>

<div id="regulist">

<div id="filterBox" style="float: left;">
<select class="array" id="filter" name="filter" onchange="filterSelect()">
	<c:choose>
		<c:when test="${filter eq 'noDesc' }">
			<option value="no">낮은번호순</option>
			<option value="noDesc" selected>높은번호순</option>
			<option value="join">가입오래순</option>
			<option value="joinDesc">가입최신순</option>
		</c:when>
		<c:when test="${filter eq 'join' }">
			<option value="no">낮은번호순</option>
			<option value="noDesc" >높은번호순</option>
			<option value="join" selected>가입오래순</option>
			<option value="joinDesc">가입최신순</option>
		</c:when>
		<c:when test="${filter eq 'joinDesc' }">
			<option value="no">낮은번호순</option>
			<option value="noDesc">높은번호순</option>
			<option value="join">가입오래순</option>
			<option value="joinDesc" selected>가입최신순</option>
		</c:when>
		<c:otherwise>
			<option value="no">낮은번호순</option>
			<option value="noDesc">높은번호순</option>
			<option value="join">가입오래순</option>
			<option value="joinDesc">가입최신순</option>
		</c:otherwise>
	</c:choose>
</select>
</div>

<div id="searchBox" style="display: inline-block; float: right; margin-bottom: 10px;">
	<select name="searchType" id="searchType">
		<c:choose>
		<c:when test="${searchType eq 'no' }">
			<option value="no">번호</option>
			<option value="nick">닉네임</option>
			<option value="id">아이디</option>
		</c:when>
		<c:when test="${searchType eq 'nick' }">
			<option value="no">번호</option>
			<option value="nick" selected>닉네임</option>
			<option value="id">아이디</option>
		</c:when>
		<c:when test="${searchType eq 'id' }">
			<option value="no">번호</option>
			<option value="nick">닉네임</option>
			<option value="id" selected>아이디</option>
		</c:when>
		</c:choose>

	</select>
	<input name="keyword" id="keyword" type="text" value="${keyword}" style="border: none; background-color: #F7F7F7;">
	<button  type="button" onclick="search()" id="searchBtn" style="border: none; background-color: #8AB78A; color: white;" >검색</button>
</div>

<table>
	<thead>
	<tr>
		<th>회원 번호</th>
		<th>회원 이름</th>
		<th>회원 아이디</th>
		<th>회원 닉네임</th>
		<th>회원 가입일</th>

	</tr>
	</thead>
	<c:forEach items="${userList}" var="userList">
	
	<tr>
		<td><a href="/admin/changeUserInfo?userNo=${userList.userNo}">${userList.userNo}</a></td>
		<td><a href="/admin/changeUserInfo?userNo=${userList.userNo}">${userList.userName}</a></td>
		<td><a href="/admin/changeUserInfo?userNo=${userList.userNo}">${userList.userId}</a></td>
		<td><a href="/admin/changeUserInfo?userNo=${userList.userNo}">${userList.userNick}</a></td>
		<td><fmt:formatDate value="${userList.userJoindate}"
 							pattern="yy/MM/dd HH:mm" /></td>
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
					href="./userList?filter=${filter}&keyword=${keyword}&searchType=${searchType}">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./userList?filter=${filter}&keyword=${keyword}&searchType=${searchType}">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./userList?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./userList?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./userList?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./userList?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./userList?curPage=${paging.curPage -1 }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./userList?curPage=${i }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./userList?curPage=${i }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./userList?curPage=${paging.curPage +1 }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}&filter=${filter}&keyword=${keyword}">
				<li class="page-item"><a class="page-link"
					href="./userList?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./userList?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./userList?curPage=${paging.totalPage }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./userList?curPage=${paging.totalPage }&filter=${filter}&keyword=${keyword}&searchType=${searchType}">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>
</div>
</body>
</html>