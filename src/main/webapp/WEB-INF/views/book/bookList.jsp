<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<head> 
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
 .thumbnail {
    padding:0;
}	 
 .background-img { 
  background: url("/resources/background/background2.jpg") no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  opacity: 0.9;
  /* margin-top:30px; */
	}  

<%--
 .book-card {
        height: 1000px; /* 필요에 따라 높이 값을 조정하세요 */
    }
--%>
    	
</style>
</head>

<!-- 검색코드  -->
<body class="background-img">
<br/>
<div class="d-flex justify-content-center">
<form class="form-inline" action="/book/bookList" method="get">
	<select name="field"   id="field" class="form-control mr-sm-1">
		<option value="bname">도서명</option>
		<option value="writer">저자</option>
	</select>
	<input type="text" name="word" class="form-control" 
		placeholder="Search">
	 <button class="btn btn-info"  type="submit">검색</button>
</form>
</div>

<!-- 페이지 코드 -->
   	<div class="d-flex justify-content-center">
		<ul class="pagination" >
			<!-- 이전 -->
			<c:if test="${p.startPage >p.blockPage}">
				<li class="page-item">
				<a class="page-link" href="/book/bookList?pageNum=${p.startPage-p. blockPage }">이전</a></li>
			</c:if>
			
		<!--페이지번호-->
			<c:forEach begin="${p.startPage }" end="${p.endPage }" var="i">
				<c:if test="${p.currentPage ==i}">
					<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
				</c:if>
				<c:if test="${ p.currentPage !=i}">
				<li class="page-item">
				<a class="page-link" href="/book/bookList?pageNum=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			
			<!--다음-->
			<c:if test="${p.endPage <  p.totPage }">
				<li class="page-item">
				<a class="page-link" href="/book/bookList?pageNum=${p.endPage+1 }">다음</a></li>
			</c:if>
		</ul>
	</div> 


<hr>
<div class="container">
	<div class="row">
		<c:forEach items="${booklist}"  var="book"  varStatus="st">
			<div class="col-xs-12 col-sm-6 col-md-4 book-card">
				<div class="thumbnail">
					<img src="/resources/img/${book.bimg}" alt="도서 이미지">
					<div class="caption">
						<h5><strong>도서명 : </strong>${book.bname}</h5>
						<p><strong>도서번호 : </strong>${book.bnum}</p>
						<p><strong>저자 : </strong>${book.writer}</p>
						<p><strong>출판사 : </strong>${book.publicsher}</p>
						<p><strong>줄거리 : </strong>${book.content} ... 중략</p>
						<!-- 대여여부에 따라 텍스트 색상 변경 -->
						<p><strong>대여여부 : </strong>
						<c:choose>
   <c:when test="${book.brentinfo == '대여가능' || book.brentinfo == '반납' || book.brentinfo == '대여거부'}">
        <span class="text-primary">대여가능</span></c:when>
   <c:when test="${book.brentinfo == '대여승인' || book.brentinfo == '대여승인중'}">
        <span class="text-danger">대여불가</span></c:when>
						</c:choose>
						</p>
						
						<sec:authorize access="isAuthenticated()">
							<c:if test="${book.brentinfo == '대여가능' || book.brentinfo == '반납' || book.brentinfo == '대여거부'}">
								<a href="/rentlist/view/${book.bnum}/${book.bname}"><button type="button" class="btn btn-primary btn-sm">대여신청</button></a>
							</c:if> 
						</sec:authorize>
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="btn btn-danger btn-sm btnDelete" data-bnum="${book.bnum}">삭제</button>
						</sec:authorize>
						
						<c:if test="${book.id == principal.member.id }">
							<button type="button" class="btn btn-danger btn-sm btnDelete" data-bnum="${book.bnum}">삭제</button>
						</c:if>
						
						
					</div>
				</div>
			</div>
		</c:forEach>
	</div><!--/row-->
</div><!--/container -->  
</body>



<%-- <div class="container">  기존에 하던거
    <h2>도서 목록(${count })</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
            
                <th style="width: 10%">도서코드</th>
                <th style="width: 10%">도서명</th>
                <th style="width: 10%">저자</th> 
                <th style="width: 10%">출판사</th>
                <th>이미지</th>
                <th style="width: 15%">줄거리</th>
                <th style="width: 10%">대여여부</th>
                
                
                
                	 <sec:authorize access="hasRole('ROLE_ADMIN')">
               		 <th style="width: 11%">관리자</th>
					</sec:authorize>
                
            
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${booklist}" var="book" varStatus="st">
                <tr>
                    <td class="book-num">${book.bnum}</td>  
                    <td class="book-name">${book.bname}</td>
                    <td>${book.writer}</td>
                    <td>${book.publicsher}</td>
                    <td>
                    <img src="/resources/img/${book.bimg}" alt="도서 이미지"  class="book-image">
                    </td>
                    <td>${book.content}</td>
                    
                    <td>${book.state}</td>
                    
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
               	             <td>
                    <button type="button" class="btn btn-danger btn-sm  btnDelete"  data-bnum="${book.bnum }">삭제</button>

                     <!-- 링크방식  -->
						<c:if test="${book.state eq '대여가능'}">
							<a href="/rentlist/view/${book.bnum }/${book.bname}"><button	type="button" class="btn btn-primary btn-sm">대여</button></a>
						</c:if> 

                    <!-- 파라미터 방식 -->
                    <a href="/rentlist/view/?bnum=${book.bnum }&bname=${book.bname}"><button type="button" class="btn btn-primary btn-sm">대여</button></a>
                    </td>
					</sec:authorize>
                    
  
                    
                </tr>
            </c:forEach>
        </tbody>
    </table> --%>
    

















<script>
//삭제
$(".btnDelete").click(function(){
	var bnum = $(this).data("bnum");
	if(!confirm("삭제 하시겠습니까?"))
		return false;
	$.ajax({
		type:"DELETE",
		url:"/book/bookDelete/"+ bnum,
		success:function(resp){
			alert("도서 삭제완료");
			location.href="/book/bookList";
		},
		error:function(e){
			alert("도서 삭제 실패"+e);
		}
	});
});

</script>



	