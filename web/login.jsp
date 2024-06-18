




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FCINEMA</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" >
	<link href="css/font-awesome.min.css" rel="stylesheet" >
	<link href="css/global.css" rel="stylesheet">
	<link href="css/about.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noticia+Text:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<section id="header">
<nav class="navbar navbar-expand-md navbar-light p-0 bg-black" id="navbar_sticky">
  <div class="container-xl">
    <a class="p-0 navbar-brand fw-bold text-white" href="index.html"> <span class="bg_brow p-1 px-2">C</span> ineFlix</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	   <ul class="navbar-nav mb-0 ms-auto">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="index.html">Home</a>
        </li>
		 
		<li class="nav-item">
          <a class="nav-link" href="about.html">About </a>
        </li>
		
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Blog
          </a>
          <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="blog.html"> Blog</a></li>
            <li><a class="dropdown-item border-0" href="blog_detail.html"> Blog Detail</a></li>
          </ul>
        </li>
		
		<li class="nav-item">
          <a class="nav-link" href="services.html">Services </a>
        </li>
		
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Team
          </a>
          <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="team.html"> Team</a></li>
            <li><a class="dropdown-item border-0" href="detail.html"> Team Detail</a></li>
          </ul>
        </li>
		
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Pages
          </a>
          <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="gallery.html"> Gallery</a></li>
            <li><a class="dropdown-item border-0" href="login.html"> Login</a></li>
          </ul>
        </li>
		
		<li class="nav-item">
          <a class="nav-link" href="contact.html">Contact </a>
        </li>

		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle dropdown_search nav_hide" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-search"></i>
          </a>
          <ul class="dropdown-menu drop_2 drop_1 p-3 bg_blue" aria-labelledby="navbarDropdown">
            <li>
			  <div class="input-group">
				<input type="text" class="form-control rounded-0 font_14 border_1" placeholder="SEARCH HERE">
				<span class="input-group-btn">
					<button class="btn btn-primary bg_brow rounded-0 p-3 px-4 border-0 font_14" type="button">
						SEARCH </button>
				</span>
		</div>
			</li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</section>

<section id="center" class="center_o">
 <div class="center_m bg_back p_3">
   <div class="container-xl">
     <div class="row center_o1 text-center">
	  <div class="col-md-12">
	   <h1 class="font_60 text-white lh-1">Login / Register</h1>
	   <h6 class="mb-0 mt-3 col_brow"><a class="text-light" href="#"> Home</a> <span><i class="fa fa-chevron-right text-white-50 mx-2 align-middle font_14"></i></span> Login / Register</h6>
	 </div>
	 </div>
  </div>
 </div>
</section>

<section id="login" class="p_3">
<div class="container-xl">
 <div class="row login_1">
    <div class="col-md-4">
	 <div class="login_1l">
	   <h5 class="bg_light p-3 rounded-3 fs-6 mb-3 center_sm">Login Now</h5>
	   <input class="form-control rounded-3" placeholder="Username" type="text">
	   <input class="form-control rounded-3 mt-3" placeholder="Password" type="password">
	   <div class="login_1li row mt-3">
	    <div class="col-md-6 col-6">
		 <div class="login_1lil">
		   <div class="form-check mb-0">
        <input type="checkbox" class="form-check-input" id="customCheck1">
        <label class="form-check-label" for="customCheck1">keep me logged in</label>
    </div>
		 </div>
		</div>
		<div class="col-md-6 col-6">
		 <div class="login_1lir text-end">
		  <h6 class="mb-0"><a class="col_brow1" href="#">Password?</a></h6>
		 </div>
		</div>
	   </div>
	   <h6 class="mb-0 mt-4 center_sm"><a class="button_1" href="#">Login </a></h6>
	 </div>
	</div>
	<div class="col-md-8">
	 <div class="login_1r">
	  <h3 class="center_sm">Register Now</h3>
	  <hr>
	  <div class="login_1ri row">
	   <div class="col-md-6">
	    <div class="login_1ril">
		 <input class="form-control rounded-3" placeholder="First Name *" type="text">
		 <input class="form-control rounded-3 mt-3" placeholder="Last Name *" type="text">
		 <input class="form-control rounded-3 mt-3" placeholder="Email *" type="text">
		 <input class="form-control rounded-3 mt-3" placeholder="Password" type="password">
		 <div class="form-check mt-3">
        <input type="checkbox" class="form-check-input" id="customCheck1">
        <label class="form-check-label" for="customCheck1">By registering, you accept our <a class="col_brow1" href="#">Terms &amp; Conditions</a></label>
    </div>
	<h6 class="mb-0 mt-4 center_sm"><a class="button_1" href="#">Register </a></h6>
		</div>
	   </div>
	   <div class="col-md-6">
	    
	   </div>
	  </div>
	 </div>
	</div>
 </div>
