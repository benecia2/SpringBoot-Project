<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="jumbotron jumbotron-fluid" style="background-color: #FFF1E8;">
  <div class="container">
    <h1>회원 정보 수정</h1>      
  </div>
</div>

<div class="container">
		
			<div class="form-group">
				<label for="id">ID:</label> 
				<input type="text"
					class="form-control" id="id" placeholder="Enter UserID" name="id" 
					value="${member.id}" readonly="readonly">
			</div>
			
			<div class="form-group">
				<label for="pw">Password:</label> 
				<input type="password"
					class="form-control" id="pw" placeholder="Enter Password" name="pw">
			</div>
			
			<div class="form-group">
				<label for="pwd_check">Password_Check:</label> 
				<input type="password" class="form-control" id="pwd_check"
					placeholder="Enter Password Check" name="pwd_check">
			</div>
			
			<div class="form-group">
				<label for="name">Name:</label> 
				<input type="text"
					class="form-control" id="name" placeholder="Enter Name" name="name"
					value="${member.name }">
			</div>
			
			<div class="form-group">
				<label for="email">Email:</label> 
				<input type="email"
					class="form-control" id="email" placeholder="Enter Email" name="email"
					value="${member.email }">
			</div>
			
			<div class="form-group">
				<label for="address">Addr:</label> 
				<input type="text"
					class="form-control" id="address" placeholder="Enter Address" name="address"
					value="${member.address}">
			</div>
			
			<div class="form-group">
				<label for="tel">Tel:</label> 
				<input type="tel"
					class="form-control" id="tel" placeholder="Enter Tel" name="tel"
					value="${member.tel}">
			</div>
	<button type ="button" class = "btn btn-primary" id=btnModify>수정완료</button>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>

<script>
$('#btnModify').click(function(){
	if($("#pw").val()=="") {
		alert("비밀번호를 입력하세요.")
		$("#pw").focus();
		return false;
	}
	if ($("#pw").val() !== $("#pwd_check").val()) {
	    alert("비밀번호가 일치하지 않습니다.");
	    $("#pwd_check").focus();
	    return false;
	}
	
	data = {
			"id":$("#id").val(),
			"pw":$("#pw").val(),
			"name":$("#name").val(),
			"email":$("#email").val(),
			"address":$("#address").val(),
			"tel":$("#tel").val()
	}
	$.ajax({
		type:'put',
		url :"/update",
		contentType:"application/json;charset=utf-8",
		data: JSON.stringify(data),
		success:function(resp){
			alert("회원정보 수정 완료");
			location.href="/view/${member.id}"
		},
		error:function(e){
			alert("회원정보 수정 실패: "+e)
		}
	})
})
</script>		
