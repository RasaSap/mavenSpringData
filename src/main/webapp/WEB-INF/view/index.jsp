<%-- 
    Document   : index
    Created on : Sep 11, 2019, 9:34:03 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>      
        <title>Product Page</title>
         <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 710px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
  
    </head>
    
    <body>
        
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">
          <div>PHoTo Co</div>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
        <p>
        <a href="cart">Cart</a>      
        </p>
      <p><a href="editCart">Check-out</a></p>
      
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      
	<table style="border: 1px solid transparent" cellpadding="2" cellspacing="2" border="1">
            <colgroup>
                <col style="width: auto" /> <!- takes the remaining space -->
                <col style="width: 15%" /> <!- or use 33.3333% for all instead if you want to occupy full width -->
                <col style="width: 30%" />
                <col style="width: 15%" />
                <col style="width: 15%" />
            </colgroup>
		<tr>
			<th text-align="center">PRODUCT ID</th>
			<th>PRODUCT NAME</th>
			<th></th>
			<th>PRICE</th>
			<th></th>
		</tr>
		<c:forEach var="product" items="${list}">
			<tr>
				<td>${product.id}</td>
				<td>${product.name}</td>                            
				<td><img width="250" height="150" src="data:image/jpg;base64, ${product.getEncodedPhoto()} " /></td>                                
				<td>${product.price}</td>
				<td align="center">
					<a href="edit?id=${product.id}">Buy Now</a>
				</td>                                                           
			</tr>
		</c:forEach>
	</table>
       
      
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>
           <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP25HkgkAOVS3-NuioOkywY5gyrlJNyAuJjyTBE6JnLA6IDQOIEg" alt="Logo" height="100" width="150"> 
        </p>
      </div>
      <div class="well">
        <p>
           <img src="data:image/png;base64,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" alt="Logo" height="100" width="150">
        </p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

        	
    </body>
</html>

