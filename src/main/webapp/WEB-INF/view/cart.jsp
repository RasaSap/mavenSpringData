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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
      margin: 0;
      margin-left: 200px;
      font-family: Arial, Helvetica, sans-serif;
       }
       </style>
    </head>
    <body>
        <h3>Cart Page</h3>
	<table cellpadding="2" cellspacing="2" border="1">
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
                            <td align="center"><a
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
			<td colspan="6" align="right">Sum</td>
			<td>${total}</td>
		</tr>
	</table>
                <br>
                
                <a href="./">Continue Shopping</a><br>
                    <a href="editCart">Proceed To Checkout</a>
               
	
    </body>
</html>
