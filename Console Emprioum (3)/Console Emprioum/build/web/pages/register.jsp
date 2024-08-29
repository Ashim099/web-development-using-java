

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css"/>
    </head>

    <!--    for register message-->

    <%
        if ((String) request.getAttribute("registerMessage") != null) {
            out.println(request.getAttribute("registerMessage"));
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
                        <a href="${pageContext.request.contextPath}/home.jsp">Home</a>
                        <a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>

                    </div>
                </div>
            </div>
        </div>

        <hr>
    <center><h1>Register</h1></center>
        <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data" >

            <label for="firstname">First Name :</label>
            <input type="text" name="firstname" id="name" placeholder="Enter Your First Name" required>


            <label for="lastname">Last Name :</label>
            <input type="text" name="lastname" id="address" placeholder="Enter Your Last Name" required>

            <label for="confirm_password">Address :</label>
            <input type="text" name="address" id="address" placeholder="Address " required>



            <label for="username">Username:</label>
            <input type="text" name="username" id="username" placeholder="Enter Your Username" required>


            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Enter Your Password" required>

            <label for="role">Role: </label>
            <select name="role">
                <option>Admin</option>
                <option>User</option>
            </select>


            <label for="image">Profile Picture</label>
            <input type="file" id="image" name="image">



            <button type="submit" name="signup">Sign Up</button>
            <p>Already have an account? <a href="${pageContext.request.contextPath}/pages/login.jsp">Log in</a></p>

        </form>
    </body>
</html>
