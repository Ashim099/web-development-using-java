
<%@page import="coursework.model.entity.Product"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coursework.model.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Show All Product Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminAllProduct.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
    </head>
    <div class="nav-bar">
        <div class="nav-bar-wrapper">
            <div class="logo">

                <img src="${pageContext.request.contextPath}/image/logo/lugaPasalLogo.png" alt="">

            </div>
            <div class="menu-wrapper">
                <div class="menu">
                    <a href="${pageContext.request.contextPath}/admin/adminPanel.jsp">Admin Panel</a>

                        <form method="get" action="logout">
                            <button type="submit" class="logout-button" style="background-color: #111; color:white;">Logout</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="product">
        <%
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> arrayList = productDAO.getAll();
            request.setAttribute("productList", arrayList);
        %>

        <c:forEach var="product" items="${productList}">
            <div class="product-item">

                <img src="<%=request.getContextPath() + "/image/productPic/"%>${product.getImageUrlFromPart()}"/>
                <h3>${product.getProductName()}</h3>
                <p>Description : ${product.getDescription()}</p>
                <p>Rating : ${product.getRating()}</p>
                <div class="price-stock">
                    <p class="price">Price: $${product.getPrice()}</p>
                    <p class="stock">${product.getStock()} in stock</p>
                </div>
                <a href="editProduct.jsp?productId=${product.getProductId()}">Edit</a>
                <a href="deleteProduct.jsp?productId=${product.getProductId()}">Delete</a>
            </div>
        </c:forEach>
    </div>
</html>
