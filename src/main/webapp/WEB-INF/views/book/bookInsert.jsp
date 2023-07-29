<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
   
 <head>
<style>

 .background-img { 
  background: url("/resources/background/background2.jpg") no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  opacity: 0.9;
  /* margin-top:30px; */
	}  

	  body
      {
      	background-color:  #dedede;
      }

      .input-group-addon
      {
      	background-color: #ffde6c;
      	color: #d17d00;
      }
       
      textarea.break-all-text{
      	word-break: break-all;
  		overflow-wrap: break-word;
		}
      
      .container-fluid {
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 700; /* 굵은 글꼴 적용 */
    }
     .well.center-block {
        width: 550px; /* 원하는 폭을 설정하세요 */
    }

    .form-group {
        margin-top: 10px;  /* 위쪽 간격 폭 조절 */
        margin-bottom: 15px; /* 아래쪽 간격 폭 조절 */
    }

    /* 버튼과 입력칸 사이의 간격 폭 조절 */
    .widget {
        margin-top: 20px;
    }  


	.well
      {
          padding: 35px;
         padding-left: 30px; 
         box-shadow: 0 0 10px #666666;
          margin: 4% auto 0; 
         width: 450px;
      }

      body
      {
      	background-color:  #dedede;
      }

      .input-group-addon
      {
      	background-color: #ffde6c;
      	color: #d17d00;
      } 
      
      h2{
    text-align:center;
    color:white;
	}
</style>

<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body class="background-img">
<div class="container-fluid">
                <div class="row-fluid" >
                   
                      
                     <div class="col-md-offset-4 col-md-4" id="box">
                      <h2 style="font-weight: bold; color: white; ">도서 등록</h2>
                       
                            <hr>
                           

                                <form  action="bookInsert"  method="post" class="form-horizontal"   id="contact_form" enctype="multipart/form-data">
                                    <fieldset>
                                        <!-- Form Name -->
<input type="hidden" id="id" name="id" value="${principal.member.id}">

                                        <!-- 도서명-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                                    <input name="bname" class="form-control rent-num"  type="text"  placeholder="도서명"  required="required" >
                                                </div>
                                            </div>
                                        </div>


                                  
                                        <!-- 저자-->
                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input name="writer"  class="form-control rent-name" type="text" placeholder="저자"   required="required">
                                                </div>
                                            </div>
                                        </div>


                                        <!-- 출판사-->

                                        <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                                    <input name="publicsher"  class="form-control" type="text"  placeholder="출판사"  required="required" >
                                                </div>
                                            </div>
                                        </div>

                                        <!-- 파일-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-save-file"></i></span>
                                                    <input name="upload"  class="form-control" type="file" placeholder="책 이미지"  required="required">
                                                </div>
                                            </div>
                                        </div>
                                        
                                     <!-- 줄거리-->

               						 <div class="form-group">

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                                    <textarea name="content" class="form-control"  placeholder="줄거리"  rows="15"   required="required"  maxlength="200"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">

                                            <div class="col-md-12">
												<button type="submit" class="btn btn-warning btn-block" >등록<span class="glyphicon glyphicon-send"></span></button>
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>
                    </div> 
	</div>
</div>











<!-- <form action="bookInsert"  method="post"  enctype="multipart/form-data" > 부트스트랩
	<div class="container-fluid background-img">
		<div class="row">
			<div class="well center-block">
				<div class="well-header">
					<h1  style="font-weight:bold;" class="text-center text-success"> 도서 등록 </h1>
					<hr>
				</div>

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-book"></i>
								</div>
								<input type="text" placeholder="도서명"   name="bname" class="form-control">
								
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</div>
								<input type="text" placeholder="저자" name="writer" class="form-control">
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-book"></i>
								</div>
								<input type="text"  placeholder="출판사" name="publicsher" class="form-control">
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-save-file"></i>
								</div>
								<input type="file" class="form-control" name="upload" placeholder="책 이미지">
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-pencil"></i>
								</div>
								<textarea  class="form-control  break-all-text"  name="content" placeholder="줄거리"  rows="15"></textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="row widget">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<button  type="submit"  class="btn btn-warning btn-block">등록</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</form> -->
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
  <!-- <div class="container">
  <form action="bookInsert" method="post"  enctype="multipart/form-data">
  
    <div class="form-group">
      <label for="bname">도서명:</label>
      <input type="text" class="form-control" id="bname" name="bname">
    </div>
    
    <div class="form-group">
      <label for="writer">저자:</label>
      <input type="text" class="form-control" id="writer" 
      name="writer" >
    </div>
    
    <div class="form-group">
      <label for="publicsher">출판사:</label>
      <input type="text" class="form-control" id="publicsher" 
      name="publicsher" >
    </div>
    
    
      <div class="form-group">
      <label for="upload">이미지:</label>
     <input type="file"  class="form-control" id="upload" name="upload">
    </div>
    
    
      <div class="form-group">
      <label for="content">줄거리:</label>
     <textarea class="form-control" rows="5" id="content" name="content"></textarea>
    </div>
    
    <div class="form-group text-right">
      <button type="submit" class="btn btn-primary btn-sm">추가</button>
     </div>
     
  </form>
</div>  -->
