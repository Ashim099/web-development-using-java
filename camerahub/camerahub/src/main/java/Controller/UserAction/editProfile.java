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

import Controller.DataBaseConnection.*;
import Controller.PassEncryption.EncDyc;
import Model.User.*;

/**
 * Servlet implementation class editProfile
 */
@MultipartConfig
@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
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
		Part picture=request.getPart("ProfilePicture");
		String pictureName=picture.getSubmittedFileName();
		String pictureURL="C:\\Users\\user\\eclipse-workspace\\camerahub\\src\\main\\webapp\\images\\UserProfile"+pictureName;
		try {
			FileOutputStream fos=new FileOutputStream(pictureURL);
			InputStream is=picture.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		Query user;
		try {
			user = new Query(DataBaseConnection.connection());
			HttpSession session = request.getSession();
			String FirstName="";
			String Password="";
			String Contact="";
			User u = (User) session.getAttribute("User");
			FirstName=request.getParameter("FirstName");
			Password=request.getParameter("Password");
			
			Contact=request.getParameter("Contact"); 
			String encryptedpassword="";
			try {
				encryptedpassword=EncDyc.encryption(Password, "my-Secret-Key-hi");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(Password.equals("")) {
				encryptedpassword=u.getPassword();
			}
			else {
				encryptedpassword=encryptedpassword;
			}
			if(encryptedpassword.equals("")) {
				printOut.println("Yess NUll");
			}
			else {
				printOut.println("Not Null");
			}
			if(Contact.equals("")) {
				Contact=u.getContact();
			}
			if(FirstName.equals("")) {
				FirstName=u.getFirstName();
			}
			if(Contact.equals("")) {
				Contact=u.getContact();
			}
			printOut.println("Name"+u.getFirstName());
			if(pictureName=="") {
				pictureName=u.getProfilePicture();
			}
			user.change(pictureName,FirstName,encryptedpassword,Contact,u.getEmail());
			u.setContact(Contact);
			u.setFirstName(FirstName);
			u.setProfilePicture(pictureURL);
			u.setPassword(encryptedpassword);
			u.setProfilePicture(pictureName);
			session.setAttribute("User", u);
			response.sendRedirect(request.getContextPath()+"/pages/home.jsp");
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		
	}
}