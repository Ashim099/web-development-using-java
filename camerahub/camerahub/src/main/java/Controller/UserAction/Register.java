package Controller.UserAction;

import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Controller.DataBaseConnection.DataBaseConnection;
import Controller.PassEncryption.EncDyc;
import Model.User.Query;
import Model.User.User;
import Model.User.UserMessage;


/**
 * Servlet implementation class Register
 */
@MultipartConfig
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter printOut=response.getWriter();
		String FirstName=request.getParameter("FirstName");  
		String LastName=request.getParameter("LastName");
		String Contact=request.getParameter("Contact"); 
		String Email=request.getParameter("Email"); 
		String Password=request.getParameter("Password");
		Part ProfilePicture=request.getPart("ProfilePicture");
		String pictureName=ProfilePicture.getSubmittedFileName();
		String encryptedpassword="";
		String pictureURL = "C:\\Users\\user\\eclipse-workspace\\camerahub\\src\\main\\webapp\\images\\UserProfile\\" + pictureName;
		try {
			FileOutputStream fos=new FileOutputStream(pictureURL);
			InputStream is=ProfilePicture.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		try {
			encryptedpassword=EncDyc.encryption(Password, "my-Secret-Key-hi");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		User customer=new User(FirstName,LastName,Contact,Email,encryptedpassword,pictureName);
		Query user;
		try {
			user = new Query(DataBaseConnection.connection());
			if(user.check(customer)) {
				HttpSession session=request.getSession();
				UserMessage msg=new UserMessage("Email already in use. Please use another email","Register Error","Invalid-Register");
				session.setAttribute("Message", msg);
				response.sendRedirect(request.getContextPath()+"/pages/register.jsp");
			}
			
			else {
				if(user.register(customer)) {
					
					response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
					
				}
				else {
					printOut.println("Registration Failed");
				}
			}
		} catch (ClassNotFoundException | SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
	}

}
