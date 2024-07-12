<%-- 
    Document   : bookseat
    Created on : Jul 12, 2024, 4:00:15 AM
    Author     : Dokkuhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Seat</title>
        <link href="assets/css/seat.css" rel="stylesheet">
    </head>
    <body>
        <div class="move-container">
      <label>Pick a movie:</label>
      <select id="movie">
        <option value="16">Avengers: End Game ($16)</option>
        <option value="20">Dark Knight ($20)</option>
        <option value="10">Harry Potter and the Goblet of Fire ($10)</option>
        <option value="12">Transformers ($12)</option></select>
    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>Available</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>
      <li>
        <div class="seat occupied"></div>
        <small>Occupied</small>
      </li>
    </ul>

    <div class="container">
      <div class="screen"></div>
      <div class="row">
        <div class="seat"></div>
      </div>
    </div>

    <p class="text">
      You have selected <span id="count">0</span> seats for the price of $<span
        id="total"
        >0</span
      >!
    </p>

    <script src="assets/js/seat.js"></script>
    </body>
</html>
