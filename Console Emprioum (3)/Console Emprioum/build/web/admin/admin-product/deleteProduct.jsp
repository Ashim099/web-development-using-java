

<%@page import="coursework.model.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
    </head>
    <body>
        <h1>Delete product</h1>
        <%

            ProductDAO productDAO = new ProductDAO();

            int result = productDAO.delete(request.getParameter("productId"));

            if (result == 1) {
                session.setAttribute("messageDeleteProduct", "deleted sucessfully");
                response.sendRedirect("adminShowAllProduct.jsp");
            } else if (result == -2) {
                out.println("cannot delete the product is in user cart");
                session.setAttribute("messageDeleteProduct", "cannot delete the product is in user cart");
            } else {
             session.setAttribute("messageDeleteProduct", "An error occoured while deleting");
                out.println("An error occoured");
            }

        %>
    </body>
</html>
