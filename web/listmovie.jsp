<%-- 
    Document   : listmovie
    Created on : Jul 4, 2024, 3:18:48 PM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Movies</title>
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

        <!--header -->     
        <jsp:include page="header.jsp" /></br>

        
        <!-- List movie -->
        
       <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listMovies}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="#" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="#" class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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

        <script src="assets/js/common.js"></script>
    </body>
</html>
