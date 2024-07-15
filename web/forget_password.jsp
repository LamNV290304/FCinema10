

<%-- 
    Document   : login
    Created on : Jun 20, 2024, 3:57:20 AM
    Author     : Dokkuhai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forget Password</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link rel="stylesheet" href="assets/css/login.css">
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="https://fonts.googleapis.com/css2?family=Noticia+Text:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<!--        <script>
            function validateForgotPassword() {
                var username = document.getElementsByName("username")[0].value.trim();
                if (username === "") {
                    alert("Vui lòng nhập tên người dùng hoặc email để khôi phục mật khẩu.");
                    return false;
                }
                window.location.href = "ForgotPassword?username=" + encodeURIComponent(username);
                return true;
            }
        </script>-->

    </head>   
    <body>
        <section id="login">
            <div class="wrapper">
                <form action="Login" method="post">
                    <h2>Forget Password ? Recover my password by answer the questions</h2>
                    <div style="color: red">

                
                        <h3>
                           ${requestScope.error == null ? "":requestScope.error }
                        </h3>   
                    </div>   
                    <div class="input-field">
                        <input type="text" name="username" required>
                        <label>Enter your username</label>
                    </div>
                    
                    <div class="login">
                        <p style="color: white">Already have an account? <a href="login.jsp">Login</a></p>
                    </div>
                        
                        <button style="margin: 10px" type="submit">Submit</button>
                    <div class="register">
                        <p style="color: white">Don't have an account? <a href="register.jsp">Register</a></p>
                    </div>
                </form>

            </div>

        </section>
    </body>


</html>


<!-- Credit: www.codingnepalweb.com -->