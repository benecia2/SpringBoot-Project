<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
	<div class="container">
		<h1><b>도서 대여 현황</b></h1>
	</div>
</div>

<div class="container">
	<h3><b>대여 도서 목록(${count })</b></h3>
	<table class="table table-bordered">
		<br/>
		<tr>
			<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">대여번호</th>
			<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">도서명</th>
			<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">대여날짜</th>
			<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">반납날짜</th>
			<th style="background-color: #ED7D31; font-weight: bold; text-align: center; color: white">대여정보</th>
		</tr>
		<c:forEach items="${rentlists }" var="rent" varStatus="st">
			<tr>
				<td style="text-align: center;">${rent.rnum }</td>
				<td style="text-align: center;">${rent.bname }</td>
				<td style="text-align: center;">${rent.bdate }</td>
				<td style="text-align: center;">${rent.rdate }</td>
				<td style="text-align: center;">${rent.rentinfo }
				<c:if test="${rent.rentinfo == '대여승인' }">
				<b>(대여중)</b>
				</c:if>
				</td>			
			</tr>
		</c:forEach>
	</table>
	
	<div class="d-flex justify-content-between">
		<ul class="pagination" >
			<!-- 이전 -->
			<c:if test="${p.startPage >p.blockPage}">
				<li class="page-item">
				<a class="page-link" href="/rentlist/rentlist?pageNum=${p.startPage-p. blockPage }">이전</a></li>
			</c:if>
			
		<!--페이지번호-->
			<c:forEach begin="${p.startPage }" end="${p.endPage }" var="i">
				<c:if test="${p.currentPage ==i}">
					<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
				</c:if>
				<c:if test="${ p.currentPage !=i}">
				<li class="page-item">
				<a class="page-link" href="/rentlist/rentlist?pageNum=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			
			<!--다음-->
			<c:if test="${p.endPage <  p.totPage }">
				<li class="page-item">
				<a class="page-link" href="/rentlist/rentlist?pageNum=${p.endPage+1 }">다음</a></li>
			</c:if>
		</ul>
		
		<form class="form-inline" action="/rentlist/rentlist" method="get">
			<select name="field"   id="field" class="form-control mr-sm-1">
				<option value="bname">도서명</option>
				<option value="bwho">대여인</option>
			</select>
			<input type="text" name="word" class="form-control"
				placeholder="Search">
			<button class="btn btn-primary"  type="submit">검색</button>
		</form>
		
	</div>
	
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>