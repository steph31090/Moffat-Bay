/* Alpha Team
 * Created by: Slyvester Brandon
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

    // ─────────────────────────────────────────────
    // Get all available rooms from RoomSelection table
    // Returns a list of RoomBeans for display on reservation.jsp
    // ─────────────────────────────────────────────
    public List<RoomBean> getRooms() {
        List<RoomBean> rooms = new ArrayList<>();
        String sql = "SELECT room_types_id, room_name, room_price, max_guests FROM Room_Types ORDER BY room_price ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                RoomBean room = new RoomBean();
                room.setRoomId(rs.getInt("room_types_id"));
                room.setRoomType(rs.getString("room_name"));
                room.setNightlyRate(rs.getDouble("room_price"));
                room.setMaxGuests(rs.getInt("max_guests"));
                rooms.add(room);
            }

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }

        return rooms;
    }

    // ─────────────────────────────────────────────
    // Look up a customer's ID using their email
    // Used when confirming a reservation
    // ─────────────────────────────────────────────
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

    // ─────────────────────────────────────────────
    // Save a confirmed reservation to the database
    // Returns the generated reservationId
    // ─────────────────────────────────────────────
    public int saveReservation(ReservationBean reservation) {
    	String sql = "INSERT INTO Reservations (customer_id, status, room_types_id, guest_count, checkIn_date, checkOut_date, total_price) "
    	           + "VALUES (?, 'Confirmed', ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        	pstmt.setInt(1, reservation.getCustomerId());
        	pstmt.setInt(2, reservation.getRoomId());
        	pstmt.setInt(3, reservation.getNumGuests());
        	pstmt.setDate(4, java.sql.Date.valueOf(reservation.getCheckIn()));
        	pstmt.setDate(5, java.sql.Date.valueOf(reservation.getCheckOut()));
        	pstmt.setDouble(6, reservation.getTotalCost());

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

    // ─────────────────────────────────────────────
    // ─────────────────────────────────────────────
    // Look up a reservation by reservation ID and last name
    // Returns a ReservationBean with guest name, or null if not found
    // ─────────────────────────────────────────────
    public ReservationBean lookupReservation(int reservationId, String lastName) {
        String sql = "SELECT r.reservation_id, r.status, r.room_types_id, rt.room_name, rt.room_price, "
                   + "r.guest_count, r.checkIn_date, r.checkOut_date, r.total_price, "
                   + "c.first_name, c.last_name "
                   + "FROM Reservations r "
                   + "JOIN Customer c ON r.customer_id = c.customer_id "
                   + "JOIN Room_Types rt ON r.room_types_id = rt.room_types_id "
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
                    res.setRoomId(rs.getInt("room_types_id"));
                    res.setRoomType(rs.getString("room_name"));
                    res.setNightlyRate(rs.getDouble("room_price"));
                    res.setNumGuests(rs.getInt("guest_count"));
                    res.setCheckIn(rs.getString("checkIn_date"));
                    res.setCheckOut(rs.getString("checkOut_date"));
                    res.setTotalCost(rs.getDouble("total_price"));
                    res.setFirstName(rs.getString("first_name"));
                    res.setLastName(rs.getString("last_name"));
                    return res;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("DB ERROR: " + e.getMessage(), e);
        }

        return null;
    }
}
