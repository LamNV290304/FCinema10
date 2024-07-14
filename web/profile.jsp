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
       

    </head>   
    <body>
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
                        <input type="text" name="fullname" value="${sessionScope.user.getFullname()}" readonly>
                        <label>Full Name *</label>
                    </div>

                    <div class="input-field">
                        <input type="number" name="phoneNumber" value="${sessionScope.user.getPhone()}" readonly>
                        <label>Phone Number *</label>
                    </div>
                    <div class="input-field">
                        <input type="text" name="email" value="${sessionScope.user.getEmail()}" readonly>
                        <label>Email *</label>
                    </div>

                    <div class="input-field">
                        <h6 style="color: black">Date of Birth</h6>
                        <input type="date" name="birthday" value="${sessionScope.user.getBirthday()}" readonly>
                        <label for="r-birthday"></label>
                    </div>
                    <div>
                    <label for="r-fname" class="gender-title">
                        <span class="sp-gender" style="color: white">Gender</span><span>*</span> 
                        <input type="radio" name="r-gender" id="male-gender" readonly value="Male" ${sessionScope.user.getGender() == 'Male' ? 'checked' : ''}> Male                     
                        <input type="radio" name="r-gender" id="female-gender" readonly value="Female" ${sessionScope.user.getGender() == 'Female' ? 'checked' : ''}> Female
                     </label>
                    </div>
                    <div class="input-field">
                        <input type="text" name="location" value="${sessionScope.user.getCity()}" readonly>
                        <label>Location *</label>
                    </div>
                    
                    <button type="submit">Edit profile</button>
                </form>
                <br>
            </div>
        </section>

    </body>
</html>
