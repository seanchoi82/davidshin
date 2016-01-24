<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <script type="text/javascript" src="./resources/js/jquery-1.11.3.min.js"></script>	  
  <style>
  </style>
</head>

<body>

  	  <div class="container">
  	  <h2>Login</h2>
  	  <p>Please insert your ID and Password</p>
	  	  <form role="form"  method="POST" action="loginProcess.do">
			  <div class="form-group"> 
				  <label for="userid">ID : </label> 
				  <input type="text" class="form-control" id="userid" name = "userid">
			  </div>
			  <div class="form-group">
				  <label for="pwd">Password :</label>
				  <input type="password" class="form-control" id="pwd" name = "pwd">
			  </div>	
			  	  <button type="submit" class="btn btn-default">Submit</button>
			  	  <!-- <a href="#" class="btn btn-default" role="button">Subscription</a> -->
			  	  <a href="<c:url value="createAccountInfoPage.do"/>" class="btn btn-default" role="button">Subscription</a>	 	  	  
		  </form>
	  </div>

	  
</body>



<script>
function login(){

	 var userid = document.getElementById('userid').value;
	 var pwd = document.getElementById('pwd').value;	    
	    
     var sendInfo = {userid: userid, pwd: pwd}; 
	
	$.ajax({
		type : "GET"
		, dataType : "json"
		, data : sendInfo
		, url : "loginProcess.do"
		, success : function(data){
			var userInfoList=data;  
			alert("login success!");
			history.back();
		}
		, error:function(request, status, error){
			alert("실패:" + request.status + "\n" + "error" + error);
		}
	});
}
</script>

</html>

