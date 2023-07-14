<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>

	body{font-family: 'SBAggroL'}
	
	.container {
		width: 70%;
		margin-top: 50px;
		font-family: 'SBAggroL';
	}
	
	a{
		color: #b4b4b4;
		text-decoration-line: none;
	}
	
	#box{
		width: 100%;
		height: 30px;
	}
	
	#recommend{
		width:50px;	
		border: 2px solid #FFCFDA;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
		float:left;
		margin-right: 5px;
	}
	
	#comment {
		width:70px;	
		font-size: 16px;
		border: 2px solid #D5C2EE;
		color: #8E83A9;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
		float:left;
	}
	
	#writerBtn{
		font-size: 12px;
		border: 1px solid #FF3232;
		color: #FF3232;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
	}
	
	#commentBtn , .replyBtn{
		font-size: 14px;
		border: 2px solid #6E9FED;
		color: white;
		border-radius: 10px;
		text-align: center;
		background-color: #6E9FED;
	}

	#updateCommBtn{
		font-size: 14px;
		border: 2px solid #6E9FED;
		color: white;
		border-radius: 10px;
		text-align: center;
		background-color: #6E9FED;
	}
	
	#commentBox{
	 	background-color: #f1f3f5;
	 	padding-bottom: 10px;
	}
	
	.commentList{
		padding: 20px;
	}

	#writeCommBox{

		
	}
	#writeComm, .replyComm{		
		background-color: white;
		margin: 30px; 
		padding: 10px 20px 35px 20px;
	}
	
 	#commfile{ 
 		max-width: 150px;
	} 
	
	.updateContent{
		background-color: white;
		margin: 30px; 
		padding: 10px 20px 35px 20px;
	}
	
	.updateConfirm{
		font-size: 14px;
		border: 2px solid #6E9FED;
		color: white;
		border-radius: 10px;
		text-align: center;
		background-color: #6E9FED;
	}
	
	.reIcon{
		float: left;
		width: 20px;
		padding-top: 5px;
		padding-left: 10px;
		margin-right: 20px;
		
	}
	
	.viewReply{
		margin-left: 40px;
	}
	
	#profileImg{
		width: 80px;
		height: 80px;
		border-radius: 100%;
		float: left;
		margin-right: 10px;
		object-fit: cover;
	}
	
</style>

<script type="text/javascript">
$(function() {
	$(".updateContent").hide()
	$(".replyComm").hide()
})

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
					console.log(data.cntRecommend)
					$("#cntRecommend").html(data.cntRecommend)
					$("#chkRecommCnt").html(data.cntRecommend)
					
					
				} else if(data.result == false) { //찜 취소
					$("#updateRecomm").removeClass("bi-suit-heart-fill")
					$("#updateRecomm").addClass("bi-suit-heart")
					console.log("왜죠?")
					console.log(data)
					
					console.log(data.cntRecommend)
					$("#cntRecommend").html(data.cntRecommend)
					$("#chkRecommCnt").html(data.cntRecommend)
				}
			}
			,error: function (request, status, error) {
		        console.log("error");
		    }	
		})
		})
	})
	
</script>

<script type="text/javascript">
$(function() {
	$("#commentBox").on("click", "#commentBtn", function(){
		console.log("click")
		console.log($("#chkLock").prop("checked"))
		
		var form = $("#commentFile")[0];
		var formData = new FormData($("#commentFile")[0]);
		console.log($("#file")[0].files[0])
		
		if($("#chkLock").prop("checked")){
			formData.append('chkLock', 'y');
		} else{
			formData.append('chkLock',  'n');
		}
		
		formData.append('boardNo','${board.boardNo}');
		formData.append('userNo','${userNo}');
		formData.append('file',$("#file")[0].files[0]);
		formData.append('commContent',$("#commentContent").val());
		
		$.ajax({
			type : 'post',
			url : '/board/comment',
			data : formData,
			contentType : false,
			processData : false,
	        cache:false,
	        success: function(data) {
				console.log("댓글 성공")
				console.log(data)
				$(".commentList").html(data)
				
				document.getElementById("commentContent").value="";
				$("input:checkbox[id='chkLock']").prop("checked", false);
				
				$.ajax({
					type : 'post',
					url : '/board/commentCnt',
					data : {'boardNo': ${board.boardNo} },
					success : function(data){
						console.log("됌?")
						console.log(data)
						$(".chkCommentCnt").html(data)
					}
					
				})
					
			},error: function (request, status, error) {
		        console.log("error");
		    }
			
		})
	})
})

