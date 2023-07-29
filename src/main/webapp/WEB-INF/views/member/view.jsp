<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
  <div class="container">
    <h1><b>${member.name}님의 정보</b></h1>      
  </div>
</div>


<div class="container">
<h3><b>회원 개인정보</b></h3><br/>
<table class="table table-hover">
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">회원번호</th>
	<td class="col-3">${member.mnum}</td>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">ID</th>
	<td class="col-3">${member.id}</td>
</tr>
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">이름</th>
	<td class="col-3">${member.name}</td>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">Email</th>
	<td class="col-3">${member.email}</td>
</tr>
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">주소</th>
	<td class="col-3">${member.address}</td>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">tel</th>
	<td class="col-3">${member.tel}</td>
</tr>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<tr>
	<th class="col-3" style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">회원유형</th>
	<td class="col-3">
	  <c:choose>
        <c:when test="${member.admin == 'ROLE_MEMBER'}">일반사용자</c:when>
        <c:when test="${member.admin == 'ROLE_ADMIN'}">관리자</c:when>
        <c:otherwise>알 수 없음</c:otherwise>
      </c:choose>
      </td>
</tr>
</sec:authorize>
</table>

<sec:authorize access="isAuthenticated()">
<c:if test="${principal.username==member.id}"> <!-- header에서 principal 설정해둠 -->
<button type="button" class="btn btn-primary" id="btnUpdate">회원정보 변경</button>
<button type="button" class="btn btn-danger btn" id="btnDelete">회원 탈퇴</button>
</c:if>
</sec:authorize>
<c:if test="${member.admin== 'ROLE_MEMBER'}">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div class="mb-3" align="right">
<button type="button" class="btn btn-danger btn" id="btnDelete" >회원 삭제</button>
</div>
</sec:authorize>
</c:if>

<c:if test="${member.admin == 'ROLE_ADMIN'}">
<c:if test="${principal.username!=member.id}">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <b style="color: red;">※ 관리자는 삭제시킬 수 없습니다.</b>
    </sec:authorize>
</c:if>
</c:if>

<div>
<table class="table table-hover">
<br/><br/><h3><b>회원 문의내역(${count})</b></h3><br/>
		<thead>
			<tr>
				<th style="width: 100px; background-color: #ED7D31; font-weight: bold; text-align: center; color: white">답변상태</th>
				<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">제목</th>
				<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">작성자</th>
				<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${board}" var="board" varStatus="st">
				<tr>
		 	 		<td style="text-align: center">
                      <c:choose>
				  <c:when test="${board.replycnt > 0}">
				  	<b>답변완료</b>
				  </c:when>
				 <c:otherwise>
				   미답변
				 </c:otherwise>
				</c:choose>
               		</td>
					<td style="text-align: center"><a href="/board/view/${board.num}">${board.title} [${board.replycnt}]</a></td>
					<td style="text-align: center">${board.bwriter}</td>
					<td style="text-align: center"><fmt:formatDate value="${board.regdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>


			</c:forEach>

		</tbody>
			
	</table>
	
		<!-- 페이지 -->
		<div class="d-flex justify-content-between">
  <ul class="pagination">
  <!-- 이전 -->
  <c:if test="${p.startPage> p.blockPage}">
    <li class="page-item"><a class="page-link" href="/view/${member.id}?pageNum=${p.startPage-p.blockPage}">Previous</a></li>
  </c:if>
  <!-- 페이지번호 -->
  <c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
  <c:if test="${p.currentPage==i}">
  <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
  </c:if>
  <c:if test="${p.currentPage!=i}">
    <li class="page-item"><a class="page-link" href="/view/${member.id}?pageNum=${i}">${i}</a></li>
   </c:if>
  </c:forEach>
  <!-- 다음 -->
  <c:if test="${p.endPage < p.totPage}">
    <li class="page-item"><a class="page-link" href="/view/${member.id}?pageNum=${p.endPage+1}">Next</a></li>
   </c:if>
  </ul>
</div>
</div>



</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>

<script>
//수정
$("#btnUpdate").click(function(){
	if(!confirm('회원정보를 변경할까요?'))
		return false;
		location.href="/update/${member.id}"
})

//삭제
 $("#btnDelete").click(function(){
	 if(!confirm('회원탈퇴를 진행하시겠습니까?')) // false(삭제안함)
		 return false;
	 $.ajax({
		 type:"delete",
		 url:"/delete/${member.id}",
		 success:function(resp){
			 alert("회원탈퇴가 완료되었습니다.");
			 location.href="/join"
		 },
		 error:function(xhr, status, error){
			 alert("회원탈퇴 실패.");
		 }
	 }) //ajax
 }) // btnDelete
 
</script>

