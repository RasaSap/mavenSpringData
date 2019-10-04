<%-- 
    Document   : editCart
    Created on : Sep 22, 2019, 6:15:31 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <form method="POST" action="saveOrder">  
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <label for="name"> Your First Name:</label><br>     
            <input name ="name" value=""><br>
            <label for="surname"> Your Last Name:</label><br>  
            <input name ="surname" value=""><br>
            <label for="address"> Your Address:</label><br>  
            <input name ="address" value=""><br>
            <label for="email" > Your E-mail:</label><br>  
            <input name ="email" value=""><br>
            <label for="phone" > Your Phone Number:</label><br>  
            <input name ="phone" value=""><br>
           
            <button><input type="submit" value="Save"></button>
            <button><a href="./">Back</a></button>
        </form> 
    </body>
</html>
