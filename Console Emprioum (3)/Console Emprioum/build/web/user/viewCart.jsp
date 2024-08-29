
<%@page import="coursework.model.dao.CartDAO"%>
<%@page import="coursework.model.entity.Cart"%>
<%@page import="coursework.model.dao.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<%
    CartDAO cartDAO = new CartDAO();
    ArrayList<Cart> userCartList = cartDAO.getOrderByUser(request.getParameter("username"));
    request.setAttribute("userCart", userCartList);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCart.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    </head>
    <body>


        <div class="nav-bar">
            <div class="nav-bar-wrapper">
                <div class="logo">

                    <img src="${pageContext.request.contextPath}/image/logo/lugaPasalLogo.png" alt="">

                </div>
                <div class="menu-wrapper">
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/user/userPanel.jsp">Home</a>
                        <a href="editProfile.jsp?username=<%=session.getAttribute("user")%>">Edit Profile</a>
                        <a href="viewCart.jsp?username=<%=session.getAttribute("user")%>">Show Cart</a>
                        <a href="changePassword.jsp?username=<%=session.getAttribute("user")%>">Change Password</a>

                        <form method="get" action="logout">
                            <button type="submit" class="logout-button" style="background-color: #111; color:white;">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
    <hr>




    <div class="cart-container">
        <h1>My Cart</h1>

        <div class="cart-items">
            <c:forEach var="cart" items="${userCart}">
                <div class="cart-item">
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/image/productPic/${cart.getImageUrlFromPart()}" alt="Product Image">
                    </div>
                    <div class="product-details">
                        <p class="product-id">Product Id: ${cart.getProductId()}</p>
                        <p class="product-name">Name: ${cart.getProductName()}</p>
                        <p class="product-category"> Category: ${cart.getCategory()}</p>
                        <p class="product-price">Price: ${cart.getPrice()}</p>
                        <p class="product-quantity"> Ordered Quantity: ${cart.getQuantity()}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>

