</script>

<script>
	$(function(){
		$(".commentList").on("click",".deleteComm", function() {
			console.log("click")

			var commentNo = $(this).attr("data-commNo");
			console.log(commentNo)
// 			console.log(boardNo)
			
			var chk = confirm("정말 삭제하시겠습니까?");
			if(chk){
			$.ajax({
				type : 'post',
				url : '/board/commDelete',
				dataType: 'html',
				data: {
					boardNo: ${board.boardNo},
						commentNo: commentNo },
						
				success: function(data) {
					console.log("댓글 성공")
					console.log(data)
					$(".commentList").html(data)
									$.ajax({
					type : 'post',
					url : '/board/commentCnt',
					data : {'boardNo': ${board.boardNo} },
					success : function(data){
						console.log("됌?")
						console.log(data)
						$(".chkCommentCnt").html(data)
					}
					
				})
						
				},error: function (request, status, error) {
			        console.log("error");
			    }
			})
			}
			
		})
	})
</script>
	
<script>	
	function commUpdate(th) {
		
			var idx = $(".commUpdate").index(th)
			console.log("click")
			var commentNo = $(".commUpdate").eq(idx).attr("data-commNo");
			var boardNo = $(".commUpdate").eq(idx).attr("data-boardNo");
			var commContent = $(".commUpdate").eq(idx).attr("data-commContent");
			var chkLock = $(".commUpdate").eq(idx).attr("data-chkLock");
			var comImg = $(".commUpdate").eq(idx).attr("data-comImg");

			
			console.log(commentNo)
			console.log(boardNo)
			console.log(commContent.length)
			
			$('.updatetextCount').text(commContent.length);
			
			console.log($(th).parents(".upBox").find(".updateContent").val())
			$(".updateContent").hide()
			$(th).parents(".upBox").find(".updateContent").show()
			$(".replyComm").hide()	
		
	}
</script>

<script>
function count(){
	let content = $("#commentContent").val();
	   if (content.length == 0 || content == '') {
	    	$('.textCount').text('0');
	    } else {
	    	$('.textCount').text(content.length);
	    }
	if (content.length > 200) {
		$("#commentContent").val($("#commentContent").val().substring(0, 200));
		alert('글자수는 200자까지 입력 가능합니다.');
    };	    
}
function replyCount(th){
	console.log("click")
	var idx = $(".replyCount").index(th)
	let replyContent = $(".replyCount").eq(idx).val();
	console.log(replyContent)
	
	   if (replyContent.length == 0 || replyContent == '') {
	    	$('.replytextCount').text('0');
	    } else {
	    	$('.replytextCount').text(replyContent.length);
	    }
	if (replyContent.length > 200) {
		$(".replyCount").val($(".replyCount").val().substring(0, 200));
		alert('글자수는 200자까지 입력 가능합니다.');
    };	    
}

function updateCount(th){
	console.log("그랩click")
	var idx = $(".updateCount").index(th)
	let updateContent = $(".updateCount").eq(idx).val();
	
	   if (updateContent.length == 0 || updateContent == '') {
	    	$('.updatetextCount').text('0');
	    } else {
	    	$('.updatetextCount').text(updateContent.length);
	    }
	if (updateContent.length > 200) {
		$(".updatetextCount").val($(".updatetextCount").val().substring(0, 200));
		alert('글자수는 200자까지 입력 가능합니다.');
    };

}

function updateConfirm(th) {
	
		console.log("click")
		
			var idx = $(".updateConfirm").index(th)
			var commentNo = $(".updateConfirm").eq(idx).attr("data-commNo");
			var comImg = $(".updateConfirm").eq(idx).attr("data-comImg");
		
		console.log(commentNo)
		console.log(comImg)
		console.log($(".updateCount").eq(idx).val())
		console.log($("#updatefile")[0].files[0])
		console.log($(".updateLock").eq(idx).prop("checked"))

		var form = $(".updateFile")[0];
		var formData = new FormData($(".updateFile")[0]);
		console.log($("#updatefile")[0].files[0])
		
		if($(".updateLock").eq(idx).prop("checked")){
			formData.append('chkLock', 'y');
		} else{
			formData.append('chkLock',  'n');
		}
		
		formData.append('boardNo','${board.boardNo}');
		formData.append('commentNo',commentNo);
		formData.append('userNo','${userNo}');
		formData.append('file',$("#updatefile")[0].files[0]);
		formData.append('commContent',$(".updateCount").eq(idx).val());
		
		$.ajax({
			type : 'post',
			url : '/board/updateComment',
			data : formData,
			contentType : false,
			processData : false,
	        cache:false,
	        success: function(data) {
				console.log("댓글 성공")
				console.log(data)
				$(".commentList").html(data)
				
					
			},error: function (request, status, error) {
		        console.log("error");
		    }
		})
		
	
}

