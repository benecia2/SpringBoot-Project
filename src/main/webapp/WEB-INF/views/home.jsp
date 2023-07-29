<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/homeheader.jsp"%>

<style>
  .jumbotron {
    background-color: #FFF;
    background-image: url('https://easetemplate.com/free-website-templates/hike/images/pageheader.jpg');
    height: 500px; /* 원하는 높이로 조정하세요 */
    background-size: cover; /* 배경 이미지를 화면에 꽉 채우도록 설정 */
    background-position: center; /* 배경 이미지를 가운데로 정렬 */
    background-repeat: no-repeat; /* 배경 이미지를 반복하지 않도록 설정 */
    display: flex; /* flexbox 사용 */
    align-items: center; /* 수직 가운데 정렬 */
    justify-content: center; /* 수평 가운데 정렬 */
  }
  
  .jumbotron h1 {
    color: #ED7D31; /* 글자를 주황색으로 설정 */
    text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff, 1px 1px 0 #fff; /* 텍스트에 흰색 테두리 효과 추가 */
	font-size: 45px; /* 글자 크기를 36px로 설정 */
    font-weight: bold; /* 글자를 굵게 설정 */
  }
  
    .jumbotron .container h3 {
    color: #fff; /* 글자를 흰색으로 설정 */
    
  }
  
  .container-fluid {
    max-width: 60%; /* 원하는 가로 폭으로 조정하세요 */
  }
  
  .our-services .icon img {
    width: 80px; /* 원하는 가로 크기로 설정 */
    height: 80px; /* 원하는 세로 크기로 설정 */
  }
  
  .col-md-6 a {
   color :#000;
  }
  
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">

<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1><b>중고도서 나눔 플랫폼</b></h1>
		<br><h3>중고 도서를 간편하게 나눔함으로써 경제적 부담을 줄여주고 사용자의 편의성을 높여주기 위한 개방형 플랫폼입니다.</h3>
	</div>
</div>

<div class="container-fluid mb-5">
    <div class="text-center mt-5">
        <h1><b>MENU</b></h1>
    </div>
    
    <div class="row">

       <div class="col-md-6">
       <sec:authorize access="isAnonymous()">
            <a href="/join"><div class="box">
                <div class="our-services ssl">
                    <div class="icon"> <img src="/resources/homeimg/JOIN.png"> </div>
                    <h3><b>회원가입</b></h3>
                    <p><br/>처음이신가요? 회원가입을 통해 서비스를 이용해보세요!</p>
                </div>
            </div></a>
       </sec:authorize> 
       <sec:authorize access="isAuthenticated()">
         <sec:authorize access="hasRole('ROLE_MEMBER')">
            <a href="/book/bookInsert"><div class="box">
                <div class="our-services ssl">
                    <div class="icon"> <img src="/resources/homeimg/JOIN.png"> </div>
                    <h3><b>도서추가</b></h3>
                    <p><br/>도서 나눔을 통해 플랫폼을 활성화시켜주세요!</p>
                </div>
            </div></a>
         </sec:authorize>
         <sec:authorize access="hasRole('ROLE_ADMIN')">
           <a href="/rentlist/rentlist3">
            <div class="box">
                <div class="our-services backups">
                    <div class="icon"> <img src="/resources/homeimg/ADMINBOOK.png"> </div>
                    <h3><b>도서대여관리</b></h3>
                    <p><b>[관리자용]</b><br/>도서 대여 관리 탭입니다.</p>
                </div>
            </div></a>
         </sec:authorize>   
       </sec:authorize>     
           
        </div>  
        
        
              
        <div class="col-md-6">
 <sec:authorize access="isAnonymous()">       
            <a href="/login">
            <div class="box">
                <div class="our-services backups">
                    <div class="icon"> <img src="/resources/homeimg/LOGIN.png"> </div>
                    <h3><b>로그인</b></h3>
                    <p><br/>회원이세요? 로그인 후 도서대여 서비스를 이용해보세요! </p>
                </div>
            </div></a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
  <sec:authorize access="hasRole('ROLE_MEMBER')">
           <a href="/view/${principal.member.id}">
            <div class="box">
                <div class="our-services backups">
                    <div class="icon"> <img src="/resources/homeimg/INFO.png"> </div>
                    <h3><b>회원정보</b></h3>
                    <p><br/>회원정보를 확인하거나 수정할 수 있습니다!</p>
                </div>
            </div></a>
  </sec:authorize>
   <sec:authorize access="hasRole('ROLE_ADMIN')">
           <a href="/list">
            <div class="box">
                <div class="our-services backups">
                    <div class="icon"> <img src="/resources/homeimg/INFO.png"> </div>
                    <h3><b>회원관리</b></h3>
                    <p><b>[관리자용]</b><br/>회원 관리 탭입니다.</p>
                </div>
            </div></a>
  </sec:authorize> 
</sec:authorize>            
        </div>
      
      </div>
       
       
      <div class="row"> 
      
      <div class="col-md-6">
            <a href="/board/list"><div class="box">
                <div class="our-services speedup">
                    <div class="icon"> <img src="/resources/homeimg/BOARD.png"> </div>
                    <h3><b>공지 및 문의</b></h3>
                    <p><br/>공지사항 및 문의게시판을 확인해보세요!</p>
                </div>
            </div></a>
        </div>      
      
        <div class="col-md-6">
           <a href="/book/bookList"><div class="box">
                <div class="our-services database">
                    <div class="icon"> <img src="/resources/homeimg/BOOK.png"> </div>
                    <h3><b>도서목록</b></h3>
                    <p><br/>대여를 원하시는 도서가 있는지 확인해보세요!</p>
                </div>
            </div></a>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>