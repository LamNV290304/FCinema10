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
                        <input type="text" required>
                        <label>Enter your name *</label>
                    </div>

                    <div class="input-field">
                        <input type="text" required>
                        <label>Enter your phone number *</label>
                    </div>
                    <div class="input-field">
                        <input type="text" required>
                        <label>Enter your email *</label>
                    </div>

                    <div class="input-field">
                        <input type="text" required>
                        <label>Enter your username *</label>
                    </div>
                    
                    <div class="input-field">
                        
                        <input type="password" required>
                        <label>Enter your password *</label>
                         
                    </div>

                    <div class="input-field">
                        
                        
                        <input type="password" required>
                        <label>Re-type your password *</label>
                    </div>
                    <div class="input-field">
                        <br><label for="r-birthday">Date of Birth<span>*</span></label>
                      <input type="date" id="birthday" name="birthday" required>
                    </div>
                    <div>
                    <label for="r-fname" class="gender-title">
                        <span class="sp-gender" style="color: white">Gender</span><span>*</span> 
                        <input type="radio" name="r-gender" id="male-gender" value="1" style=""> Male                     
                        <input type="radio" name="r-gender" id="female-gender" value="2" style="color: white"> Female
                     </label>
                    </div>
                    <div class="input-field">
                        <input type="text" required>
                        <label>Location *</label>
                    </div>
                    
                    <button type="submit">Register</button>
                    <div class="login">
                        <p style="color: white">Already have an account? <a href="login.jsp">Login</a></p>
                    </div>
                </form>
                </br>
            </div>

        </section>

    </body>


</html>