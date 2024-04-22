<%-- 
    Document   : Calculator
    Created on : 17 Apr 2024, 3:20:01 pm
    Author     : Luqman Hakim Bin Aziz
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Temperature Conversion</title>
</head>
<body>
    <h2>Temperature Conversion</h2>
    <form action="<%= request.getContextPath() %>/temperatures.jsp" method="post">
        Enter temperature in Celsius: <input type="number" step="any" name="celsius" required><br>
        <input type="submit" value="Convert to Fahrenheit">
    </form>
    <%
        if (request.getMethod().equals("POST")) {
            double celsius = Double.parseDouble(request.getParameter("celsius"));
            double fahrenheit = (9.0/5.0) * celsius + 32;
    %>
    <p><%= String.format("Temperature in Fahrenheit: %.2f", fahrenheit) %></p>
    <%
        }
    %>
</body>
</html>