function deleteImg(th) {
	console.log("click")
	
	var idx = $(".deleteImg").index(th)
	var commentNo = $(".deleteImg").eq(idx).attr("data-commNo");
	
	console.log(commentNo)
	
			$.ajax({
				type : 'post',
				url : '/board/deleteImg',
				dataType: 'html',
				data: { 
					boardNo : ${board.boardNo},
					commentNo: commentNo },
				success: function(data) {
					console.log("댓글 성공")
					var putComm = "" 
					console.log(data)
					$(".imgX").html(putComm)
						
				},error: function (request, status, error) {
			        console.log("error");
			    }
			})
}

function reply(th) {
	
		console.log("click")
		var idx = $(".reply").index(th)
		var commentNo = $(".reply").eq(idx).attr("data-commNo");
		var boardNo = $(".reply").eq(idx).attr("data-boardNo");
		var parentNo = $(".reply").eq(idx).attr("data-parentNo");
		var replyNick = $(".reply").eq(idx).attr("data-userNick");
		var replyNo = $(".reply").eq(idx).attr("data-replyNo");
		
		console.log($(".replyCount").eq(idx).val())
		console.log(commentNo)
		console.log(replyNick)
		console.log(replyNo)
		console.log(boardNo)
		console.log(parentNo)
		
		$(".replyComm").hide()
		$(th).parents(".upBox").find(".replyComm").show()
		$(".updateContent").hide()
}

function replyBtn(th) {
	
		console.log("click")
		var idx = $(".replyBtn").index(th)
		var commentNo = $(".replyBtn").eq(idx).attr("data-commNo");
		var boardNo = $(".replyBtn").eq(idx).attr("data-boardNo");
		var parentNo = $(".replyBtn").eq(idx).attr("data-parentNo");
		var replyNick = $(".replyBtn").eq(idx).attr("data-userNick");
		var replyNo = $(".reply").eq(idx).attr("data-replyNo");
		
		console.log("파일입니당")
		 console.log($("#rfile")[0].files[0])
		var formData = new FormData();

		
		if($(".reLock").eq(idx).prop("checked")){
			formData.append('chkLock', 'y');
		} else{
			formData.append('chkLock',  'n');
		}
		
	
		formData.append('boardNo','${board.boardNo}');
		formData.append('commentNo',$(".replyBtn").eq(idx).attr("data-commNo"));
		formData.append('userNo','${userNo}');
		formData.append('replyNick',$(".replyBtn").eq(idx).attr("data-userNick"));
		formData.append('replyNo',$(".reply").eq(idx).attr("data-replyNo"));
		if(parentNo==0){
			formData.append('parentNo',$(".replyBtn").eq(idx).attr("data-commNo"));
		} else{
		formData.append('parentNo',$(".replyBtn").eq(idx).attr("data-parentNo"));
		}
		formData.append('file', $("#rfile")[0].files[0]);
		formData.append('commContent',$(".replyCount").eq(idx).val());
		formData.append('step', 1);
		
		$.ajax({
			type : 'post',
			url : '/board/reply',
			data : formData,
			contentType : false,
			processData : false,
	        cache:false,
	        success: function(data) {
				console.log("댓글 성공")
				console.log(data)
				$(".commentList").html(data)
				
					
			},error: function (request, status, error) {
		        console.log("error");
		    }
			
		})
}


</script>
	
<div class="container">
	<h3 style="font-family: 'SBAggroM'; text-align: center; ">${board.title}</h3>
	<br>
	<!-- 작성자, 글 정보 -->
		<div id="profile">
			<img id="profileImg" src="/upload/${userfile.userfileStored }"  alt="">
		</div>
	<div style="height: 80px; padding-top: 20px; ">
