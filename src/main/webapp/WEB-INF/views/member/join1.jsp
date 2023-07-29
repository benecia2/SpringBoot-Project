<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
	<div class="container">
		<h1>JOIN</h1>
	</div>
</div>

<div class="container">
	<form action="/join" method="post">

		<div class="form-group">
			<label for="id">ID:</label> <input type="text" class="form-control"
				id="id" placeholder="Enter UserID" name="id">
		</div>

		<div class="form-group">
			<label for="pw">Password:</label> <input type="password"
				class="form-control" id="pw" placeholder="Enter Password" name="pw">
		</div>

		<div class="form-group">
			<label for="pwd_check">Password_Check:</label> <input type="password"
				class="form-control" id="pwd_check"
				placeholder="Enter Password Check" name="pwd_check">
		</div>

		<div class="form-group">
			<label for="name">Name:</label> <input type="text"
				class="form-control" id="name" placeholder="Enter Name" name="name">
		</div>

		<div class="form-group">
			<label for="email">Email:</label> <input type="email"
				class="form-control" id="email" placeholder="Enter Email"
				name="email">
		</div>

		<div class="form-group">
			<label for="address">Addr:</label> <input type="text"
				class="form-control" id="address" placeholder="Enter Address"
				name="address">
		</div>

		<div class="form-group">
			<label for="tel">Tel:</label> <input type="tel" class="form-control"
				id="tel" placeholder="Enter Tel" name="tel">
		</div>

		<button type="button" class="btn btn-primary" id="btnjoin">회원가입</button>
	</form>
</div>

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
				location.href = "/member/login"
			} else if (resp == "fail") {
				alert("아이디가 중복됩니다.")
				location.href = "/member/join"
			}
		}).fail(function() {
			alert("회원가입실패")
			location.href = "/member/join"
		})

	})
</script>

