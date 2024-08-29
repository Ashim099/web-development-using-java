

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addProduct.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
    </head>


    <%
        if ((String) request.getAttribute("errorAdding") != null) {
            out.println(request.getAttribute("errorAdding"));
        } else if ((String) request.getAttribute("addMessage") != null) {
            out.println(request.getAttribute("addMessage"));
        } else if ((String) request.getAttribute("errorMessage") != null) {
            out.println(request.getAttribute("errorMessage"));
        }

    %>

    <body>
        <div class="nav-bar">
            <div class="nav-bar-wrapper">
                <div class="logo">

                    <img src="${pageContext.request.contextPath}/image/logo/lugaPasalLogo.png" alt="">

                </div>
                <div class="menu-wrapper">
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/admin/adminPanel.jsp">Admin Panel</a>

                    </div>
                </div>
            </div>
        </div>

        <hr> 

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productId">Product Id:</label>
                    <input type="text" name="productId" id="productId" placeholder="Enter product id" required>
                </div>
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" name="productName" id="productName" placeholder="Enter product name" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" name="description" id="description" placeholder="Say something about product" required>
                </div>
                <div class="form-group">
                    <label for="stock">Stock:</label>
                    <input type="number" name="stock" id="stock" placeholder="Enter stock" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" name="price" id="price" placeholder="Enter price" required>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select name="category">
                        <option>Console</option>
                        <option>Gaming Gadget</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="rating">Rating:</label>
                    <select name="rating">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="image">Product Picture:</label>
                    <input type="file" id="image" name="image">
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>
