<%-- 
    Document   : listcinema
    Created on : Jul 14, 2024, 3:48:37 AM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class = "list-schedule row">
                    <h3>LIST CINEMA</h3>
                    <c:forEach items="${listScheduleValid}" var="list">
                        <div class="col-md-2">
                            <a href="">
                                <div class="card-show">
                                        <h4>${list.getRoomId().getCinema().getCinemaName()}</h4>
                                </div>
                            </a>            
                        </div>        
                    </c:forEach>
         </div>
    </body>
</html>
