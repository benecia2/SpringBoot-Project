<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
	<div class="container">
	   <c:choose>
	     <c:when test="${board.admin == 'ROLE_ADMIN' }">
	     <h1><b>공지사항</b></h1>
	     </c:when>
	   <c:otherwise>  
		<h1><b>${board.bwriter}의 글</b></h1>
	   </c:otherwise>
	   </c:choose>	
	</div>
</div>

<div class="container">
<h3><b>문의글 내용</b></h3>
<div class="mb-3" align="right">
		<a href="/board/list"><button type="button" class="btn btn-warning">목록으로</button></a>
	</div>
	
<input type="hidden" id="num" value="${board.num }">
<input type="hidden" id="writer" value="${principal.member.name}">

<table class="table table-hover">
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">번호</th>
	<td class="col-3">${board.num }</td>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">글 제목</th>
	<td class="col-3" >${board.title}</td>
</tr>
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">글쓴이</th>
	<td class="col-3">${board.bwriter}</td>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">작성일</th>
	<td class="col-3"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
</tr>
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white; vertical-align: middle; ">글내용</th>
	<td colspan="3" style="height: 150px; vertical-align: middle; ">${board.content }</td>
</tr>
</table>

<sec:authorize access="isAuthenticated()">
<c:if test="${principal.member.name==board.bwriter || principal.member.admin == 'ROLE_ADMIN'}"> <!-- header에서 principal 설정해둠 -->
<button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
<button type="button" class="btn btn-danger btn" id="btnDelete">삭제</button><br/><br/>
</c:if>
</sec:authorize>
</div>



<script>
//수정
$("#btnUpdate").click(function(){
	if(!confirm('게시글을 변경할까요?'))
		return false;
		location.href="/board/update/${board.num}"
})

//삭제
 $("#btnDelete").click(function(){
	 if(!confirm('게시글을 삭제하시겠습니까?')) // false(삭제안함)
		 return false;
	 $.ajax({
		 type:"delete",
		 url:"/board/delete/${board.num}",
		 success:function(resp){
			 alert("게시글 삭제가 완료되었습니다.");
			 location.href="/board/list"
		 },
		 error:function(xhr, status, error){
			 alert("게시글 삭제 실패.");
		 }
	 }) //ajax
 }) // btnDelete
 
</script>

<!-- 댓글 -->


<div class="container">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div class="form-group">
			<br/><h6><label for="msg"><h3><b>답글 작성 :</b></h3></label></h6>
			<textarea class="form-control" rows="5" id="msg" name="msg"></textarea>
</div>
	<button class="btn btn-success btn-sm" id="commentBtn">Comment Write</button>
	<br/><br/>
</sec:authorize>
	<div id = "replyResult"></div>

</div>


<script>

//댓글쓰기
$("#commentBtn").click(function(){
	if($("#msg").val()=="") {
		alert("댓글 입력하세요");
		return;
	}
	var data= {
			"bnum":$("#num").val(),
			"content":$("#msg").val(),
			"cwriter":$("#writer").val()
	}
	$.ajax({
		type:"post",
		url:"/reply/insert/",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
		.done(function(resp,status) {
			alert("댓글 작성 완료")
			init()

		})
		.fail(function(){
			alert("댓글 작성 실패")
		})
}) // commentBtn

//댓글 리스트
var init = function() {
	$.ajax({
		type:'get',
		url:'/reply/list/${board.num}'
	})
	.done(function(resp) {
		var str="<table class='table class='table table-hover reply-table' style='table-layout: fixed; width: 100%;''> <h3><b>답글</b></h3><br/>"
			str+="<tr><th style='font-weight: bold; text-align: center;'>writer</th><th style='font-weight: bold; text-align: center;'>Content</th><th></th><th></th><th></th><th><th></th><th></th></th><th></th><th></th></tr>"
		$.each(resp, function(key,val) {
			str+="<tr>"
			str+="<td style='text-align:center'>"+val.cwriter+"</td>"
			str+="<td colspan='8'>"+val.content+"</td>"
			if("${principal.member.admin.replace('ROLE_', '')}" === "ADMIN") {
				str+="<td><a href='javascript:fdel("+val.cnum+")'>삭제</a><td>"
			}
			str+="</tr>"
		})  //each
		str+="</table>"
		$("#replyResult").html(str);
	})
	
} //init

//댓글삭제
function fdel(cnum){
	$.ajax({
		type:'delete',
		url:'/reply/delete/'+cnum
	})
	.done(function(resp){
		alert(resp+"번 삭제 완료")
		init()
	})
	.fail(function(e) {
		alert("삭제 실패 :"+e)
	})
}


init()

</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>





