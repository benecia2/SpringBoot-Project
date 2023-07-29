<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
  <div class="container">
    <h1><b>회원관리</b></h1>      
  </div>
</div>

<div class="container">
<h3><b>회원목록(${count})</b></h3><br/>
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 100px; background-color: #ED7D31; font-weight: bold; text-align: center; color: white">회원번호</th>
				<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">ID</th>
				<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">NAME</th>
				<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">회원유형</th>
			</tr>
		</thead>
		<tbody>
			
<c:forEach items="${member}" var="m" varStatus="st">
				<tr>
			<!--  	<td>${rowNo-st.index}</td>    -->
					<td style="text-align: center"><b>${m.mnum}</b></td>
					<td style="text-align: center"><a href="view/${m.id}">${m.id}</a></td>
					<td style="text-align: center">${m.name}</td>

					 <td style="text-align: center">
      <c:choose>
        <c:when test="${m.admin == 'ROLE_MEMBER'}">일반사용자</c:when>
        <c:when test="${m.admin == 'ROLE_ADMIN'}"><b>관리자</b></c:when>
        <c:otherwise>알 수 없음</c:otherwise>
      </c:choose>
    </td>
  </tr>
</c:forEach>
			
		</tbody>			
	</table>

	<!-- 페이지 -->
		<div class="d-flex justify-content-between">
  <ul class="pagination">
  <!-- 이전 -->
  <c:if test="${p.startPage> p.blockPage}">
    <li class="page-item"><a class="page-link" href="/list?pageNum=${p.startPage-p.blockPage}">Previous</a></li>
  </c:if>
  <!-- 페이지번호 -->
  <c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
  <c:if test="${p.currentPage==i}">
  <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
  </c:if>
  <c:if test="${p.currentPage!=i}">
    <li class="page-item"><a class="page-link" href="/list?pageNum=${i}">${i}</a></li>
   </c:if>
  </c:forEach>
  <!-- 다음 -->
  <c:if test="${p.endPage < p.totPage}">
    <li class="page-item"><a class="page-link" href="/list?pageNum=${p.endPage+1}">Next</a></li>
   </c:if>
  </ul>
 
<!-- 검색 -->  
<form class="form-inline" action="/list" method="get">
			<select name="field"   id="field" class="form-control mr-sm-1">
				<option value="id">ID</option>
				<option value="name">NAME</option>
			</select>
			<input type="text" name="word" class="form-control" placeholder="Search">
			<button class="btn btn-primary"  type="submit">검색</button>
</form>  
  
</div>



</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>