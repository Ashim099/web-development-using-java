package Model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class productQuery {
	private Connection con;
	public productQuery(Connection con) {
		this.con=con;
	}
	public boolean addProduct(product product) {
		boolean f=false;
		try {
			// Register into Database
			
			String query="INSERT INTO product(productName, productCategory,productBrand, productPrice, productImage, stockLeft) VALUES (?,?,?,?,?,?)";
			PreparedStatement st=this.con.prepareStatement(query);
			st.setString(1,product.getProductName());
			st.setString(2,product.getProductCategory());
			st.setString(3,product.getProductBrand());
			st.setString(4,product.getProductPrice());
			st.setString(5,product.getProductImage());
			st.setInt(6,product.getStockLeft());
			st.executeUpdate();
			f=true;
		}
		catch(Exception e){
			
		}
		return f;
	}
	public void deleteProduct(int id) {
		try {
			String query1="DELETE FROM product WHERE id=?";
			PreparedStatement st=this.con.prepareStatement(query1);
			st.setInt(1,  id);
			st.executeUpdate();
		}
		catch(Exception e){
			
		}
	
	}
	public void editProduct(String productName, String productCategory, String productBrand, String productPrice, String productImage, int stockLeft, int id) {
			String query2="update product set productName=?, productCategory=?,productBrand=?,productPrice=?,productImage=?, stockLeft=? WHERE id=?";
			try {
				PreparedStatement st=this.con.prepareStatement(query2);
				st.setString(1, productName);
				st.setString(2, productCategory);
				st.setString(3, productBrand);
				st.setString(4, productPrice);
				st.setString(5, productImage);
				st.setInt(6,stockLeft);
				st.setInt(7,id);
				st.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
	}
	

	public boolean addOrder(int id, String name,String userEmail, String date) {
		boolean f=false;
		String query="INSERT INTO `order` (id, UserName , UserEmail, Date) VALUES (?,?,?,?)";
		try {
			PreparedStatement st=this.con.prepareStatement(query);
			st.setInt(1,id);
			st.setString(2, name);
			st.setString(3, userEmail);
			st.setString(4,date);
			st.executeUpdate();
			f=true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}

}
