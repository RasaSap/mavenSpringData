<%-- 
    Document   : orderDetails
    Created on : Sep 22, 2019, 6:55:22 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Confirmation</title>
    </head>
    <style>
        body,
        body * {
            margin: 0;
            padding: 0;
            vertical-align: top;
            box-sizing: border-box;
            background-color:aliceblue;
        }
        .contain {
            display: inline-block;
            width: 100%;
            margin: 20px;
        }
        h2{
            text-align: center; 
            padding: 50px;
        }
        h2 > a{
            color:aqua;
        }
        h4{
            color:darkgrey;
        }
        .contain{
            display: inline-block;
            width: 800px;
            margin: 40px calc( (100% - 1000px) / 2 ) 20px;
        }
        .contain > .left{
            display: inline-block;
            width: 50%;
            float: left;
        }
        .contain > .left > h3{
            display: inline-block;
            width: 100%;
            float: left;
            margin-bottom: 40px;
        }
        .contain > .left > ul{
            display: inline-block;
            width: 100%;
            float: left;
            margin-bottom: 70px;
            font-size: 16px;
        }
        .contain > .right{
            display: inline-block;
            width: 50%;
            float: left;
            padding-left: 10%;
        }

        .contain > .right > h3{
            display: inline-block;
            width: 100%;
            float: left;
            margin-bottom: 40px;
        }
        .contain > .right > ul{
            display: inline-block;
            width: 100%;
            float: left;
            margin-bottom: 70px;
            font-size: 16px;
        }
        .summary{
            display: inline-block;
            width: 100%;
            margin-left: -100px;
        }
    </style>
    <body>
        <div class="contain">
            <div>
                <h2 text-align="center">
                    <a href="./"> PhoTo Co </a>
                    ORDER SHIPMENT CONFIRMATION</h2>
            </div>
            <div class="left">
                <h4>SHIP TO INFO</h4>
                <ul>
                    <li>Name: ${order.name}</li>
                    <li>Last Name: ${order.surname}</li>
                    <li>Email: ${order.surname}</li>
                    <li>Phone: ${order.phoneN}</li>
                    <li>Address: ${order.street}</li>
                </ul>
            </div>

            <div class="right">
                <h4>SHIPPING INFORMATION</h4>
                <ul>
                    <li>Order Date and Time: 
                        <jsp:useBean id="now" class="java.util.Date"/>    
                        <fmt:formatDate value="${now}" pattern="dd-MM-yyyy"/>
                    </li>
                    <li>Order Number: ${order.id}</li>
                </ul>
            </div>

            <div class="summary">

                <div class="container">
                    <h4>CART SUMMARY</h4>

                    <div class="table-responsive">          
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Product name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Amount</th>

                                </tr>
                            </thead>
                            <tbody>
                                <% int j = 0;%>
                                <c:forEach var="item" items="${itemList}">
                                    <tr>  
                                        <td> <%=++j%> </td>
                                        <td> ${item.productId.name}</td>
                                        <td> ${item.quantity}</td>
                                        <td> ${item.productId.price}</td>
                                        <td> ${item.quantity * item.productId.price}</td>
                                    </tr>    
                                </c:forEach>

                                <tr>
                                    <td  align="right">Total €</td>
                                    <td>${totalAmount} </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>      
            </div>   
        </div>
    </body>      
</html>
