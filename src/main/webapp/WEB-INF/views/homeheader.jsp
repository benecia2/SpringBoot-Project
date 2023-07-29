<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700&display=swap">
<link rel="shortcut icon" href="/resources/homeimg/LOGO.png" type="image/x-icon">
<title>중고도서 나눔 플랫폼</title>
<style>
  .navbar.bg-orange {
    background-color: #ED7D31 !important;
     margin-bottom: 0;
  }
  
   .btn.btn-warning {
    background-color: #5469d4;
    color: #FFFFFF;
    border-color: #5469d4;
    /* 다른 스타일 옵션 추가 가능 */
  } 
  
    /* 네비게이션 바 글꼴 설정 */
    .navbar {
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 700; /* 굵은 글꼴 적용 */
    }
    /* 기타 글꼴 설정 */
    body, h1, h2, h3, h4, h5, h6, p, a {
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 400; /* 일반 글꼴 적용 */
    }
    
  /* 답글줄바꿈 */
  .reply-table td {
    word-wrap: break-word;
     white-space: normal;
  }

  .container .navbar-brand img {
    width: 30px; /* 원하는 가로 크기로 설정 */
    height: 30px; /* 원하는 세로 크기로 설정 */
  }

</style>





<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-0 bg-orange" >

		<div class="container">
			<!-- Brand/logo -->
			<a class="navbar-brand" href="/"><img src="/resources/homeimg/LOGO.png"></a>
			<a class="navbar-brand" href="/"><b>중고도서 나눔 플랫폼</b></a>
			<!-- Links -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/board/list"><b></b></a></li>
			</ul>
			
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/board/list"><b></b></a></li>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
				<a class="nav-link" href="/logout">
				(<sec:authentication property="principal.member.name"/>)님 로그아웃</a></li>
			</sec:authorize>
			
			</ul>
			
				
		</div>
	</nav>