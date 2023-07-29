<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
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
                      <h2><b>도서 대여 상세 이력</b></h2>
                       
                            <hr>
                           

                                <form class="form-horizontal"   id="contact_form">
                                    <fieldset>
                                        <!-- Form Name -->


                                        <!-- Text input-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                                                    <input name="rnum" class="form-control rent-num"  type="text"
                                                    readonly="readonly"  value="${rent.rnum }">
                                                </div>
                                            </div>
                                        </div>


                                  
                                        <!-- Text input-->
                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                                    <input name="bname"  class="form-control rent-name" type="text"
                                                    readonly="readonly"  value="${rent.bname }">
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Text input-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input name="bwho"  class="form-control" type="text"  readonly="readonly"
                                                     value="${rent.bwho }">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    <input name="bdate"  class="form-control" type="text"
                                                    readonly="readonly" value="${rent.bdate }">
                                                </div>
                                            </div>
                                        </div>
                                        
                                     <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar "></i></span>
                                                    <input name="rdate" class="form-control" type="text"
                                                    readonly="readonly"  value="${rent.rdate }">
                                                </div>
                                            </div>
                                        </div>
                                        
                                     <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-inbox "></i></span>
                                                    <input name="rentinfo" class="form-control" type="text"
                                                    readonly="readonly"  value="${rent.rentinfo }">
                                                </div>
                                            </div>
                                        </div>   

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-primary pull-right"  id="btnUpdate">대여 내역 수정<span class="glyphicon glyphicon-send"></span></button>
												<button type="button" class="btn btn-danger pull-right"  id="btnDelete">대여 내역 삭제<span class="glyphicon glyphicon-send"></span></button>
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>
                    </div> 
	</div>
</div>

</body>






















<%-- <div class="container">  기존꺼
	<h3>도서 대여 이력 상세</h3>
	<div class="form-group">
		<label for="rnum">대여번호:</label> <input type="text" class="form-control  rent-num"
			id="rnum" name="rnum" value="${rent.rnum}" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="bname">도서명:</label> <input type="text" class="form-control  rent-name"
			id="bname" name="bname" value="${rent.bname}" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="bwho">대여인:</label> <input type="text" class="form-control"
			id="bwho" name="bwho" value="${rent.bwho}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="bdate">대여날짜:</label> <input type="text" class="form-control"
			id="bdate" name="bdate" value="${rent.bdate}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="rdate">반납날짜:</label> <input type="text" class="form-control"
			id="rdate" name="rdate" value="${rent.rdate}"
			readonly="readonly">
	</div>
	
<hr>
		<div class="form-group text-right">
			<button type="button" class="btn btn-primary btn-sm" id="btnUpdate">대여 내역 수정</button>
			<button type="button" class="btn btn-danger btn-sm" id="btnDelete">반납</button>
		</div>
		
</div> --%>
<script>
//수정폼으로가기
$("#btnUpdate").click(function(){
	if(!confirm('수정 하시겠습니까?'))
		return false;
	location.href ="/rentlist/rentUpdate/${rent.rnum}";  //RentListController 수정폼으로
})

//삭제
$("#btnDelete").click(function(){
	if(!confirm("삭제 하시겠습니까?"))
		return false;
	$.ajax({
		type:"DELETE",
		url:"/rentlist/rentDelete/${rnum}",	//	RentListController 삭제로
		success:function(resp){
			alert("도서 삭제 완료");
			location.href="/rentlist/rentlist";	// RentListController 전체보기로
		},
		error:function(e){
			alert("도서 삭제 실패 "+e);
			}
		})
	})
</script>