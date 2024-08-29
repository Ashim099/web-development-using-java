
<%@page import="coursework.model.entity.Product"%>
<%@page import="coursework.model.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
    </head>
    <body>
        <h1> In edit product </h1>

        <%

            ProductDAO productDAO = new ProductDAO();
            String productId = request.getParameter("productId");
            Product product = productDAO.getById(productId);

            
        %>

        <form action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data">

            <label for="productId">Product Id: </label>
            <input type="text" name="productId" id="productId" value ="<%=product.getProductId()%>" required>



            <label for="productName">Product Name: </label>
            <input type="text" name="productName" id="productName"  value="<%=product.getProductName()%>" required>

            <label for="price">Description </label>
            <input type="text" name="description" id="description" value ="<%=product.getDescription()%>" required>


            <label for="stock">Stock: </label>
            <input type="number" name="stock" id="stock" value ="<%=product.getStock()%>" required>


           
            <label for="price">Price: </label>
            <input type="number" name="price" id="price" value ="<%=product.getPrice()%>" required>



            <label for="category">Category: </label>
            <select name="category">
                <option <% if (product.getCategory().equalsIgnoreCase("male")) { %>selected<% } %> >Male</option>
                <option <% if (product.getCategory().equalsIgnoreCase("female")) { %>selected<% } %> >Female </option>
            </select>

            <label for="rating">Rating: </label>
            <select name="rating" >
                <option  <% if (product.getRating() == 1) { %>selected<% } %>>1</option>
                <option  <% if (product.getRating() == 2) { %>selected<% } %>>2</option>
                <option  <% if (product.getRating() == 3) { %>selected<% } %>>3</option>
                <option  <% if (product.getRating() == 4) { %>selected<% } %>>4</option>
                <option  <% if (product.getRating() == 5) { %>selected<% }%>>5</option>
            </select>



            <label for="image">Product Picture: </label>
            <img src="../../image/productPic/<%=product.getImageUrlFromPart()%>">
            <input type="file" id="image" name="image" >
         
            <button type="submit">Edit</button>


        </form>


    </body>
</html>
