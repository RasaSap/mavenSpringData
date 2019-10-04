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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
	
     </body>
             
         <form method="POST" action="save">  
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
             <input type="hidden" name="id" value="${product.id}"> 
            <label for="id"> Painting Id:</label><br>     
            <input name ="id" disabled="disabled" value="${product.id}"><br>
            <label for="name"> Name:</label><br>  
            <input name ="name" disabled="disabled" value="${product.name}"><br>
            <label for="price"> Price:</label><br>  
            <input name ="price" disabled="disabled" value="${product.price}"><br>
            <label for="quantity"> Enter quantity:</label><br>  
            <input name ="quantity" value=""><br>
           
            <button><input type="submit" value="Save"></button>
            <button><a href="./">Back</a></button>
        </form> 

 </html> 
