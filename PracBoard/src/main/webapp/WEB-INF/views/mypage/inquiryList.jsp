<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style>
body{
	font-family: 'SBAggroL';
}

#container{
	top: 0;
	width: 100%;
}

#mybox{
	width:70%;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 60px;
	border: 3px solid #B4B4DC;	
	height: 150px;
}

#mybox2{
	display: block;
	width: 70%;
	margin: auto;
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
  
  #profile{
  	float:left;
  	padding-top: 20px; 
  	height: 100%;
  }
  
  #userInfo {
  	float:left;
  	height: 100%;
  	padding-top: 30px;
  }
  
  
  #profileImg{
	text-align: center;
  	width: 100px;
  	height: 100px;
  	margin-left: 50px;
  	margin-right: 50px;
  	border-radius: 100%; 
  	object-fit: cover;
  }
  
  #mybox3{
   	float: left; 
  	width: 15%;
  	padding-top: 10px;
  	text-align: center;
  	font-size: 18px;
  	height: 40px;
    border: 3px solid #B4B4DC;
    border-bottom: none;
  }
   #mybox4{
    dislplay: inline-block; 
  	float: left;
  	width: 15%;
  	padding-top: 10px;
  	text-align: center;
  	font-size: 18px;
  	height: 40px;
  }
   #mybox4:hover{
   	background-color: #B4B4DC;
   }
   #mybox5{
    dislplay: inline-block; 
  	float: left;
  	margin-left: 15%;
  	width: 15%;
  	padding-top: 10px;
  	text-align: center;
  	font-size: 18px;
  	height: 40px;
  }
   #mybox5:hover{
   	background-color: #B4B4DC;
   }
</style>


<div id="container">
	<c:import url="/WEB-INF/views/layout/myBox.jsp" />
	
	<div >
		<div id="mybox5"><a href="./myboardList">내가 쓴 글</a></div>
		<div id="mybox4"><a href="./commentList">내가 쓴 댓글</a></div>
		<div id="mybox3"><a href="./inquiryList">1:1 문의 내역</a></div>
	</div>
	<br><br>
	<div id="mybox2">
	<table>
	<thead>
		<tr>
		<th>문의 번호</th>
		<th>문의 유형</th>
		<th>문의 제목</th>
		<th>문의 날짜</th>
		<th>처리 현황</th>
		</tr>
	</thead>
	<c:forEach items="${qnalist}" var="inquiry">
	<tr>
	<td>${inquiry.INQUIRY_NO }</td>
	<td>${inquiry.TYPE}</td>
	<td><a href="/service/qnaView?inquiryNo=${inquiry.INQUIRY_NO }">${inquiry.INQUIRY_TITLE }</a>	</td>
	<td><fmt:formatDate value="${inquiry.INQUIRY_DATE }"
 							pattern="yy/MM/dd HH:mm"/>
 	<td>${inquiry.STATE }</td>
 	
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
					href="./myboardList">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./myboardList">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./myboardList?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./myboardList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./myboardList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./myboardList?curPage=${paging.curPage -1 }">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./myboardList?curPage=${i }">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./myboardList?curPage=${i }">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./myboardList?curPage=${paging.curPage +1 }">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}">
				<li class="page-item"><a class="page-link"
					href="./myboardList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./myboardList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./myboardList?curPage=${paging.totalPage }">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./myboardList?curPage=${paging.totalPage }">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
