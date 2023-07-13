<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family: 'SBAggroL';
}

#mybox{
	width: 80%;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 60px;
	border: 3px solid #B4B4DC;	
	height: 150px;
}

#mybox2{
	width: 80%;
	margin: auto;
	margin-top: 60px;
	border-top: 3px solid #B4B4DC;	
	border-bottom: 3px solid #B4B4DC;	
}
table {
  width: 100%;
  padding-left: 30px;
  padding-right: 30px;
  border-spacing: 10px;
}
  th, td {
    border-bottom: 1px solid #bebebe;
    text-align: center;
    padding: 10px;
    font-family: 'SBAggroL'
  }
  
   a{
  	text-decoration-line: none;
  	color: black;
  }
  
  #profile, #userInfo{
  	float:left;
  	padding-top: 20px;
  	height: 150px;
  }
  
  #profileImg{
  	max-width: 100px;
  	margin-left: 50px;
  	margin-right: 50px;
  	border-radius: 100%;
  }
</style>


	<div id="mybox">
		<div id="profile">
			<img id="profileImg" src="/upload/${userfile.userfileStored }"  alt="">
		</div>
		<div id="userInfo">
		${userNick}<br>
		<a href="./userInfo">내 정보 수정</a><br>
		총 게시물 ${totalCount} 개<br>
		</div>
	</div>
	
	<div id="mybox2">
	<table>
	<thead>
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회</th>
		</tr>
	</thead>
	<c:forEach items="${board}" var="boardlist">
	<tr>
	<td>${boardlist.BOARD_NO }</td>
	
	<td style="text-align:left;"><a href="/board/view?boardNo=${boardlist.BOARD_NO}">${boardlist.TITLE }</a>
		<c:if test="${boardlist.COMMENTCNT ne 0}">
		&nbsp;<span style="color:#EB3232">[${boardlist.COMMENTCNT}]</span>
		</c:if>		
		<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
		<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
		<fmt:parseNumber value="${boardlist.WRITE_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
		<c:if test="${today - boardDate le 2}">
		<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
		</c:if></td>
	<td><fmt:formatDate value="${boardlist.WRITE_DATE }"
 							pattern="yy/MM/dd HH:mm"/>
	<td>${boardlist.HIT }</td>
	</tr>
	</c:forEach>
	</table>	
</div>
<div style="margin-bottom: 50px; margin-top: 50px;">
		<!-- href로 링크만 넣어주면 됨 -->
		<ul class="pagination justify-content-center">

			<%--첫 페이지로 이동 --%>
			<!--1번이 아닐때 = ne  -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./mypage?filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./mypage?filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./mypage?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./mypage?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./mypage?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./mypage?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./mypage?curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./mypage?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./mypage?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./mypage?curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}">
				<li class="page-item"><a class="page-link"
					href="./mypage?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./mypage?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./mypage?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./mypage?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />