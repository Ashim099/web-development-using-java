<%@page import="coursework.model.entity.Product"%>
<%@page import="coursework.model.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Console Emprioum</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sortBy.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css"/>
          <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    </head>
    <body>


        <div class="nav-bar">
            <div class="nav-bar-wrapper">
                <div class="logo">
                    
                    

                    <img src="${pageContext.request.contextPath}/image/logo/lugaPasalLogo.png" alt="">

                </div>
                <div class="menu-wrapper">
                    <div class="menu">
                        <a href="#">Home</a>
                        <a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
                        <a href="${pageContext.request.contextPath}/pages/register.jsp">Register </a>
                    </div>
                </div>
            </div>
        </div>

        <hr>

        <div class="sortBy">


            <div class="category">
                <form method="get" >
                    <label for="sortBy">Sort By:</label>
                    <select name="sortBy" id="sortBy">
                        <option value="default">Default</option>
                        <option value="price">Price</option>
                        <option value="category">Category</option>
                        <option value="rating">Rating</option>
                    </select>
                    <button type="submit">Sort</button>
                </form>
            </div>

            <div class="product">
                <form method="get" >
                    <label for="sortBy">Product :</label>
                    <input type="text" name="productName" required placeholder="Product Name">
                    <button type="submit">Search</button>
                </form>
            </div>
        </div>




        <!--        <form method="get">
                    <select name="sortBy">
                        <option value="default">Default</option>
                        <option value="price" >Price</option>
                        <option value="category">Category</option>
                        <option value="rating">Rating</option>
                    </select>
                    <button type="submit">Sort </button>
                </form>
                
                
                <form method="get">
                    <label>  Product Name: </label>
                    <input type="text" name="productName" required>
                    <button type="submit"> Search </button>
                </form>-->


        <%
            ProductDAO productDAO = new ProductDAO();
            String sortBy = request.getParameter("sortBy");
            String productName = request.getParameter("productName");

            ArrayList<Product> arrayList = null;

            if (sortBy != null && productName == null) {

                arrayList = productDAO.getAll(sortBy);
                sortBy = null;
            } else if (sortBy == null && productName != null) {
                arrayList = productDAO.getByName(productName);

            } else {
                arrayList = productDAO.getAll();
            }

            request.setAttribute("productList", arrayList);


        %>






        <div class="product-list">
            <c:forEach var="product" items="${productList}">
                <div class="product-item">

                    <div class="image-container">
                        <img src="<%=request.getContextPath() + "/image/productPic/"%>${product.getImageUrlFromPart()}" alt="Product Image">
                    </div>

                    <h3>${product.getProductName()}</h3>
                    <p>Description : ${product.getDescription()}</p>
                    <p>Rating : ${product.getRating()}</p>
                    <div class="price-stock">
                        <p class="price">Price: $${product.getPrice()}</p>
                        <p class="stock">${product.getStock()} in stock</p>
                    </div>
                    <form method="post" action="user/addToCart">
                        <input type="hidden" name="username" value="<%=session.getAttribute("user")%>">
                        <input type="hidden" name="productId" value="${product.getProductId()}">
                        <input type="number" name="quantity" min="1" max="10" value="1">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>




        <div class="footer">
            <div class="footer-wrapper">
                <div class="footer-flex">
                    <div class="list">
                        <li> <a href="">Blog</a></li>
                        <li><a href="">About US</a></li>
                        <li><a href="">Contact US</a></li>
                        <li><a href="">Our Location</a></li>
                        <li><a href="">Our Branches</a></li>
                        <br>
                        <div class="description">
                             Welcome to Console Emprioum, your one-stop shop for the latest and greatest electronic gadgets! We offer a wide range of cutting-edge products to satisfy all your tech needs.
                        </div>

                    </div>
                    <div class="follow-us">
                        <p>Connect With Us On</p>
                        <div class="social-media-images">
                            <a href="https://www.facebook.com/apple"><img src="../images/logos/facebookLogo.png" alt=""></a>
                            <a href="https://www.twitter.com/apple"><img src="../images/logos/twitterLogo.png" alt=""></a>
                            <a href="https://www.instagram.com/apple"><img src="../images/logos/instagramLogo.png" alt=""></a>

                        </div>
                    </div>
                </div>

            </div>  


    </body>
</html>
