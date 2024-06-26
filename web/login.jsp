




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LOGIN</title>
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
                <h2>Login</h2>
                <div class="input-field">
                    <input type="text" required>
                    <label>Enter your email or username</label>
                </div>
                <div class="input-field">
                    <input type="password" required>
                    <label>Enter your password</label>
                </div>
                <div class="forget">
                    <label for="remember">
                        <input type="checkbox" id="remember">
                        <p>Remember me</p>
                    </label>
                    <a href="forgot_password.jsp">Forgot password?</a>
                </div>
                <button type="submit">Log In</button>
                <div class="login">
                        <p style="color: white">Don't have an account? <a href="register.jsp">Register</a></p>
                </div>
            </form>
            
        </div>
            
        </section>
       
        
        
        
    </body>


</html>

<!-- Credit: www.codingnepalweb.com -->