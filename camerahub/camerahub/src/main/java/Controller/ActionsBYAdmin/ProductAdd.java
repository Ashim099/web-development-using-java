package Controller.ActionsBYAdmin;

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
import javax.servlet.http.Part;
import Controller.DataBaseConnection.DataBaseConnection;
import Model.Product.product;
import Model.Product.productQuery;

/** 
 * Servlet implementation class productC
 */
@MultipartConfig
@WebServlet("/ProductAdd")
public class ProductAdd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAdd() {
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
        String productName=request.getParameter("product_name");
        String productCategory = request.getParameter("product_category");
        String productBrand=request.getParameter("brand_name");
        String productPrice = request.getParameter("product_price");
        int stockLeft = Integer.parseInt (request.getParameter ("stockLeft"));
        Part picture=request.getPart("product_image");
        String pictureName=picture.getSubmittedFileName();
        String pictureURL = "C:\\Users\\user\\eclipse-workspace\\camerahub\\src\\main\\webapp\\images\\product-images\\" + pictureName;
        
        try {
            FileOutputStream fos=new FileOutputStream(pictureURL);
            InputStream is=picture.getInputStream();
            byte[] data=new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        product p = new product(productName, productCategory, productBrand, productPrice, pictureName, stockLeft);
        productQuery pq;
        
        try {
            pq = new productQuery(DataBaseConnection.connection());
            pq.addProduct(p);
            response.sendRedirect(request.getContextPath()+"/pages/adminPanel.jsp");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}