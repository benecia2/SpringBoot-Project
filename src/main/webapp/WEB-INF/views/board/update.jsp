<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
	<div class="container">
		<h1>${board.bwriter}의 글 수정하기</h1>
	</div>
</div>

<div class="container">
		<br/><h2>${board.bwriter}의 글 수정</h2><br/>

<div class="mb-3" align="right">
		<a href="/board/view/${board.num }"><button type="button" class="btn btn-secondary">수정취소</button></a>
	</div>

<input type="hidden" id="num" name="num" value="${board.num}">

		<div class="form-group">
				<label for="bwriter">writer:</label> 
				<input type="text"
					class="form-control" id="bwriter" name="bwriter"
					value="${principal.member.name}" readonly="readonly"/>
		</div>
		
		<div class="form-group">
				<label for="title">title:</label> 
				<input type="text"
					class="form-control" id="title" placeholder="Enter Title" name="title"
					value="${board.title}">
		</div>

		<div class="form-group">
				<label for="content">content:</label><br/>
				<textarea class="form-control" rows="5" name="content" id="content">${board.content}</textarea>
		</div>
	<br/>
	<button type ="button" class = "btn btn-primary" id=btnModify>수정하기</button>
</div>	

<%@ include file="/WEB-INF/views/footer.jsp"%>

<script>
$('#btnModify').click(function(){
	data = {
			"num":$("#num").val(),
			"writer":$("#bwriter").val(),
			"title":$("#title").val(),
			"content":$("#content").val()
	}
	$.ajax({
		type:'put',
		url :"/board/update",
		contentType:"application/json;charset=utf-8",
		data: JSON.stringify(data),
		success:function(resp){
			alert("수정 완료");
			location.href="/board/list"
		},
		error:function(e){
			alert("수정 실패: "+e)
		}
	})
})
</script>