

<%@page import="coursework.model.entity.User"%>
<%@page import="coursework.model.dao.UserDAO"%>
<%@page import="coursework.model.entity.Product"%>
<%@page import="coursework.model.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editProfile.css"/>       
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
    </head>
    <body>
        
           <%

            UserDAO userDAO = new UserDAO();
            User user = userDAO.getById(request.getParameter("username"));

        %>

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

        <h1>Change user profile</h1>
     




        <div class="profile-container">
            <div class="profile-picture">
                <img src="${pageContext.request.contextPath}/image/profilePic/<%=user.getImageUrlFromPart()%>" alt="Profile Picture" class="profile-image">
                <br>
                
                <p> Profile Picture </p>
            </div>
            <div class="profile-form">
                <form action="${pageContext.request.contextPath}/editProfile" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="firstname">First Name:</label>
                        <input type="text" name="firstname" id="firstname" placeholder="First Name" value="<%=user.getFirstName()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="lastname">Last Name:</label>
                        <input type="text" name="lastname" id="lastname" placeholder="Last Name" value="<%=user.getLastName()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" name="address" id="address" placeholder="Address" value="<%=user.getAddress()%>" required>
                    </div>

                    <input type="text" name="username" id="username" value="<%=user.getUsername()%>" style="display: none">

                    <div class="form-group">
                        <label for="image">Profile Picture</label>
                        <input type="file" id="image" name="image">
                    </div>

                    <button type="submit" >Edit</button>
                </form>
            </div>
        </div>


    </body>
</html>
