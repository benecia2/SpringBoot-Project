<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
	<div class="container">
		<h1><b>문의게시판</b></h1>
	</div>
</div>

<div class="container">
 	<form action="/board/insert" method="post">
		<br/><h2><b>글쓰기</b></h2><br/>

<input type="hidden" id="bmnum" name="bmnum" value="${principal.member.mnum}">
<input type="hidden" id="admin" name="admin" value="${principal.member.admin}">

		<div class="form-group">
				<label for="bwriter">writer:</label> 
				<input type="text"
					class="form-control" id="bwriter" name="bwriter"
					value="${principal.member.name}" readonly="readonly"/>
		</div>
		
		<div class="form-group">
				<label for="title">title:</label> 
				<input type="text"
					class="form-control" id="title" placeholder="Enter Title" name="title">
		</div>

		<div class="form-group">
				<label for="content">content:</label><br/>
				<textarea class="form-control" rows="5" name="content" id="content"></textarea>
		</div>
	<br/>
	<button type ="submit" class ="btn btn-primary">등록하기</button>
	</form>
</div>	

<%@ include file="/WEB-INF/views/footer.jsp"%>