<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <meta charset="utf-8">
  <title>Sign Up</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style2.css">
</head>

<body>
  <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="/" rel="dofollow">중고도서 나눔 플랫폼</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"><b>Sign Up</b></span>
              <form action="/join" method="post">
              
                <div class="field padding-bottom--24">
                  <label for="id">ID</label>
                  <input type="text" id="id" placeholder="Enter ID" name="id">
                </div>
                
                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">Password</label>
                  </div>
                  <input type="password" name="pw" id="pw" placeholder="Enter Password">
                </div>
                
                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pwd_check">Password_check</label>
                  </div>
                  <input type="password" name="pwd_check" id="pwd_check" placeholder="Enter Password Check">
                </div>
                
                <div class="field padding-bottom--24">
                  <label for="name">Name</label>
                  <input type="text" id="name" placeholder="Enter Name" name="name">
                </div>
                
                <div class="field padding-bottom--24">
                  <label for="email">Email</label>
                  <input type="email" id="email" placeholder="Enter Email" name="email">
                </div>
                
                <div class="field padding-bottom--24">
                  <label for="address">Address</label>
                  <input type="text" id="address" placeholder="Enter Address" name="address">
                </div>
                
                <div class="field padding-bottom--24">
                  <label for="tel">Tel</label>
                  <input type="text" id="tel" placeholder="Enter Tel" name="tel">
                </div>
                
                <div class="field padding-bottom--24">
                  <button type="button" class="btn btn-primary" id="btnjoin">회원가입</button>
                </div>
              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">
            <span>계정이 있으신가요? <a href="/login">로그인</a></span>
            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span><a href="/">Home으로</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	$("#btnjoin").click(function() {
		if ($("#id").val() == "") {
			alert("아이디를 입력하세요.")
			$("#id").focus();
			return false;
		}
		if ($("#pw").val() == "") {
			alert("비밀번호를 입력하세요.")
			$("#pw").focus();
			return false;
		}
		if ($("#pw").val() !== $("#pwd_check").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd_check").focus();
			return false;
		}
		var email = $("#email").val();
		if (email == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if (!email.includes("@")) {
		  alert("유효한 이메일 주소를 입력해주세요.");
		  $("#email").focus();
		  return false;
		}
		if ($("#address").val() == "") {
			alert("주소를 입력하세요.")
			$("#address").focus();
			return false;
		}
		if ($("#tel").val() == "") {
			alert("전화번호를 입력하세요.")
			$("#tel").focus();
			return false;
		}

		let dataParam = {
			id : $("#id").val(),
			pw : $("#pw").val(),
			name : $("#name").val(),
			email : $("#email").val(),
			address : $("#address").val(),
			tel : $("#tel").val()
		}
		$.ajax({
			type : "post",
			url : "/join",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(dataParam)
		}).done(function(resp) {
			if (resp == "success") {
				alert("회원가입성공")
				location.href = "/login"
			} else if (resp == "fail") {
				alert("아이디가 중복됩니다.")
				location.href = "/join"
			}
		}).fail(function() {
			alert("회원가입실패")
			location.href = "/join"
		})

	})
</script>
