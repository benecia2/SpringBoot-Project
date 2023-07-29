<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!---- Include the above in your HEAD tag -------->
<style>
	.rent-num{
	font-size: 20px;
	color: orange;
	font-weight: bold;
	}
	
	.rent-name{
	font-size: 20px;
	font-weight: bold;	
	}
	
	body{
    background-image: linear-gradient(#79a06d, #79a06d); 
	}

	#box{
    border: 1px solid rgb(200, 200, 200);
    box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 5px 2px;
    background: rgba(200, 200, 200, 0.1);
    border-radius: 4px;
    top:50px;
	}

h2{
    text-align:center;
    color:#fff;
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
</style>
</head>
<body class="background-img">
<div class="container-fluid">
                <div class="row-fluid" >
                   
                      
                     <div class="col-md-offset-4 col-md-4" id="box">
                      <h2 style="font-weight:bold;">도서 대여 이력 수정</h2>
                       
                            <hr>
                           

                                <form class="form-horizontal"   id="contact_form">
                                    <fieldset>
                                        <!-- Form Name -->

											
                                        <!-- Text input-->

<input type="hidden" name="bnum" id="bnum" value="${rent.bnum }">

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                                                    <input name="rnum" class="form-control rent-num"  type="text"  id="rnum"
                                                    readonly="readonly"  value="${rent.rnum }">
                                                </div>
                                            </div>
                                        </div>


                                  
                                        <!-- Text input-->
                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                                    <input name="bname"  class="form-control rent-name" type="text"  id="bname"
                                                    readonly="readonly"  value="${rent.bname }">
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Text input-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input name="bwho"  class="form-control" type="text"  required="required"  placeholder="대여인 입력"  id="bwho"
                                                     value="${rent.bwho }">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    <input name="bdate"  class="form-control" type="date" required="required"  id="bdate"
                                                  placeholder="대여 날짜 입력"  value="${rent.bdate }">
                                                </div>
                                            </div>
                                        </div>
                                        
                                     <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar "></i></span>
                                                    <input name="rdate" class="form-control" type="date"  placeholder="반납 날짜 입력"  required="required"  id="rdate"
                                                      value="${rent.rdate }">
                                                </div>
                                            </div>
                                        </div>

									<!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-inbox "></i></span>
                                                    <select name="rentinfo" id="rentinfo" class="form-control">
                                                    	<option value="대여승인중">대여승인중</option>
                                                    	<option value="대여승인">대여승인</option>
                                                    	<option value="대여거부">대여거부</option>
                                                    	<option value="반납">반납</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>   

                                        <div class="form-group">

                                            <div class="col-md-12">
												<button type="button" class="btn btn-warning pull-right"  id="btnRentModify">수정완료<span class="glyphicon glyphicon-send"></span></button>
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>
                    </div> 
	</div>
</div>
</body>






 <%-- <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>도서 대여 이력 수정</h1>      
  </div>
</div>
<div class="container">

	<div class="form-group">
		<label for="rnum">대여번호:</label> 
		<input type="text"
			class="form-control rent-num" id="rnum"  name="rnum" 
			value="${rent.rnum}" readonly="readonly" >
	</div>
	
	<div class="form-group">
		<label for="bname">도서명:</label> 
		<input type="text"
			class="form-control rent-name" id="bname"  name="bname" 
			value="${rent.bname}" readonly="readonly" >
	</div>
	
	<div class="form-group">
		<label for="bwho">대여인:</label> 
		<input type="text"
			class="form-control" id="bwho" placeholder="성명을 입력하세요" name="bwho" 
			value="${rent.bwho }" required="required" >
	</div>
	
	<div class="form-group">
		<label for="bdate">대여날짜:</label> 
		<input type="date" class="form-control" id="bdate"
			placeholder="대여 날짜를 입력하세요"  required="required" 
			value="${rent.bdate }" name="bdate">
	</div>
	
	<div class="form-group">
		<label for="rdate">반납날짜:</label> 
		<input type="date"
			class="form-control" id="rdate" placeholder="반납 날짜를 입력하세요" 
			name="rdate" required="required"  value="${rent.rdate }">
	</div>
	<div class="form-group text-right">
	<button type ="button" class = "btn btn-primary  btn-sm"   id="btnRentModify">수정완료</button>
	</div>
</div> --%>
<script>
 $("#btnRentModify").click(function(){
	 
	 if($("#bwho").val()==""){
		 alert("대여할 사람을 입력하세요.");
		 $("#bwho").focus();
		 return false;
	 }
	 
	 if($("#bdate").val()==""){
		 alert("대여 날짜를 입력하세요.");
		 $("#bdate").focus();
		 return false;
	 }
	 
	 if($("#rdate").val()==""){
		 alert("반납 날짜를 입력하세요.");
		 $("#rdate").focus();
		 return false;
	 }
	 
	 data = {
			"bnum" : $("#bnum").val(),
			"rnum" : $("#rnum").val(),
			"bname" : $("#bname").val(),
			"bwho" : $("#bwho").val(),
			"bdate" : $("#bdate").val(),
			"rdate" : $("#rdate").val(),
			"rentinfo" : $("#rentinfo").val()
	 }
	 
	 $.ajax({
		 type:"PUT",
		 url:"/rentlist/rentUpdate",			// RentListController 수정으로
		 contentType:"application/json;charset=utf-8",
		 data:JSON.stringify(data),
		 success:function(resp){
			 alert("도서대여 이력 수정 완료");
			 location.href="/rentlist/rentlist3";		// RentListController 전체보기로
		 },
		 error:function(e){
			 alert("도서대여 이력 수정 실패"+e);
		 }
	 })
 })
</script>		
