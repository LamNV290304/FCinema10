<%-- 
    Document   : register
    Created on : Jun 20, 2024, 3:57:20 AM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>REGISTER</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link rel="stylesheet" href="css/login.css">
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="css/global.css" rel="stylesheet">
        <link href="css/about.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noticia+Text:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>

    </head>   
    <body>
        <section id="login">
            <div class="wrapper">
                <form action="#">
                    <h2>Register</h2>
                    <div class="input-field">
                        <input type="text" name="fullname" required>
                        <label>Enter your full name *</label>
                    </div>

                    <div class="input-field">
                        <input type="text" name="phoneNumber" required>
                        <label>Enter your phone number *</label>
                    </div>
                    <div class="input-field">
                        <input type="text" name="email" required>
                        <label>Enter your email *</label>
                    </div>

                    <div class="input-field">
                        <input type="text" name="username" required>
                        <label>Enter your username *</label>
                    </div>
                    
                    <div class="input-field">
                        <input type="password" name="password" required>
                        <label>Enter your password *</label>
                    </div>

                    <div class="input-field">
                        <input type="password" name="re_password" required>
                        <label>Re-type your password *</label>
                    </div>
                    <div class="input-field">
                         <input type="text" name="birthday" required>
                        <label for="r-birthday">Date of Birth</label>
                       
                    </div>
                    <div>
                    <label for="r-fname" class="gender-title">
                        <span class="sp-gender" style="color: white">Gender</span><span>*</span> 
                        <input type="radio" name="r-gender" id="male-gender" value="Male" style=""> Male                     
                        <input type="radio" name="r-gender" id="female-gender" value="Female" style="color: white"> Female
                     </label>
                    </div>
                    <div class="input-field">
                        <input type="text" name="location" required>
                        <label>Location *</label>
                    </div>
                    
                    <button type="submit">Register</button>
                    <div class="login">
                        <p style="color: white">Already have an account? <a href="login.jsp">Login</a></p>
                    </div>
                </form>
                <br>
            </div>
        </section>

    </body>


</html>