

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
        <title>LOGIN</title>
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
                    <h2>Login</h2>

                    <%
                         String error = (String) request.getAttribute("error");
                    %>
                    <div class="input-field">
                        <input type="text" name="username" required>
                        <label>Enter your email or username</label>
                    </div>
                    <div class="input-field">
                        <input type="password" name="password" required>
                        <label>Enter your password</label>
                    </div>
                    <div class="forget">
                        <label for="remember">
                            <input type="checkbox" id="remember">
                            <p>Remember me</p>
                        </label>
                        <a href="forgot_password.jsp" >Forgot password?</a>
                    </div>
                    <button type="submit">Log In</button>
                    <div class="register">
                        <p style="color: white">Don't have an account? <a href="register.jsp">Register</a></p>
                    </div>
                </form>

            </div>

        </section>
    </body>


</html>


<!-- Credit: www.codingnepalweb.com -->