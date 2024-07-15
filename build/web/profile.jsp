<%-- 
    Document   : profile
    Created on : Jul 14, 2024, 3:57:20 AM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PROFILE</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link rel="stylesheet" href="assets/css/profile.css">
        <link href="css/font-awesome.min.css" rel="stylesheet" >
        <link href="https://fonts.googleapis.com/css2?family=Noticia+Text:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>

        <script>
            function enableEditing() {
                const inputs = document.querySelectorAll('.input-field input');
                inputs.forEach(input => input.removeAttribute('readonly'));

                const genderInputs = document.querySelectorAll('input[name="r-gender"]');
                genderInputs.forEach(input => input.removeAttribute('readonly'));

                document.getElementById('edit-btn').style.display = 'none';
                document.getElementById('save-btn').style.display = 'block';
            }
        </script>

    </head>   
    <body>
        <jsp:include page="header.jsp" />
        <section id="login">
            <div class="wrapper">
                <form action="UpdateProfile" method="post">
                    <h2>Profile</h2></br>

                    <div style="color: red">
                        <h3>
                            ${requestScope.error == null ? "":requestScope.error }
                        </h3>   
                    </div>   

                    <div class="input-field">
                        <span>Full Name *</span>
                        <input type="text" name="fullname" value="${sessionScope.user.getFullname()}" readonly>
                    </div>

                    <div class="input-field">
                        <span>Phone Number *</span>
                        <input type="number" name="phoneNumber" value="${sessionScope.user.getPhone()}" readonly>
                    </div>
                    <div class="input-field">
                        <span>Email *</span>
                        <input type="text" name="email" value="${sessionScope.user.getEmail()}" readonly>
                    </div>

                    <div class="input-field">
                        <span>Date of Birth</span>
                        <input type="date" name="birthday" value="${sessionScope.user.getBirthday()}" readonly>
                    </div>
                    <div>
                        <span class="sp-gender" style="color: white">Gender</span><span>*</span> 
                        <input type="radio" name="r-gender" id="male-gender" readonly value="M" ${sessionScope.user.getGender() == 'M' ? 'checked' : ''}> Male                     
                        <input type="radio" name="r-gender" id="female-gender" readonly value="F" ${sessionScope.user.getGender() == 'F' ? 'checked' : ''}> Female
                    </div>
                    <div class="input-field">
                        <span>Location *</span>
                        <input type="text" name="location" value="${sessionScope.user.getCity()}" readonly>
                    </div>

                    <button type="button" id="edit-btn" onclick="enableEditing()">Edit profile</button>
                    <button type="submit" id="save-btn" style="display:none;">Save profile</button>
                </form>
                <br>
            </div>
        </section>

    </body>
</html>
