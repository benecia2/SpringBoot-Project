<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
	<div class="container">
		<h1><b>공지 및 문의게시판</b></h1>
	</div>
</div>

<div class="container">
	
	<div>
	<h3><b>게시글(${count})</b></h3>
	<sec:authorize access="isAuthenticated()">
	<div class="mb-3" align="right">
		<a href="/board/insert"><button type="button" class="btn btn-warning">글쓰기</button></a>
	</div>
	</sec:authorize>
	</div>
	<table class="table table-hover">
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
 						<c:when test="${board.admin == 'ROLE_ADMIN'}">
      						<b>[공지사항]</b>
    					</c:when>
   					 <c:otherwise>
     					<c:if test="${board.replycnt > 0}">
       						 답변완료
     					</c:if>
      					<c:if test="${board.replycnt == 0}">
        					 미답변
      					</c:if>
   					 </c:otherwise>
                      </c:choose>
               		</td>
					<td style="text-align: center"><a href="view/${board.num}">${board.title} [${board.replycnt}]</a></td>
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
    <li class="page-item"><a class="page-link" href="/board/list?pageNum=${p.startPage-p.blockPage}">Previous</a></li>
  </c:if>
  <!-- 페이지번호 -->
  <c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
  <c:if test="${p.currentPage==i}">
  <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
  </c:if>
  <c:if test="${p.currentPage!=i}">
    <li class="page-item"><a class="page-link" href="/board/list?pageNum=${i}">${i}</a></li>
   </c:if>
  </c:forEach>
  <!-- 다음 -->
  <c:if test="${p.endPage < p.totPage}">
    <li class="page-item"><a class="page-link" href="/board/list?pageNum=${p.endPage+1}">Next</a></li>
   </c:if>
  </ul>

<!-- 검색 -->  
<form class="form-inline" action="/board/list" method="get">
			<select name="field"   id="field" class="form-control mr-sm-1">
				<option value="title">제목</option>
				<option value="bwriter">작성자</option>
			</select>
			<input type="text" name="word" class="form-control" placeholder="Search">
			<button class="btn btn-primary"  type="submit">검색</button>
</form>  
  
</div>
	
	
</div>
  

  
<%@ include file="/WEB-INF/views/footer.jsp"%>