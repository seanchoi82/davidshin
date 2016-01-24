<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>MY PRODUCT</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,
		  maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>Mobile</title>
	<link rel="stylesheet" href="./resources/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
	<script type="text/javascript" src="./resources/js/jquery-1.11.3.min.js"></script>
	<script src="./resources/js/jquery-1.11.3.min.js"></script>
	<script src="./resources/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
</head>

<script>
function search(){
		alert("searching");
	 	var keyword = document.getElementById('keyword').value;
	    
	    var sendInfo = {
	 		keyword : keyword,
	     }; 

	    
	 	$.ajax({
			type : "GET"
			, url : "retrieveItemInfo.do"
			, dataType : "json"
			, data : sendInfo
		});
}
</script>

<body>
<div id="home" data-role="page">
	<div id = "header" data-role="header" data-theme="b" data-position="fixed">
		<h2>PRODUCT</h2>
		<a href="<c:url value="main.do"/>" data-role="button"  data-icon="home">Home</a>
		<a href="<c:url value="retrievAddItemsForm.do"/>" data-icon="bars">Add Items</a>
	</div>
	
	<div id="main" data-role="main" class="ui-content" >
		<div>
			<input id="keyword" type="text" placeholder="검색할 상품명을 입력해주세요."/>
			<button data-icon="search" onclick="search()">Search</button>
		</div>		
		<ul data-role="listview" data-inset="false" data-filter="true">
		   <li data-role="list-divider">Category1</li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item1" class="ui-li-icon">item1</a><a href="#detail" data-transition="pop" data-icon="gear">Download Browser</a></li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item2" class="ui-li-icon">item2</a></li>
		   <li data-role="list-divider">Category2</li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item3" class="ui-li-icon">item3</a></li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item4" class="ui-li-icon">item4</a></li>
		   <li data-role="list-divider">Category2</li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item3" class="ui-li-icon">item3</a></li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item4" class="ui-li-icon">item4</a></li>
		   <li data-role="list-divider">Category2</li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item3" class="ui-li-icon">item3</a></li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item4" class="ui-li-icon">item4</a></li>
		   <li data-role="list-divider">Category2</li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item3" class="ui-li-icon">item3</a></li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item4" class="ui-li-icon">item4</a></li>
		   <li data-role="list-divider">Category2</li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item3" class="ui-li-icon">item3</a></li>
		   <li><a href="#"><img src="./resources/image/chrome.png" alt="item4" class="ui-li-icon">item4</a></li>
		</ul>
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
