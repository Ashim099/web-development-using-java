

<%@page import="coursework.model.entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coursework.model.dao.UserDAO"%>
<%@page import="coursework.model.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Order</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clientCart.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    </head>
    <body>

        <%
            String userName = request.getParameter("username");
            CartDAO cartDAO = new CartDAO();
            UserDAO userDAO = new UserDAO();
            ArrayList<Cart> arrayListCart = null;
            if (userDAO.isUserAlreadyRegistered(userName)) {
                arrayListCart = cartDAO.getOrderByUser(userName);
            }

            session.setAttribute("userCart", arrayListCart);
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



        <div class="container">
            <h1>Order list by client</h1>
            <form method="post">
                <div class="form-group">
                    <label for="username">User Name:</label>
                    <input type="text" name="username" id="username" placeholder="Enter username">
                    <button type="submit">Show</button>
                </div>
            </form>

            <div class="product-list">
                <c:forEach var="cart" items="${userCart}">
                    <div class="product-item">
                        <div class="image-container">
                            <img src="<%=request.getContextPath() + "/image/productPic/"%>${cart.getImageUrlFromPart()}" alt="Product Image">
                        </div>
                        <h3>Product Name: ${cart.getProductName()}</h3>
                        <p>Category: ${cart.getCategory()}</p>
                        <p>Price: ${cart.getPrice()}</p>

                    </div>
                </c:forEach>
            </div>
        </div>    

    </body>
</html>
