package Controller.signinlogoutoperation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DataBaseConnection.DataBaseConnection;
import Controller.PassEncryption.EncDyc;
import Model.User.Query;
import Model.User.User;
import Model.User.UserMessage;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServ() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printOut = response.getWriter();
        String Email = request.getParameter("Email");
        String Password = request.getParameter("Password");
        String encryptedpassword = "";

        try {
            encryptedpassword = EncDyc.encryption(Password, "my-Secret-Key-hi");
        } catch (Exception e1) {
            e1.printStackTrace();
        }

        // Check admin credentials in the database
        Query query;
        try {
            query = new Query(DataBaseConnection.connection());
            User admin = query.checkAdminCredentials(Email, encryptedpassword);

            if (admin != null) {
                // Admin login successful
                HttpSession session = request.getSession();
                session.setAttribute("User", admin);
                session.setAttribute("Email", Email);
                session.setMaxInactiveInterval(30 * 60);
                Cookie cookie = new Cookie("email", admin.getEmail());
                response.addCookie(cookie);
                admin.setEmail(Email);
                printOut.println(Email);
                response.sendRedirect(request.getContextPath() + "/pages/admin-home.jsp");
            } else {
                // Admin login failed, check regular user credentials
                User user = query.Login(Email, encryptedpassword);

                if (user == null) {
                    UserMessage msg = new UserMessage("Invalid LoginServ Please Try again!", "LoginServ Error", "invalid-login");
                    HttpSession session = request.getSession();
                    session.setAttribute("Message", msg);
                    response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("User", user);
                    session.setAttribute("name", user.getFirstName());
                    session.setMaxInactiveInterval(30 * 60);
                    printOut.println(user.getEmail());
                    user.setEmail(Email);
                    Cookie cookie = new Cookie("email", user.getEmail());
                    response.addCookie(cookie);
                    printOut.println(user.getProfilePicture());
                    response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}