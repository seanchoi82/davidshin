<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<title>David Shin </title>
  <script type="text/javascript" src="./resources/js/jquery-1.11.3.min.js"></script>	
	
<style>
	.header{background-color: #171717;position: fixed;height:40px;left:0;top:0;width:100%;border:1px solid black;}	
	.top-right{position:fixed;width:500px;height:35px;left:1000px; /* padding:10px; *//* float:left; */border:1px solid black;}
	
	.login{display:inline; margin:10px; border:1px solid black;}	
	.myItem{display:inline; margin:10px; border:1px solid black;}	
    .account{display:inline; margin:10px; border:1px solid black;}
	.location{display:inline; margin:10px; border:1px solid black;}		
	.mobile{display:inline; margin:10px; border:1px solid black;}		
	.center{margin-top:50px;}
	
	.menuContainer{ 
	padding:0;
	margin:0;
	background:black;
	float:left;
	transition: margin 0.3s ease-in;
	-webkit-transition: margin 0.3s ease-in;
	-moz-transition: margin 0.3s ease-in;
	-o-transition: margin 0.3s ease-in;
 	}
 
	#tab {
	width:20px;
	background-color:gray;
	float:right;
	}
			
	/*마우스 오버에 따른 스타일 지정 */
	#menuContainer:hover #tab{
	background-color:black;
	}
		
	#menuContainer #container a{
	text-decoration : none;
	display			: block;
	padding			: 3px;
	border			: 1px dashed #999;
	border-bottom	: none;
	color:white;
	}

	#menuContainer a:hover{text-decoration:none;}	

</style>


</head>

<body>
	 <nav id="header" class="header" >
		<div class="top-right">
			<div class="login">
				<input type="button" onclick="newDoc()"/>"><span style="color:white">login</span></a>
			</div>
			<div class="myItem">
				<a href="<c:url value="retrieveMyItemInfo.do"/>"><span style="color:white">MyPage</span></a>
			</div>
			<div class="mobile">
				 <a href="<c:url value="mobile.do"/>"><span style="color:white">MobileMain</span></a>
			</div>
			<div class="mobile">
				 <a href="<c:url value="retrievAddItemsForm.do"/>"><span style="color:white">AddItems</span></a>
			</div>
			<div class="location">
				 <a href="<c:url value="location.do"/>"><span style="color:white">Location</span></a>
			</div>
		</div>
	 </nav>
	 
	 <section id="menuContainer" onmouseover="onMouseOver_Container();" onmouseout="onMouseOut_Container();" class="menuContainer">
     	  <span id ="tab"></span> <!-- 사이드 바 탭을 위한 span -->
		  <div id ="container"></div> <!-- 메뉴아이템 컨테이너용 div -->
     </section> 	 
     
	 <article>
	 	 <div id="center" class="center" align="center">
	          <!-- <img src="./resources/image/test.jpg" width="400" height="700"/> -->
	     	
	     	  	  <div class="container">
				  	  <h2>Login</h2>
				  	  <p>Please insert your ID and Password</p>
	
					  <button onclick="newDoc()">linktest</button> 
	    		 </div> 
	 </article>
	 <footer>
	 </footer>

</body>

<script type="text/javascript">
		
// 마우스 이벤트에 따른 margin값 참조 변수
var startX;
var targetX	=0;
//  html요소 참조를 위한 변수 선언
var mContainer;
var container;
var tab;
var START_WIDTH =180; // 메뉴 가로 넓이 

onload=function(){
	// 브라우저 체크 
	var isIE	= ( navigator.userAgent.indexOf("MSIE") > 0 ) ;
	
	// 컨텐이너 참조 구하기  
	mContainer	= document.getElementById("menuContainer");
	container	= document.getElementById("container");
	tab			= document.getElementById("tab");
	
	// 메뉴 리스트 배열 선언
	var menuList=[];
	menuList.push( "ITEM" );
	menuList.push( "ITEM" );
	menuList.push( "ITEM" );
	menuList.push( "ITEM" );
		
	// document에 동적으로 메뉴 구성
	var i;
	var menuItem;
	var tabItem;
	// menuList값에 따라 menuItem동적 생성
	for( i=0; i<menuList.length; i++ ){
		menuItem	= document.createElement( "a" );
		menuItem.setAttribute( "href", "#" );
		if( isIE ){
			menuItem.innerText		= menuList[i];
		} else {
			menuItem.textContent	= menuList[i];
		}
		container.appendChild( menuItem );
	}

	// getBoundingClientRect메서드호를 이용하여 요소의 현재 정보를 얻어올 수 있다. 
	var rect			= container.getBoundingClientRect();
	var tw				= rect.height;
	var gap				= tab.scrollWidth;
	
	// 메뉴 시작 위치 지정 
	startX	= parseInt(-START_WIDTH);      
	mContainer.style.width  	= START_WIDTH+gap+"px";
	mContainer.style.marginLeft	= startX+"px";
	container.style.width 		= START_WIDTH +"px";
	tab.style.height 			= tw+"px";
					
}

// 마우스 이벤트에 따른 margin값 변경
function onMouseOver_Container(){
		mContainer.style.marginLeft= targetX+"px";
}


function onMouseOut_Container(){
	mContainer.style.marginLeft=startX+"px";
}


			
</script>

<script>
function newDoc() {
    window.location.assign("http://www.w3schools.com")
}
</script>

</html>
