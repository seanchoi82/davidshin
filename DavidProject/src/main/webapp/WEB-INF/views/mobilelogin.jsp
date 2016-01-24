<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>ADD ITEMS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,
		  maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>Mobile</title>
	<link rel="stylesheet" href="./resources/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
	<script type="text/javascript" src="./resources/js/jquery-1.11.3.min.js"></script>
	<script src="./resources/js/jquery-1.11.3.min.js"></script>
	<script src="./resources/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
</head>

<body>
<script>
  window.fbAsyncInit = function(){
    FB.init({
      appId      : '1094635937244060',
      xfbml      : true,
      version    : 'v2.5'
    });
    
    FB.getLoginStatus(function(response) {
    	  if (response.status === 'connected') {
    	    console.log('Logged in.');
    	  }
    	  else {
    	    FB.login();
    	  }
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>


<div id="home" data-role="page">
	<div id = "header" data-role="header" data-theme="b" data-position="fixed">
		<h2>ADD ITEMS</h2>
		<a href="#" data-role="button"   data-icon="bars"  >Menu</a>
		<a href="<c:url value="mobile.do"/>" data-role="button"  data-icon="home">Home</a>
	</div>	
	<div id="main" data-role="main" class="ui-content" >
		  <label for="itemName"><h2>Account</h2></label>
		  <input id="keyword" type="text" placeholder="Please Insert Your Account"/>
		  <!-- <input id="itemName" name="itemName" type="text"  placeholder="Please Insert Your Account" data-clear-btn="true"/> -->
		  <label for="itemDesc"><h2>Password</h2></label>
		  <input id="keyword" type="password" placeholder="Please Insert Your Password"/>
		  <!-- <input id="itemDesc" name="itemDesc" type="password"  placeholder="Please Insert Your Password" data-clear-btn="true"/> -->
<!-- 		  <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
		  </fb:login-button>	 -->
	</div>
	<div id="footer" data-role="footer" data-theme="a" data-position="fixed" style="text-align:center;">
		<div data-role="navbar">
			<ul>
		        <li><a href="#" data-role="button" data-theme="b">MENU1</a></li>
		        <li><a href="#" data-role="button" >MENU2</a></li>
		        <li><a href="#" data-role="button" >MENU3</a></li>
		        <li><a href="#" data-role="button" >MENU4</a></li>
	        </ul>
		</div>
	</div>
</div>


<div data-role="page" id="detail" data-dialog="true">
  <div data-role="main" class="ui-content">
  <h3><Strong>Item1</Strong></h3>
    <p>Item1 is good!!!.</p>
  </div>
</div> 

</body>

</html>
