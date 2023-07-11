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
	
	#commentBtn{
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
	#writeComm{		
		background-color: white;
		margin: 30px; 
		padding: 10px 20px 35px 20px;
	}
	
	#commfile{
		width: 150px;
		height: 150px;
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
					
				} else if(data.result == false) { //찜 취소
					$("#updateRecomm").removeClass("bi-suit-heart-fill")
					$("#updateRecomm").addClass("bi-suit-heart")
					console.log("왜죠?")
					console.log(data)
					
					console.log(data.cntRecommend)
					$("#cntRecommend").html(data.cntRecommend)
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
			var boardNo = $(this).attr("data-boardNo");
			console.log(commentNo)
			console.log(boardNo)
			
			var chk = confirm("정말 삭제하시겠습니까?");
			if(chk){
			$.ajax({
				type : 'post',
				url : '/board/commDelete',
				dataType: 'html',
				data: {boardNo: boardNo,
						commentNo: commentNo },
				success: function(data) {
					console.log("댓글 성공")
					console.log(data)
					$(".commentList").html(data)
						
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
					console.log(data)
					$(".imgX").html(data)
						
				},error: function (request, status, error) {
			        console.log("error");
			    }
			})
}

$(function(){
	$("#numbers").on("click","#modal", function(){
		console.log("modal")
	})
	
})

function reply(th) {
	
		console.log("click")
		var idx = $(".reply").index(th)
		var commentNo = $(".reply").eq(idx).attr("data-commNo");
		var boardNo = $(".reply").eq(idx).attr("data-boardNo");
		console.log(commentNo)
		console.log(boardNo)
		
		$(".replyComm").show()

}


</script>
	
<div class="container">
	<h3 style="font-family: 'SBAggroM'; text-align: center; ">${board.title}</h3>
	<!-- 작성자, 글 정보 -->
	<div>
			<h6><i class="bi bi-person-circle"></i>&nbsp;&nbsp;${writerNick}</h6>
			<span style="font-size: 13px;"><fmt:formatDate value="${board.writeDate}" pattern="yy/MM/dd HH:mm:SS"/></span>
		
		<div class="numbers" style="float:right">
			<span>조회수 ${board.hit}</span>
			<span>댓글수 ${cntComment}</span>
			<span>추천수 ${cntRecommend}</span>
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
			댓글 <span id="Cntcom">${cntComment}</span>
		</div>
	</div>
	<!-- 추천, 댓글 총 갯수 -->
	<hr>
	<div  id="commentBox">
		<div class="commentList">
			<c:forEach var="commList" items="${commentList}">
				<c:choose>
				<c:when test="${commList.CHK_LOCK eq 'y' && commList.USER_NO ne userNo && board.userNo ne userNo}">
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" 
					pattern="yy.MM.dd HH:mm"/></span><br>
					<sapn><i class="bi bi-lock-fill"></i> 해당 댓글은 작성자와 운영진만 볼 수 있습니다</sapn>
				</c:when>
				
				
				<c:when test="${commList.CHK_LOCK eq 'n'}">				
					<div class="upBox">
					<div style="float: right;">
						<span onclick="reply(this)" class="reply" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" >답글</span>	
					<c:if test="${commList.USER_NO eq userNo}">					
						<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}" data-comImg="${commList.COMFILE_STORED}" >수정</span>				
						<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}">삭제</span>	
					</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					<span>${commList.USER_NICK}</span>
					<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span><br>

					
						<div style="white-spac: pre-wrap"><c:out value="${commList.COMM_CONTENT}" /></div>
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
						
						<form class="replyComFile" name="commentFile">
						<div class="replyComm">
							<input type="hidden" value="${board.boardNo}" id="boardNo">
							<textarea  class="replyContent" onkeyup="count()" maxlength="{200}" style="border: none; width:100%; height: 100px; resize: none; margin-bottom:5px;"
							 placeholder="인터넷은 함께하는 공간입니다.&#13;&#10;타인을 비방하거나 명예를 훼손하는 댓글은 운영원칙에 따라 제재를 받을 수 있습니다"></textarea>
							<div  style="float:left;">
								<label for="file" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
								<input type="file" class="replyfile" name='replyfile'  accept="image/*" style="display: none;">
							</div>
							
							<div style="float:right;"  >
								
									<span class="replytextCount">0</span>
									<span class="replytextTotal">/200</span>	&nbsp;&nbsp;					
								
								비밀 댓글
								<input type="checkbox" class="reLock" name="reLock">
								&nbsp;&nbsp;<button type="button"  class="replyBtn">등록</button></div>
							</div>
						</form>
					
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
				
				
				<c:otherwise>
					<div class="upBox">
					<div style="float: right;">
						<span>답글</span>	
					<c:if test="${commList.USER_NO eq userNo}">					
						<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}" data-comImg="${commList.COMFILE_STORED}">수정</span>				
						<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" >삭제</span>	
					</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					<span>${commList.USER_NICK}</span>
					<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span><br>
					
					<div style="white-spac: pre-wrap"><i class="bi bi-lock-fill"></i><c:out value="${commList.COMM_CONTENT}" /></div>
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
					
					
							
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
		<button id="updateBoard">수정</button>
		<button id="deleteBoard">삭제</button>
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