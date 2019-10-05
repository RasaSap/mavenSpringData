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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <title>JSP Page</title>
        <style>
          body {
                padding: 100px;
                font-family: Arial, Helvetica, sans-serif;
            }
            form {
                width: 30%;
            }
        </style>
    </head>
    <body>
        <form method="POST" action="saveOrder">  
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="name"> Your First Name:</label>   
                <input class="form-control" name ="name" value="">
            </div>
            <div class="form-group">
                <label for="surname"> Your Last Name:</label>
                <input class="form-control" name ="surname" value="">
            </div>
            <div class="form-group">
                <label for="address"> Your Address:</label>  
                <input class="form-control" name ="address" value="">
            </div>
            <div class="form-group">
                <label for="email" > Your E-mail:</label>  
                <input class="form-control" name ="email" value="">
            </div>
            <div class="form-group">
                <label for="phone" > Your Phone Number:</label>  
                <input class="form-control" name ="phone" value="">
            </div>

            <input class="btn btn-primary" type="submit" value="Save"></button>

            <a class="btn btn-primary" href="./" role="button">Back</a>
        </form> 
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>
