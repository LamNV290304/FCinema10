<%-- 
    Document   : informovie
    Created on : Jul 11, 2024, 6:23:19 AM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${infor_movie.getMovieName()}</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" >
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" >
        <link href="assets/css/global.css" rel="stylesheet">
        <link href="assets/css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noticia+Text:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <style>
        .infor_movie{
            border: 3px gray solid;
            border-radius: 15px;
            background-color: #FDFCF0;
            margin: 20px;
        }
        
        .content-body{
            background-color: #FDFCF0;
        }
        
        .button-click{
            background-color: #DFD09B;
        }
        
        .button_1:hover{
            background-color : #DFD09B; 
        }
    </style>    
    <body>
        
        <!-- Navigator Bar -->
        <section id="header">
            <nav class="navbar navbar-expand-md navbar-light p-0 bg-black" id="navbar_sticky">
                <div class="container-xl">
                    <a class="p-0 navbar-brand fw-bold text-white" href="index.html"> <span class="bg_brow p-1 px-2">F</span> cineflix</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mb-0 ms-auto">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="about.html">About </a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Movies
                                </a>
                                <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="blog.html">Now Showing</a></li>
                                    <li><a class="dropdown-item border-0" href="blog_detail.html">Coming Soon</a></li>
                                    <li><a class="dropdown-item border-0" href="./ListMovie">All Movies</a></li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="services.html">Services </a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Theaters
                                </a>
                                <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="blog.html">All F-Cinemas</a></li>
                                    <li><a class="dropdown-item border-0" href="blog_detail.html">3D Cinemas</a></li>
                                    <li><a class="dropdown-item border-0" href="blog_detail.html">Special Cinemas</a></li>
                                </ul>
                            </li>
<!--                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Pages
                                </a>
                                <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="gallery.html"> Gallery</a></li>
                                    <li><a class="dropdown-item border-0" href="login.jsp"> Login</a></li>
                                </ul>
                            </li>-->

                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Contact</a>
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
                            
                            
                            <li class="nav-item dropdown ">
                                
                            <img  src="assets/img/user.svg" alt="user" style="width:40px;height:40px;margin-top: 15px;margin-left: 20px"/>
                            
                                <ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="login.jsp"> Sign In</a></li>
                                    <li><a class="dropdown-item border-0" href="register.jsp"> Register</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
        
        <!--End Navbar-->
        
        <!-- Information Movie -->
        <div class="container">
            <h2 style="border-bottom: 5px gray solid">MOVIE INFORMATION</h2>
            
          
            <div class="detail" style="margin: 35px">
                <div class="row">
                    <div class="col-md-6" style="margin-right: -150px">
                        <img style="width: 60%;height: 80%;" src="${infor_movie.getMoviePoster()}" alt="${infor_movie.getMovieName()}"/>
                    </div>
                    <div class="col-md-6">
                        <h3 style="border-bottom: 1px gray solid">${infor_movie.getMovieName()}</h3>
                        <div style="margin-top: 60px">
                            <div class="infor_movie"> 
                            <ul>
                                <li  style="margin-left: 20px ;margin-top: 20px;font-style: oblique">Director: ${infor_movie.getMovieDirector()}</li>
                                <li style="margin-left: 20px ;font-style: oblique">Cast: ${infor_movie.getMovieActress()}</li>
                                <li style="margin-left: 20px ;font-style: oblique">Genre: ${infor_movie.getMovieGenres()}</li>
                                <li style="margin-left: 20px ;font-style: oblique">Release Date: ${infor_movie.getMovieRelease()}</li>
                                <li style="margin-left: 20px ;font-style: oblique;margin-bottom: 20px">Running time: ${infor_movie.getMovieLength()}</li>    
                            </ul>
                           </div>
                           <div class="button_1 button-click">
                               <a href="./schedulebooking?movieId=${infor_movie.getMovie_id()}" class="button-click">${infor_movie.getMovieLength() == "N/A" ? "Coming Soon":"Booking"}</a>
                           </div> 
                        </div>
                    </div>
                    
                    
                </div>
            </div>>
        </div>>
   <div style="border-top: 5px solid gray; margin: 20px ">
       
   </div> 
        
        <!-- Description Part and Trailer -->
        <div class="content-body">        
        <div class="container ">  
            <div class="row">
                <div class="col-md-6" style="border-right: gray 3px solid">
                    <h2 style="background-color: #DFD09B;border: red solid 2px;border-radius: 10px;text-align: center">DESCRIPTION</h2>
                    <p>${infor_movie.getMovieDescription()}</p>
                </div>

                <div class="col-md-6" >
                    <h2 style="background-color: #DFD09B;border: red solid 2px;border-radius: 10px;text-align: center">Trailer</h2> 
                    <iframe width="700px" height="400px" src="${infor_movie.getMovieTrailer()}"/>
                </div>

            </div>
        </div>
        </div>
        
            
        
        
         <section id="footer">
            <div class="footer_m bg_backo p_3">
                <div class="container-xl">
                    <div class="footer_1 row">
                        <div class="col-md-3">
                            <div class="footer_1i">
                                <h3><a class="text-white" href="index.html"> <span class="bg_brow p-1 px-2">F</span> CineFlix</a></h3>
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
                                <h5 class="col_light mb-4">CONTACT US TO BOOKING</h5>
                                <h6 class="font_14 text-light">VIETNAM</h6>
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
                            <p class="mb-0 text-light">© 2024 FCINEMA Project. All Rights Reserved | Design by <a class="col_brow fw-bold" href="#">Dokkuhai</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
  
    </body>
</html>
