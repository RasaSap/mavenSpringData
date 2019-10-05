<%-- 
    Document   : cart
    Created on : Sep 12, 2019, 9:14:34 AM
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

        <form method="POST" action="save">  
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="id" value="${product.id}">

            <div class="form-group">     
                <label for="id"> Painting Id:</label>
                <input class="form-control" name ="id" disabled="disabled" value="${product.id}">
            </div>
            <div class="form-group"> 
                <label for="name"> Name:</label><br>  
                <input class="form-control" name ="name" disabled="disabled" value="${product.name}">
            </div>
            <div class="form-group"> 
                <label for="price"> Price €:</label><br>  
                <input class="form-control" name ="price" disabled="disabled" value="${product.price}">
            </div>
            <div class="form-group"> 
                <label for="quantity"> Enter quantity:</label>
                <input class="form-control" name ="quantity" value="">
            </div>

            <input class="btn btn-primary" type="submit" value="Save"></button>

            <a class="btn btn-primary" href="./" role="button">Back</a>

        </form> 
    </body>        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html> 
