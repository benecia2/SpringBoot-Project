<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%-- <sec:authentication property="principal" var="principal" /> --%>
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

 .background-img { 
  background: url("/resources/background/background2.jpg") no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  opacity: 0.9;
  /* margin-top:30px; */
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
</style>
</head>
<body class="background-img">
<div class="container-fluid">
                <div class="row-fluid" >
                   
                      
                     <div class="col-md-offset-4 col-md-4" id="box">
                      <h2><b>도서 대여 정보 입력</b></h2>
                       
                            <hr>
                           

                                <form  action="/rentlist/rentInsert" method="post" class="form-horizontal"  id="contact_form">
                                    <fieldset>
                                        <!-- Form Name -->


                                        <!-- Text input-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                                                    <input name="bnum" class="form-control rent-num" type="text"
                                                    readonly="readonly"  value="${bnum}">
                                                </div>
                                            </div>
                                        </div>


                                  
                                        <!-- Text input-->
                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                                    <input name="bname" class="form-control  rent-name" type="text"
                                                    readonly="readonly"  value="${bname }">
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Text input-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input name="bwho" placeholder="대여인 입력" class="form-control" type="text"
                                                    required="required" readonly="readonly"  value="${principal.member.name}">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    <input name="bdate" placeholder="대여 날짜 입력" class="form-control" type="date"
                                                    required="required" >
                                                </div>
                                            </div>
                                        </div>
                                        
                                     <!-- Text input-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    <input name="rdate" placeholder="반납 날짜 입력" class="form-control" type="date"
                                                    required="required" >
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-warning pull-right">등록<span class="glyphicon glyphicon-send"></span></button>
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>
                    </div> 
	</div>
</div>
</body>












   <%-- <div class="container">  기존코드
  	<h3><b>대여 정보 입력</b></h3>
    <form action="/rentlist/rentInsert" method="post"  >
    
    	<div class="form-group">
    	<label for="bnum">도서 코드:</label>
        <input type="text"  class="form-control  rent-num" name="bnum"  readonly="readonly" value="${bnum}"> 
       </div> 
        <div class="form-group">
            <label for="bname">도서명:</label>
            <input type="text" class="form-control  rent-name" id="bname" name="bname" required="required"  placeholder="도서명을 입력하세요" 
              readonly="readonly"  value="${bname}">
        </div>
        
        <div class="form-group">
            <label for="bwho">성명:</label>
            <input type="text" class="form-control" id="bwho" name="bwho" required="required"  
            placeholder="성명을 입력하세요" value="${principal.member.name}">
        </div>
        
        
        <div class="form-group">
            <label for="bdate">대여 날짜:</label>
            <input type="date" class="form-control" id="bdate" name="bdate" required="required"  placeholder="대여날짜를 입력하세요">
        </div>
        <div class="form-group">
            <label for="rdate">반납 날짜:</label>
            <input type="date" class="form-control" id="rdate" name="rdate" required="required" placeholder="반납날짜를  입력하세요">
        </div>
        <button type="submit" class="btn btn-primary btn-sm  float-right">대여하기</button>
    </form>
 </div> --%>
