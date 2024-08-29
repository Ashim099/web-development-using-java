
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/changePassword.css"/>
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

    <center>
        <h1>Change password!</h1>
    </center> 
    <%
        session.setAttribute("username", request.getParameter("username"));
    %>

    <div class="password-form">
        <form action="${pageContext.request.contextPath}/changePassword" method="post">
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>

            <div class="form-group">
                <label for="confirmNewPassword">Confirm New Password:</label>
                <input type="password" id="confirmNewPassword" name="confirmNewPassword" required>
            </div>

            <div class="form-group">
                <button type="submit">Change Password</button>
            </div>
        </form>
    </div>
</body>
</html>
