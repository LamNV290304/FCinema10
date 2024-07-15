<%-- 
    Document   : header
    Created on : Jul 7, 2024, 3:05:24 AM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" >
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" >
        <link href="assets/css/global.css" rel="stylesheet">
        <link href="assets/css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noticia+Text:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!-- HEADER  -->
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
                                    <c:choose>
                                        <c:when test="${empty sessionScope.user}">
                                            <li><a class="dropdown-item" href="login.jsp"> Sign In</a></li>
                                            <li><a class="dropdown-item border-0" href="register.jsp"> Register</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                            <li><a class="dropdown-item border-0" href="Logout">Logout</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>

        <!--End Navbar-->


        <!-- Banners -->
        <section id="center" class="center_home">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="assets/img/1.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-md-block">
                            <h5 class="col_brow text-uppercase">DC Films</h5>
                            <h1 class="text-uppercase text-white font_50 mt-3 mb-3">Black Adam</h1>
                            <p class="text-light  mx-auto">Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods--and imprisoned just as quickly--Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.</p>
                            <h6 class="mb-0 mt-4"><a class="button" href="#">Read More</a></h6>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/img/2.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-md-block">
                            <h5 class="col_brow text-uppercase">ANIME HOTS</h5>
                            <h1 class="text-uppercase text-white font_50 mt-3 mb-3">Doraemon <br> Nobita's Earth Symphony</h1>
                            <p class="text-light mx-auto">Doraemon the Movie: Nobita's Earth Symphony (映画ドラえもん: のび太の地球交響楽シンフォニー, Eiga Doraemon: Nobita no chikyū shinfonī) is a 2024 Japanese animated musical fantasy science fiction adventure film. It is the 43rd film of Doraemon, created by Fujiko F. Fujio. Directed by Kazuaki Imai with a screenplay by Teruko Utsumi, it was released on March 1, 2024.</p>
                            <h6 class="mb-0 mt-4"><a class="button" href="#">Read More</a></h6>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/img/ba.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-md-block">
                            <h5 class="col_brow text-uppercase">NEW MOVIE</h5>
                            <h1 class="text-uppercase text-white font_50 mt-3 mb-3">How to Make Millions <br> Before Grandma Dies </h1>
                            <p class="text-light mx-auto">A man quits work to care for dying grandmother, motivated by her fortune. He schemes to win her favor before she passes.</p>
                            <h6 class="mb-0 mt-4"><a class="button" href="#">Book Now!</a></h6>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <!<!-- End Banner -->
    </body>
</html>
