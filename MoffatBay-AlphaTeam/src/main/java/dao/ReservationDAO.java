/* Alpha Team
 * Created by: Sylvester Brandon
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.ReservationBean;
import beans.RoomBean;
import db.DBConnection;

public class ReservationDAO {

    // -----------------------------------------
    // Get all available rooms from room_types table
    // Returns a list of RoomBeans for display on reservation.jsp
    // -----------------------------------------
    public List<RoomBean> getRooms() {
        List<RoomBean> rooms = new ArrayList<>();
        String sql = "SELECT room_types_id, room_name, room_price FROM room_types ORDER BY room_price ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                RoomBean room = new RoomBean();
                room.setRoomId(rs.getInt("room_types_id"));
                room.setRoomType(rs.getString("room_name"));
                room.setNightlyRate(rs.getDouble("room_price"));
                rooms.add(room);
            }

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }

        return rooms;
    }

    // -----------------------------------------
    // Look up a customer's ID using their email
    // -----------------------------------------
    public int getCustomerId(String email) {
        String sql = "SELECT customer_id FROM customer WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("customer_id");
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }

        return -1;
    }

    // -----------------------------------------
    // Save a confirmed reservation to the database
    // Returns the generated reservation_id
    // 6 placeholders: customer_id, room_types_id,
    // guest_count, checkin_date, checkout_date, total_price
    // status is hardcoded as 'Confirmed'
    // -----------------------------------------
    public int saveReservation(ReservationBean reservation) {
        String sql = "INSERT INTO reservations (customer_id, status, room_types_id, guest_count, checkin_date, checkout_date, total_price) "
                   + "VALUES (?, 'Confirmed', ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1,    reservation.getCustomerId());
            pstmt.setInt(2,    reservation.getRoomTypesId());
            pstmt.setInt(3,    reservation.getGuestCount());
            pstmt.setDate(4,   java.sql.Date.valueOf(reservation.getCheckInDate()));
            pstmt.setDate(5,   java.sql.Date.valueOf(reservation.getCheckOutDate()));
            pstmt.setDouble(6, reservation.getTotalPrice());

            pstmt.executeUpdate();

            try (ResultSet keys = pstmt.getGeneratedKeys()) {
                if (keys.next()) {
                    return keys.getInt(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }

        return -1;
    }

    // -----------------------------------------
    // Look up a reservation by reservation ID and last name
    // Returns a ReservationBean or null if not found
    // -----------------------------------------
    public ReservationBean lookupReservation(int reservationId, String lastName) {
        String sql = "SELECT r.reservation_id, r.status, r.room_types_id, rt.room_name, rt.room_price, "
                   + "r.guest_count, r.checkin_date, r.checkout_date, r.total_price, "
                   + "c.first_name, c.last_name "
                   + "FROM reservations r "
                   + "JOIN customer c ON r.customer_id = c.customer_id "
                   + "JOIN room_types rt ON r.room_types_id = rt.room_types_id "
                   + "WHERE r.reservation_id = ? AND LOWER(c.last_name) = LOWER(?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, reservationId);
            pstmt.setString(2, lastName);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    ReservationBean res = new ReservationBean();
                    res.setReservationId(rs.getInt("reservation_id"));
                    res.setStatus(rs.getString("status"));
                    res.setRoomTypesId(rs.getInt("room_types_id"));
                    res.setRoomName(rs.getString("room_name"));
                    res.setRoomPrice(rs.getDouble("room_price"));
                    res.setGuestCount(rs.getInt("guest_count"));
                    res.setCheckInDate(rs.getString("checkin_date"));
                    res.setCheckOutDate(rs.getString("checkout_date"));
                    res.setTotalPrice(rs.getDouble("total_price"));
                    return res;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }

        return null;
    }
}