<!-- 			<h6><i class="bi bi-person-circle"></i>&nbsp;&nbsp;</h6> -->
			<h5>${writerNick}</h5>
			<span style="font-size: 13px;"><fmt:formatDate value="${board.writeDate}" pattern="yy/MM/dd HH:mm:SS"/></span>
		
		<div class="numbers" style="float:right; margin-bottom: -20px;">
			<span>조회수 ${board.hit}</span>
			댓글수<span class="chkCommentCnt"> ${cntComment}</span>
			추천수<span id="chkRecommCnt"> ${cntRecommend}</span>
			<span style="margin-top: 50px;"><i class="bi bi-three-dots-vertical" class="modal"></i></span>
	
		</div>
	</div>
	
	<!-- 작성자, 글 정보 -->
	<hr>
	<!-- 글 내용 -->
	<div id="boardContent" style="margin: 50px 10px;">${board.content}</div>

	<div id="box">
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
		<div id="comment">
			댓글 <span class="chkCommentCnt">${cntComment}</span>
		</div>
	</div>
	<!-- 추천, 댓글 총 갯수 -->
	<hr>
	<div  id="commentBox">
		<div class="commentList">
			<c:forEach var="commList" items="${commentList}">
	
				<c:choose>
				<%-- !!!!!!!!!!! 내가 못 보는 비댓 !!!!!!!!!!!!!! --%>
				<c:when test="${commList.CHK_LOCK eq 'y' && commList.USER_NO ne userNo && board.userNo ne userNo}">
					<c:if test="${commList.STEP eq 1 }">
						<div class="reIcon"><i class="bi bi-arrow-return-right"></i></div>
					</c:if>
						<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
						<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
							<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
							<c:if test="${today - commDate le 2}">
							<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
						</c:if>
						<br>
						<sapn><i class="bi bi-lock-fill"></i> 해당 댓글은 작성자와 운영진만 볼 수 있습니다</sapn>
				</c:when>
				
				<%--비댓 아님 --%>
				<c:when test="${commList.CHK_LOCK eq 'n'}">	
					<div class="upBox">
					<div style="float: right;">
						<span onclick="reply(this)" class="reply" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" 
						data-parentNo="${commList.PARENT_NO}" data-userNick="${commList.USER_NICK}"  data-replyNo="${commList.USER_NO}" >답글</span>	
					<c:if test="${commList.USER_NO eq userNo}">					
						<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}" data-comImg="${commList.COMFILE_STORED}" >수정</span>				
						<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}">삭제</span>	
					</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					
					<%-- 대댓 --%>
						<c:if test="${commList.STEP eq 1 }">
							<div class="reIcon"><i class="bi bi-arrow-return-right"></i></div>
							<div class="viewReply">
							<span>${commList.USER_NICK}</span>
							<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
							<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
								<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
									<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
									<c:if test="${today - commDate le 2}">
									<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
								</c:if>
							<br>
							<div style="white-spac: pre-wrap"><b>@${commList.REPLY_NICK}</b>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${commList.COMM_CONTENT}" /></div>
							<c:if test="${commList.COMFILE_STORED  ne null}">
								<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
							</c:if>
							</div>
						</c:if>
						
					<%-- 본댓 --%>
						<c:if test="${commList.STEP eq 0 }">
						<div>
							<span>${commList.USER_NICK}</span>
							<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
								<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
									<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
									<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
									<c:if test="${today - commDate le 2}">
									<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
								</c:if>
								<br>
								<div style="white-spac: pre-wrap"><c:out value="${commList.COMM_CONTENT}" /></div>		
								</div>
								<c:if test="${commList.COMFILE_STORED  ne null}">
									<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
								</c:if>
						</c:if>
				
						<%-- 답글 폼 --%>
						<div class="replyComm">
						<form class="replyCommentFile">
							<input type="hidden" value="${board.boardNo}" id="boardNo">
							<textarea  class="replyCount" onkeyup="replyCount(this)" maxlength="{200}" style="border: none; width:100%; height: 100px; resize: none; margin-bottom:5px;"
							 placeholder="인터넷은 함께하는 공간입니다.&#13;&#10;타인을 비방하거나 명예를 훼손하는 댓글은 운영원칙에 따라 제재를 받을 수 있습니다"></textarea>
							<div  style="float:left;">
								<label for="rfile" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
								<input type="file" id="rfile" name='rfile'  accept="image/*" style="display: none;">
							</div>
							<div style="float:right;"  >
									<span class="replytextCount">0</span>
									<span class="replytextTotal">/200</span>	&nbsp;&nbsp;					
								비밀 댓글
								<input type="checkbox" class="reLock" name="reLock">
								&nbsp;&nbsp;<button type="button" onclick="replyBtn(this)" class="replyBtn" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" 
						data-parentNo="${commList.PARENT_NO}" data-userNick="${commList.USER_NICK}" data-replyNo="${commList.USER_NO}">등록</button></div>
						</form>
						</div>
						
						<%-- 수정 폼 --%>
						<div class="updateContent">
						<form class="updateFile">
							<input type="hidden" id="commNo" value="${commList.COMMENT_NO}">
							<textarea  class="updateCount" onkeyup="updateCount(this)" maxlength="{200}" style="border: none; width:100%; height: 100px; 
							resize: none; margin-bottom:5px;">${commList.COMM_CONTENT}</textarea>
							
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div class="imgX" style="margin-bottom: 10px;">
							<div><span onclick="deleteImg(this)" class="deleteImg" data-commNo="${commList.COMMENT_NO}"><i class="bi bi-x-circle-fill"></i></span></div>
							<img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
							
								<div  style="float:left;">
									<label for="updatefile" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
									<input type="file" id="updatefile" name='updatefile'  accept="image/*" style="display: none;">
								</div>
								
								<div style="float:right;"  >
									
										<span class="updatetextCount">0</span>
										<span class="updatetextTotal">/200</span>	&nbsp;&nbsp;	
										
								비밀 댓글
								<c:if test="${commList.CHK_LOCK eq 'n'}">					
									<input type="checkbox" class="updateLock">
								</c:if>
								<c:if test="${commList.CHK_LOCK eq 'y'}">					
									<input type="checkbox" class="updateLock" checked="checked">
								</c:if>
								&nbsp;&nbsp;<button type="button"  onclick="updateConfirm(this)" class="updateConfirm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						 data-comImg="${commList.COMFILE_STORED}">등록</button>
						</div>
						 </form>
						</div>
					</div>
				</c:when>

				<%--비댓인데 나한테 보이는 것 --%>
				<c:otherwise>
					<div class="upBox">
					<div style="float: right;">
						<span onclick="reply(this)" class="reply" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" 
						data-parentNo="${commList.PARENT_NO}" data-userNick="${commList.USER_NICK}"  data-replyNo="${commList.USER_NO}" >답글</span>	
						<c:if test="${commList.USER_NO eq userNo}">					
							<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
							data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}" data-comImg="${commList.COMFILE_STORED}">수정</span>				
							<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" >삭제</span>	
						</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					
					<%-- 비댓의 대댓 --%>
						<c:if test="${commList.STEP eq 1 }">
						<div>
							<div class="reIcon"><i class="bi bi-arrow-return-right"></i></div>
							<div class="viewReply">
							<span>${commList.USER_NICK}</span>
							<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
								<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
								<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
										<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
										<c:if test="${today - commDate le 2}">
										<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
										</c:if>
								<br>
							<div style="white-spac: pre-wrap"><i class="bi bi-lock-fill"></i><b>@${commList.REPLY_NICK}</b>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${commList.COMM_CONTENT}" /></div>
							
							<c:if test="${commList.COMFILE_STORED  ne null}">
								<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
							</c:if>
							</div>
						</div>
						</c:if>
					<%-- 비댓의 본댓 --%>
						<c:if test="${commList.STEP eq 0 }">
							<span>${commList.USER_NICK}</span>
							<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
								<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
								<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
										<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
										<c:if test="${today - commDate le 2}">
										<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
										</c:if>
								<br>
								<div style="white-spac: pre-wrap"><i class="bi bi-lock-fill"></i><c:out value="${commList.COMM_CONTENT}" /></div>		
								<c:if test="${commList.COMFILE_STORED  ne null}">
									<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
								</c:if>
						</c:if>
						
						<%-- 비댓의 대댓 폼 --%>
						<div class="replyComm">
						<form class="replyCommentFile">
							<input type="hidden" value="${board.boardNo}" id="boardNo">
							<textarea  class="replyCount" onkeyup="replyCount(this)" maxlength="{200}" style="border: none; width:100%; height: 100px; resize: none; margin-bottom:5px;"
							 placeholder="인터넷은 함께하는 공간입니다.&#13;&#10;타인을 비방하거나 명예를 훼손하는 댓글은 운영원칙에 따라 제재를 받을 수 있습니다"></textarea>
							<div  style="float:left;">
								<label for="rfile" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
								<input type="file" id="rfile" name='rfile'  accept="image/*" style="display: none;">
							</div>
							<div style="float:right;"  >
									<span class="replytextCount">0</span>
									<span class="replytextTotal">/200</span>	&nbsp;&nbsp;					
									비밀 댓글
									<input type="checkbox" class="reLock" name="reLock">
									&nbsp;&nbsp;<button type="button" onclick="replyBtn(this)" class="replyBtn" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" 
							data-parentNo="${commList.PARENT_NO}" data-userNick="${commList.USER_NICK}" data-replyNo="${commList.USER_NO}">등록</button></div>
						</form>
						</div>
					
						<%-- 비댓의 수정 폼 --%>	
						<div class="updateContent">
						<form class="updateFile" name="updateFile">
							<input type="hidden" id="commNo" value="${commList.COMMENT_NO}">
							<textarea  class="updateCount" onkeyup="updateCount(this)" maxlength="{200}" style="border: none; width:100%; height: 100px; 
							resize: none; margin-bottom:5px;">${commList.COMM_CONTENT}</textarea>
								<c:if test="${commList.COMFILE_STORED  ne null}">
									<div class="imgX" style="margin-bottom: 10px;">
									<div><span onclick="deleteImg(this)" class="deleteImg" data-commNo="${commList.COMMENT_NO}"><i class="bi bi-x-circle-fill"></i></span></div>
									<img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
								</c:if>
							
								<div  style="float:left;">
									<label for="updatefile" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
									<input type="file" id="updatefile" name='updatefile'  accept="image/*" style="display: none;">
								</div>
								
								<div style="float:right;"  >
									
										<span class="updatetextCount">0</span>
										<span class="updatetextTotal">/200</span>	&nbsp;&nbsp;	
										
								비밀 댓글
								<c:if test="${commList.CHK_LOCK eq 'n'}">					
									<input type="checkbox" class="updateLock">
								</c:if>
								<c:if test="${commList.CHK_LOCK eq 'y'}">					
									<input type="checkbox" class="updateLock" checked="checked">
								</c:if>
								&nbsp;&nbsp;<button type="button" onclick="updateConfirm(this)" class="updateConfirm" 
								data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}"  data-comImg="${commList.COMFILE_STORED}" >등록</button></div>
							</form>
						</div>
						
					</div>				
				</c:otherwise>				
			</c:choose>
			<hr>
		</c:forEach>
		</div>
		
			<!-- 댓글 작성 -->
			<form id="commentFile" name="commentFile">
			<div id="writeComm">
				<input type="hidden" value="${board.boardNo}" id="boardNo">
				<textarea  id="commentContent" onkeyup="count()" maxlength="{200}" style="border: none; width:100%; height: 100px; resize: none; margin-bottom:5px;"
				 placeholder="인터넷은 함께하는 공간입니다.&#13;&#10;타인을 비방하거나 명예를 훼손하는 댓글은 운영원칙에 따라 제재를 받을 수 있습니다"></textarea>
				<div  style="float:left;">
					<label for="file" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
					<input type="file" id="file" name='file'  accept="image/*" style="display: none;">
				</div>
				
				<div style="float:right;"  >
					
						<span class="textCount">0</span>
						<span class="textTotal">/200</span>	&nbsp;&nbsp;					
					
					비밀 댓글
					<input type="checkbox" id="chkLock" name="chkLock">
					&nbsp;&nbsp;<button type="button"  id="commentBtn">등록</button></div>
				</div>
			</form>
	<!-- 댓글 끝 -->	
	<div style="float:right; margin-top: 30px;">
	<c:if test="${board.userNo eq userNo }" >
		<a href="./updateBoard?boardNo=${board.boardNo}"><button id="updateBoard">수정</button></a>
		<a href="./deleteBoard?boardNo=${board.boardNo}"><button id="deleteBoard">삭제</button></a>
	</c:if>
	</div>
	</div>


	
	
	<div style="margin-top: 10px;">
	<a href="./list">전체목록</a>
	<a href="./write">글작성</a>
	</div>
	
	<div style="margin-top: 15px;">
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
	</div>
	<div style="float:right;">
	<a href="#">TOP</a>
	</div>
</div>




<c:import url="/WEB-INF/views/layout/footer.jsp" />