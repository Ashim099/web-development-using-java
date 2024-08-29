<%@page import="coursework.model.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coursework.model.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sortBy.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userPanelProductList.css"/>
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
                        <a href="${pageContext.request.contextPath}/user/userPanel.jsp">Home</a>
                        <a href="editProfile.jsp?username=<%=session.getAttribute("user")%>">Edit Profile</a>
                        <a href="viewCart.jsp?username=<%=session.getAttribute("user")%>">Show Cart</a>
                        <a href="changePassword.jsp?username=<%=session.getAttribute("user")%>">Change Password</a>

                        <form method="get" action="logout">
                            <button type="submit" class="logout-button" style="background-color: #111">Logout</button>
                        </form>
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
                        <option selected value="default">Default</option>
                        <option value="price" >Price</option>
                        <option value="category">Category</option>
                        <option value="rating">Rating</option>
                    </select>
                    <button type="submit">Sort </button>
                </form>
        
                <form method="get">
                    Product Name: <input type="text" name="productName" required>
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
                    <div class="container">
                    <div class="product-details">
                        <h3>${product.getProductName()}</h3>
                        <p>Description : ${product.getDescription()}</p>
                        <p>Rating : ${product.getRating()}</p>
                        <div class="price-stock">
                            <p class="price">Price: $${product.getPrice()}</p>
                            <p class="stock">${product.getStock()} in stock</p>

                        </div>
                        <form method="post" action="addToCart">
                            <input type="hidden" name="username" value="<%=session.getAttribute("user")%>">
                            <input type="hidden" name="productId" value="${product.getProductId()}">
                            <input type="number" name="quantity" min="1" max="10" value="1">
                            <button type="submit">Add to Cart</button>
                        </form>
                    </div>
                     </div>
                </div>
            </c:forEach>
        </div>


        
            





    </body>
</html>
