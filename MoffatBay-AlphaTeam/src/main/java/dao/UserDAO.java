/* Alpha Team
 * Created by: Stephanie Lara
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.UserBean;
import db.DBConnection;

public class UserDAO {

    public boolean registerUser(UserBean user) {
        String sql = "INSERT INTO customer (first_name, last_name, email, phone_number, password_hash) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getPasswordHash());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }
    }

	public boolean validateUser(String email, String passwordHash) {
	    String sql = "SELECT * FROM customer WHERE email = ? AND password_hash = ?";
	
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	
	        pstmt.setString(1, email);
	        pstmt.setString(2, passwordHash);
	
	        return pstmt.executeQuery().next();
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}	