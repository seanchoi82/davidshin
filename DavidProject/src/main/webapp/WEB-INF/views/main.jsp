<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <title>David Shin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="./resources/js/jquery-1.11.3.min.js"></script>	
  
  <style>
	.container {padding: 80px 120px;}
  
	.carousel-inner img {-webkit-filter: grayscale(90%);filter: grayscale(90%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */margin: auto;}
	
	.carousel-caption h3 {color: #fff !important;}
	
    @media (max-width: 600px) {
    .carousel-caption {
        display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
     }
	}
	
	/* Remove border and add padding to thumbnails */
	.thumbnail {padding: 0 0 15px 0;border: none;border-radius: 0;}	
	.thumbnail p {margin-top: 15px;color: #555;}
	
	/* Black buttons with extra padding and without rounded borders */
	.btn {padding: 10px 20px;background-color: #333;color: #f1f1f1;border-radius: 0;transition: .2s;}
	
	/* On hover, the color of .btn will transition to white with black text */
	.btn:hover, .btn:focus {border: 1px solid #333;background-color: #fff;color: #000;}
	
	.bg-1 {background: #2d2d30;color: #bdbdbd;}
    .bg-1 h3 {color: #fff;}
    .bg-1 p {font-style: italic;}
       
    /* Add a dark background color with a little bit see-through */ 
	.navbar {margin-bottom: 0;background-color: #2d2d30;border: 0;font:italic bold 12px/30px Georgia, serif;letter-spacing: 4px;opacity:0.9;}
	
	/* Add a gray color to all navbar links */
	.navbar li a, .navbar .navbar-brand {color: #d5d5d5 !important}
	
	/* On hover, the links will turn white */
	.navbar-nav li a:hover {color: #fff !important;}	
	/* The active link */
	.navbar-nav li.active a {color: #fff !important;background-color:#29292c !important}	
	/* Remove border color from the collapsible button */
	.navbar-default .navbar-toggle {border-color: transparent;}	
	/* Dropdown */
	.open .dropdown-toggle {color: #fff ;background-color: #555 !important;}	
	/* Dropdown links */
	.dropdown-menu li a {color: #000 !important;}	
	/* On hover, the dropdown links will turn red */
	.dropdown-menu li a:hover {background-color: red !important;}
	
	/* Add a dark background color to the footer */
	footer {background-color: #2d2d30;color: #f5f5f5;padding: 32px;}	
	footer a {color: #f5f5f5;}	
	footer a:hover {color: #777;text-decoration: none;}

</style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
	<nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span> 
	      </button>
	      <a class="navbar-brand" href="#">David Shin</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">  
	      <ul class="nav navbar-nav navbar-right"> 
	        <c:choose>
				<c:when test="${not empty sessionScope.userLoginInfo}">
				    <%-- <h2>success </h2>
       				 ${sessionScope.userLoginInfo.rslt}  --%>
					<li><a href="<c:url value="logout.do"/>">LogOut</a></li>	
				</c:when>
				<c:otherwise>
					<li><a href="<c:url value="login.do"/>">logIn</a></li>	
				</c:otherwise>
			</c:choose>
	        <li><a href="#band">MyPage</a></li>
	        <li><a href="#contact">Contact</a></li>
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">More
	            <span class="caret"></span>
	          </a>
	          <ul class="dropdown-menu">
	            <li><a href="#">Recruiment</a></li>
	            <li><a href="#">Notice</a></li>
	            <li><a href="#">About Us</a></li> 
	          </ul>
	        </li>
	        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
	      </ul>
	    </div>
	  </div>
	</nav>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	   <!--  Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item ">
	        <img src="./resources/image/guess1.jpg" alt="New York" width="1000" height="700">
	        <div class="carousel-caption">
	          <h3>Title</h3>
	          <p>Content</p>
	        </div>      
	      </div>
	
	      <div class="item ">
	        <img src="./resources/image/guess2.jpg" alt="Chicago" width="1000" height="700">
	        <div class="carousel-caption">
	          <h3>Title</h3>
	          <p>Content</p>
	        </div>      
	      </div>
	    
	      <div class="item active">
	        <img src="./resources/image/guess3.jpg" alt="Los Angeles" width="1000" height="700">
	        <div class="carousel-caption">
	          <h3>Title</h3>
	          <p>Content</p>
	        </div>      
	      </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>


	<div class="container text-center">
	 <h3>David Shin</h3>
	 <p><em>Be Strong!</em></p>
	 <p>Wake up your inspiration..</p>
	 <br>
	  <div class="row">
	    <div class="col-sm-4">
	      <p><strong>Category1</strong></p><br>
	      <img src="./resources/image/guess4.jpg"  class="img-circle person" alt="Random Name">
	    </div>
	    <div class="col-sm-4">
	      <p><strong>Category2</strong></p><br>
	      <img src="./resources/image/guess4.jpg"  class="img-circle person" alt="Random Name">
	    </div>
	    <div class="col-sm-4">
	      <p><strong>Category3</strong></p><br>
	      <img src="./resources/image/guess4.jpg"  class="img-circle person" alt="Random Name">
	    </div>
	  </div>
	</div>
	
	<div class="bg-1">
	  <div class="container">
		  <div class="row text-center">
			  <div class="col-sm-4">
			    <div class="thumbnail">
			      <img src="./resources/image/item1.jpg" alt="Paris">
			      <p><strong>item1</strong></p>
			      <p>Fri. 27 November 2015</p>
			      <button class="btn" data-toggle="modal" data-target="#myModal">Buy it</button>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="thumbnail">
			      <img src="./resources/image/item1.jpg" alt="New York">
			      <p><strong>item2</strong></p>
			      <p>Sat. 28 November 2015</p>
			      <button class="btn" data-toggle="modal" data-target="#myModal">Buy it</button>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="thumbnail">
			      <img src="./resources/image/item1.jpg" alt="San Francisco">
			      <p><strong>item3</strong></p>
			      <p>Sun. 29 November 2015</p>
			      <button class="btn" data-toggle="modal" data-target="#myModal">Buy it</button>
			    </div>
			  </div>
			</div>
			<br><br>
			<div class="row text-center">
			  <div class="col-sm-4">
			    <div class="thumbnail">
			      <img src="./resources/image/item1.jpg" alt="Paris">
			      <p><strong>item1</strong></p>
			      <p>Fri. 27 November 2015</p>
			      <button class="btn" data-toggle="modal" data-target="#myModal">Buy it</button>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="thumbnail">
			      <img src="./resources/image/item1.jpg" alt="New York">
			      <p><strong>item2</strong></p>
			      <p>Sat. 28 November 2015</p>
			      <button class="btn" data-toggle="modal" data-target="#myModal">Buy it</button>
			    </div>
			  </div>
			  <div class="col-sm-4">
			    <div class="thumbnail">
			      <img src="./resources/image/item1.jpg" alt="San Francisco">
			      <p><strong>item3</strong></p>
			      <p>Sun. 29 November 2015</p>
			      <button class="btn" data-toggle="modal" data-target="#myModal">Buy it</button>
			    </div>
			  </div>
			</div>
	  </div>
	</div>
	
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-lock"></span>Purchase</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span> $100 per item</label>
              <input type="number" class="form-control" id="psw" placeholder="How many?">
            </div>
            <!-- <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Send To</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div> -->
              <button type="submit" class="btn btn-block">Pay 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <p>Need <a href="#">help?</a></p>
        </div>
      </div>
    </div>
  </div>
  
  
  <div class="container-fluid bg-grey">
  <h3 class="text-center">CONTACT</h3>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Seoul, Ko</p>
      <p><span class="glyphicon glyphicon-phone"></span> +82 1022205040</p>
      <p><span class="glyphicon glyphicon-envelope"></span> hkluv1009@gmail.com</p> 
    </div>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div>
  </div>
</div>
	
</body>

<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>David Shin Made By <a href="http://www.davidshin.com" data-toggle="tooltip" title="Visit DavidShin">www.davidshin.com</a></p> 
</footer>


</html>

