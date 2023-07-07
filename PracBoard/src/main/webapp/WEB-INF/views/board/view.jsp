<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>

h3{font-family: 'SBAggroM';
	text-align: center; }
h6{font-family: 'SBAggroL'}
h5{font-family: 'SBAggroL';
	margin: 50px;
	text-align: center;	}

.container {
	width: 70%;
	margin-top: 50px;
	font-family: 'SBAggroL';
}

a{
	color: #b4b4b4;
	text-decoration-line: none;
}

#recommend{
	width:50px;	
	border: 2px solid #FFCFDA;
	text-align: center;
	padding-top: 5px;
	border-radius: 10px;
}

#comment {
	width:50px;	
	border: 2px solid #D5C2EE;
	text-align: center;
	padding-top: 5px;
	border-radius: 10px;
}

</style>

<script type="text/javascript">
	$(function () {
		
		$("#recommend").on("click","#updateRecomm", function(){
			console.log("click")
			

		$.ajax({
			type : 'get',
			url : '/board/recommend',
			dataType : 'json',
			data : {'boardNo': ${board.boardNo} },
			success : function(data) {
				console.log("성공");
				console.log(data);
				if(data.result == true){
					$("#updateRecomm").removeClass("bi-suit-heart")
					$("#updateRecomm").addClass("bi-suit-heart-fill")
// 					var cntRecommend = ${data.cntRecommend}
					console.log(data.cntRecommend)
					$("#cntRecommend").html(data.cntRecommend)
					
				} else if(data.result == false) { //찜 취소
					$("#updateRecomm").removeClass("bi-suit-heart-fill")
					$("#updateRecomm").addClass("bi-suit-heart")
					console.log("왜죠?")
					console.log(data)
					
					console.log(data.cntRecommend)
					$("#cntRecommend").html(data.cntRecommend)
				}
			}
// 			,error: function (request, status, error) {
// 		        console.log("error");
// 		    }
			
		})
		})
	})
</script>

<div class="container">
	<h3>${board.title}</h3>
	<!-- 작성자, 글 정보 -->
	<div>
		<span>
			<h6><i class="bi bi-person-circle"></i>${writerNick}</h6>
			<span style="font-size: 13px;"><fmt:formatDate value="${board.writeDate}" pattern="yy/MM/dd HH:mm:SS"/></span>
		</span>
		
		<div style="float:right">
			<span>조회수 ${board.hit}</span>
			<span>댓글수</span>
			<span><i class="bi bi-three-dots-vertical"></i></span>
		</div>
		
	</div>
	<!-- 작성자, 글 정보 -->
	<hr>
	<h5>${board.content}</h5>
	<hr>
	<span id="box">
	<!-- 좋아요 -->
	<c:if test="${board.userNo ne userNo }" >
		<input type="hidden" value="${board.boardNo}" id="boardNo">
		<div id="recommend">
			<c:if test="${isRecommend eq 1}">
				<i class="bi bi-suit-heart-fill" style="color: #FFCFDA;" id="updateRecomm" ></i>
			</c:if>
			<c:if test="${isRecommend eq 0}">
				<i class="bi bi-suit-heart" style="color: #FFCFDA;" id="updateRecomm" ></i>
			</c:if>
				<span id="cntRecommend" style="vertical-align: middle; font-size: 12px; color: #FFCFDA; ">${cntRecommend}</span>
		</div>
	</c:if>
	<!-- 좋아요 끝 -->
	<!-- 댓글 -->
		<div id="comment">
			댓글
		</div>
	<!-- 댓글 끝 -->
	</span>
	<hr>
	<c:if test="${board.userNo eq userNo }" >
		<button>수정</button>
		<button>삭제</button>
	<hr>
	</c:if>
	<span>
	<a href="./list" style="float: right">전체목록</a><br>
	<!-- 이전 글, 다음 글 -->
		<c:choose>
		<c:when test="${board.nextNo == 0}">
		다음글 | ${board.nextTitle}<br>
		</c:when>
		<c:otherwise>
		다음글 | <a href="./view?boardNo=${board.nextNo}">${board.nextTitle}</a><br>
		</c:otherwise>
		</c:choose>
		
		현재글 | ${board.title}<br>
		
		<c:choose>
		<c:when test="${board.prevNo == 0}">
		이전글 | ${board.prevTitle}<br>
		</c:when>
		<c:otherwise>
		이전글 | <a href="./view?boardNo=${board.prevNo}">${board.prevTitle}</a><br>
		</c:otherwise>
		</c:choose>
	<!-- 이전 글, 다음 글 끝 -->
	</span>
</div>




</body>
</html>