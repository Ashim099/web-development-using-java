
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminPanel.css"/>
    </head>
    <body>
        <div class="nav-bar">
            <div class="nav-bar-wrapper">
                <div class="logo">

                    <img src="${pageContext.request.contextPath}/image/logo/lugaPasalLogo.png" alt="">

                </div>
                <div class="menu-wrapper">
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}">Home</a>

                        <form method="get" action="logout">
                            <button type="submit" class="logout-button" style="background-color: #007bff">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="admin-container">
            <h2>Admin Panel</h2>
            <div class="admin-options">
                <div class="admin-option">
                    <a href="admin-product/adminShowAllProduct.jsp">Show All Products</a>
                </div>
                <div class="admin-option">
                    <a href="admin-product/addProduct.jsp">Add Product</a>
                </div>
                <div class="admin-option">
                    <a href="admin-product/showOrders.jsp">Show Orders</a>
                </div>
                <div class="admin-option">
                    <a href="admin-product/orderListByClient.jsp">Show Order By User</a>

                </div>
            </div>
        </div>
    </body>
</html>

