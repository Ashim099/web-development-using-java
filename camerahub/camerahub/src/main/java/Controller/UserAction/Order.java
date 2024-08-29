package Controller.UserAction;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DataBaseConnection.DataBaseConnection;
import Model.Product.productQuery;
import Model.User.User;
import Model.User.UserMessage;



/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
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
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("User");
		@SuppressWarnings("unchecked")
		ArrayList<String> cart=(ArrayList<String>)session.getAttribute("cart");
		
		if(cart==null || cart.isEmpty()) {
			UserMessage msg=new UserMessage(" is Empty Please Add products!","Cart is Empty","invalid-login");
			session.setAttribute("Message", msg);
			response.sendRedirect(request.getContextPath()+"/pages/cart.jsp");
			
		}
		else {
			for (String product : cart) {
				try {
					LocalDate currentDate1 = LocalDate.now();
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					String currentDateAsString = currentDate1.format(formatter);
					 int id = Integer.parseInt(product);
					productQuery pq =new productQuery(DataBaseConnection.connection());
					printOut.println(currentDate1);
					printOut.println(u.getEmail());
					String Email=u.getEmail();
					String Name=u.getFirstName();
					pq.addOrder(id,Name,Email,currentDateAsString);
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			cart.clear();
			response.sendRedirect(request.getContextPath()+"/pages/cart.jsp");
			
		}

	}

}