</div>
</section>

<section id="footer">
 <div class="footer_m bg_backo p_3">
   <div class="container-xl">
    <div class="footer_1 row">
	   <div class="col-md-3">
	     <div class="footer_1i">
		   <h3><a class="text-white" href="index.html"> <span class="bg_brow p-1 px-2">C</span> ineFlix</a></h3>
		   <p class="text-light mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis sem at nibh elementum imperdiet.Duis sagittis ipsum.Praesent mauris.</p>
		   <ul class="social-network social-circle mb-0 mt-4">
					<li><a href="#" class="icoRss" title="Rss"><i class="fa fa-skype"></i></a></li>
					<li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-pinterest"></i></a></li>
					<li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
				</ul>
		 </div>
	   </div>
	   <div class="col-md-3">
	     <div class="footer_1i">
		   <h5 class="col_light mb-4">Explore</h5>
		   <div class="row footer_1ism">
	 <h6 class="fw-normal col-md-12 col-6 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i>  About</a></h6>
	 <h6 class="fw-normal mt-2 col-md-12 col-6 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i> Service</a></h6>
	 <h6 class="fw-normal mt-2 col-md-12 col-6 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i> Our  Team</a></h6>
	 <h6 class="fw-normal mt-2 col-md-12 col-6 mb-0 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i> Project</a></h6>
	 </div>
		 </div>
	   </div>
	   <div class="col-md-3">
	     <div class="footer_1i">
		   <h5 class="col_light mb-4">Our Services</h5>
		   <div class="row footer_1ism">
	 <h6 class="fw-normal col-md-12 col-6 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i>  Privacy Policy</a></h6>
	 <h6 class="fw-normal mt-2 col-md-12 col-6 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i> Terms & Conditions</a></h6>
	 <h6 class="fw-normal mt-2 col-md-12 col-6 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i> Support</a></h6>
	 <h6 class="fw-normal mt-2 col-md-12 col-6 mb-0 font_14"><a class="text-light" href="#"><i class="fa fa-caret-right col_brow me-1 font_12 align-middle"></i> Disclaimer</a></h6>
	 </div>
		 </div>
	   </div>
	   <div class="col-md-3">
	     <div class="footer_1i">
		   <h5 class="col_light mb-4">Connect Us</h5>
		   <h6 class="font_14 text-light">2076 N Semper St, Porta VA 23201, USA cl</h6>
		   <h6 class="font_14"><a class="text-light" href="#">info@gmail.com</a></h6>
	 <h6 class="mt-3 font_14"><a class="text-light" href="#">+123 4567 890</a></h6>
	 <h6 class="mt-3 text-light font_14"><span class="text-white">Mon-Thu:</span> 9:30 am - 6:00 pm</h6>
	 <h6 class="mt-3 text-light font_14"><span class="text-white">Fri:</span>  9:30 am - 5:00 pm</h6>
	 <h6 class="mt-3 text-light mb-0 font_14"><span class="text-white">Sat:</span>  10:00 am - 3:00 pm</h6>
		 </div>
	   </div>
	</div>
	<div class="footer_2 row mt-4 text-center pt-4">
	  <div class="col-md-12">
	    <p class="mb-0 text-light">© 2013 Your Website Name. All Rights Reserved | Design by <a class="col_brow fw-bold" href="http://www.templateonweb.com">TemplateOnWeb</a></p>
	  </div>
	</div>
 </div>
 </div>
</section>

<script src="js/common.js"></script>

</body>


</html>