
<%@page import="coursework.model.entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coursework.model.dao.UserDAO"%>
<%@page import="coursework.model.dao.CartDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Cart</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <%
            
       
        out.println("order list by client");
        String userName = request.getParameter("username");
        CartDAO cartDAO = new CartDAO();
        UserDAO userDAO = new UserDAO();
        if (userDAO.isUserAlreadyRegistered(userName)) {
            ArrayList<Cart> userCart = cartDAO.getOrderByUser(userName);
            }
            %>
    </body>
</html>
