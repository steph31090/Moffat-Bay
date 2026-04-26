/* Alpha Team
 * Created by: Reed Bunnell
 */

package model;

import java.sql.*;
import java.util.ArrayList;

public class AboutUsBean {

    private String title;
    private String content;

    public AboutUsBean() {}

    public AboutUsBean(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public String getTitle() { return title; }
    public String getContent() { return content; }

    public static ArrayList<AboutUsBean> getAboutInfo() {
        ArrayList<AboutUsBean> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/moffatbay", // corrected
                "alpha",
                "Team" // corrected password
            );

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM about_us");

            while (rs.next()) {
                list.add(new AboutUsBean(
                    rs.getString("title"),
                    rs.getString("content")
                ));
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}