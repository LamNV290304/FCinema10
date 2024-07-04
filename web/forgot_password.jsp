<%-- 
    Document   : forgot_password.jsp
    Created on : Jun 20, 2024, 5:21:58 PM
    Author     : Dokkuhai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Forget Password</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 50px;
            }
            form {
                max-width: 500px;
                margin: auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
            }
            label {
                display: block;
                margin-top: 20px;
                margin-bottom: 10px;
            }
            select, input[type="text"] {
                width: 100%;
                padding-bottom: 8px;
                padding-top: 8px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <form action="resetpassword" method="POST">
            <h2>Forget Password</h2></br>

            <%
                String error = (String) request.getAttribute("error");
            %>
            <label for="question1">Security Question 1:</label>
            <!--        <select id="question1" name="question1" required>
                        <option value="" disabled selected>Select a question</option>
                        <option value="q1">What is your mother's maiden name?</option>
                        <option value="q2">What was the name of your first pet?</option>
                        <option value="q3">What was the name of your elementary school?</option>
                    </select>-->
            <label for="question1">What is your Date of Birth?</label>
            <input type="text" id="answer1" name="answer1" placeholder="Format Answer: dd-MM-yyyy" required>

            <label for="question2">Security Question 2:</label>
            <!--        <select id="question2" name="question2" required>
                        <option value="" disabled selected>Select a question</option>
                        <option value="q4">What is your favorite book?</option>
                        <option value="q5">What city were you born in?</option>
                        <option value="q6">What is your favorite movie?</option>
                    </select>-->
            <label for="question1">What is your Email?</label>
            <input type="text" id="answer2" name="answer2" placeholder="example@example.com" required>

            <label for="question3">Security Question 3:</label>
            <!--        <select id="question3" name="question3" required>
                        <option value="" disabled selected>Select a question</option>
                        <option value="q7">What is your favorite food?</option>
                        <option value="q8">What was the make of your first car?</option>
                        <option value="q9">Where did you go on your first vacation?</option>
                    </select>-->
            <label for="question1">Where is your City?</label>
            <input type="text" id="answer3" name="answer3" placeholder="Answer" required>

            <button type="submit">Submit</button>
        </form>
    </body>
</html>