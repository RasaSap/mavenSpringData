<%-- 
    Document   : cartList
    Created on : Sep 12, 2019, 10:23:06 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <title>JSP Page</title>
        <style>
            body {
                margin: 50px;
            }
        </style>
    </head>
    <body>
        <h3>Cart Page</h3>
        <table cellpadding="2" cellspacing="2" border="1">
            <colgroup>
                <col style="width: 10%" /> 
                <col style="width: 10%" /> 
                <col style="width: 10%" />
                <col style="width: 250px" />
                <col style="width: 10%" />
                <col style="width: 10%" />
            </colgroup>
            <tr>
                <th>Option</th>
                <th>Id</th>
                <th>Name</th>
                <th>Photo</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Sub Total</th>
            </tr>
            <c:forEach var="item" items="${itemList}">
                <tr>
                    <td align="center">
                        <a class="btn btn-light" 
                           href="cart/delete?id=${item.productId.id}&id2=${item.id}"
                           onclick="return confirm('Are you sure?')">Remove</a></td>
                    <td>${item.productId.id}</td>
                    <td>${item.productId.name}</td>
                    <td><img width="250" height="150" src="data:image/jpg;base64, ${item.productId.getEncodedPhoto()} " /></td>
                    <td>${item.productId.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.productId.price * item.quantity }</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="6" align="right">Sum €</td>
                <td>${total}</td>
            </tr>
        </table>
        <br>

        <button type="button" class="btn btn-secondary btn-lg"><a href="./">Continue Shopping</a></button>
        <button type="button" class="btn btn-secondary btn-lg"><a href="editCart">Proceed To Checkout</a></button>


    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</html>
