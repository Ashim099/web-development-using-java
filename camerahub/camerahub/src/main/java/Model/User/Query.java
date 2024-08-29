package Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Query {
    private Connection con;

    public Query(Connection con) {
        this.con = con;
    }



    public boolean check(User user) throws SQLException {
        String query2 = "SELECT Email FROM customer WHERE Email=?";
        PreparedStatement st = this.con.prepareStatement(query2);
        st.setString(1, user.getEmail());
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return true;
        }
        return false;
    }

    public User Login(String email, String password) {
        User user = null;
        try {
            String query3 = "SELECT * FROM customer WHERE Email=? and Password=?";
            PreparedStatement st = this.con.prepareStatement(query3);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                System.out.println(user);
                user = new User();
                // This data is from database
                String name = rs.getString("FirstName");
                user.setFirstName(name);
                String picture = rs.getString("ProfilePicture");
                user.setProfilePicture(picture);
                email = rs.getString("Email");
                user.setEmail(email);
                password = rs.getString("Password");
                user.setPassword(password);
                String contact = rs.getString("Contact");
                user.setContact(contact);
            }
        } catch (Exception e) {
        }
        return user;
    }

    public void change(String ProfilePicture, String name, String password, String contact, String email) throws SQLException {
        String query4 = "update customer set ProfilePicture=?,FirstName=?,Password=?,Contact=? WHERE Email=?";
        try {
            PreparedStatement st = this.con.prepareStatement(query4);
            st.setString(1, ProfilePicture);
            st.setString(2, name);
            st.setString(3, password);
            st.setString(4, contact);
            st.setString(5, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User checkAdminCredentials(String email, String encryptedPassword) throws SQLException {
        String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
        try (PreparedStatement statement = this.con.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, encryptedPassword);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                User admin = new User();
                admin.setEmail(resultSet.getString("email"));
                admin.setFirstName(resultSet.getString("username"));
                // Set other admin properties if necessary
                return admin;
            }
        }
        return null;
    }
    
    // Register Query
    public boolean register(User user) {
        boolean f = false;
        try {
            // Register into Database
            String query = "INSERT INTO customer(FirstName, LastName, Contact, Email, Password, ProfilePicture) VALUES (?,?,?,?,?,?)";
            PreparedStatement st = this.con.prepareStatement(query);
            st.setString(1, user.getFirstName());
            st.setString(2, user.getLastName());
            st.setString(3, user.getContact());
            st.setString(4, user.getEmail());
            st.setString(5, user.getPassword());
            st.setString(6, user.getProfilePicture());
            st.executeUpdate();
            f = true;
        } catch (Exception e) {
        }
        return f;
    }
}