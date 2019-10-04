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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2 class="page-title">Confirmation</h2>
 
  <div class="customer-info-container">
      <h3>Customer Information:</h3>
      <ul>
          <li>Name: ${order.name}</li>
          <li>Last Name: ${order.surname}</li>
          <li>Email: ${order.surname}</li>
          <li>Phone: ${order.phoneN}</li>
          <li>Address: ${order.street}</li>
      </ul>
      <h3>Cart Summary:</h3>
      <ul>
          <li>Order Date and Time: 
            <jsp:useBean id="now" class="java.util.Date"/>    
            
            <fmt:formatDate value="${now}" pattern="dd-MM-yyyy HH:mm:ss" />
          </li>
          <li>Order Number: ${order.id}</li>
          
          <c:forEach var="item" items="${itemList}">
          <li>Product name: ${item.productId.name}
              
              Quantity: ${item.quantity}
              
              Price: ${item.productId.price}
              
              Amount: ${item.quantity * item.productId.price}</li>
          
          </c:forEach>
          
          <li>Total: ${totalAmount} </li>
            
      </ul>
  </div>
  </body>
</html>
