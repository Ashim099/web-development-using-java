<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginPanel.css"/>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css"/>
    </head>
    <body>
        
        
<!--        for login error         -->
        <%
            
            if((String)request.getAttribute("errorMessage")!=null){
                out.println(request.getAttribute("errorMessage"));
            }

        %>
        
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

        

  <div class="login-container">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/login" method="post" class="login-form">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
      
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
        <center> <p>New User? <a href="${pageContext.request.contextPath}/pages/register.jsp">Sign up</a></p></center>
              
      <button type="submit">Login</button>
    </form>

        

      
        
      
    </body>
</html>
