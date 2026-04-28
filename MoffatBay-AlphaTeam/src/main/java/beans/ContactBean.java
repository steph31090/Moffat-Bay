package beans;

import java.sql.*;

public class ContactBean {

    private String name;
    private String email;
    private String message;

    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setMessage(String message) { this.message = message; }

    public boolean saveMessage() {
        boolean success = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/moffatbay",
                "alpha",
                "password"
            );

            String sql = "INSERT INTO contact_us (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            int rows = ps.executeUpdate();
            if (rows > 0) success = true;

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}