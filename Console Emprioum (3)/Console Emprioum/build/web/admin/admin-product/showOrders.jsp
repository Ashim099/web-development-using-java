<%-- 
    Document   : showOrders
    Created on : May 10, 2023, 1:19:49 PM
    Author     : ripesh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="coursework.model.entity.Cart"%>
<%@page import="coursework.model.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/showOrders.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
    </head>
    <body>

        <%
            CartDAO cartDAO = new CartDAO();
            ArrayList<Cart> allCart = cartDAO.getAllOrder();
            request.setAttribute("cartList", allCart);
        %>
        <div class="nav-bar">
            <div class="nav-bar-wrapper">
                <div class="logo">

                    <img src="${pageContext.request.contextPath}/image/logo/lugaPasalLogo.png" alt="">

                </div>
                <div class="menu-wrapper">
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/admin/adminPanel.jsp">Admin Panel</a>

                        <form method="get" action="logout">
                            <button type="submit" class="logout-button">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    <center><h1>Orders</h1></center>
    <div class="product">
        <c:forEach var="order" items="${cartList}">
            <div class="product-item">
                <img src="<%=request.getContextPath() + "/image/productPic/"%>${order.getImageUrlFromPart()}" />
                <h3>Product: ${order.getProductName()}</h3>
                <div class="price-stock">
                    <p class="stock">Quantity: ${order.getQuantity()}</p>
                </div>
                <a href="editProduct.jsp?productId=${order.getProductId()}">Edit</a>
                <a href="deleteProduct.jsp?productId=${order.getProductId()}">Delete</a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
