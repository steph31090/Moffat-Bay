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
        String sql = "SELECT roomId, roomType, nightlyRate, maxGuests FROM roomselection ORDER BY nightlyRate ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                RoomBean room = new RoomBean();
                room.setRoomId(rs.getInt("roomId"));
                room.setRoomType(rs.getString("roomType"));
                room.setNightlyRate(rs.getDouble("nightlyRate"));
                room.setMaxGuests(rs.getInt("maxGuests"));
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
        String sql = "SELECT customerId FROM customer WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("customerId");
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
        String sql = "INSERT INTO reservation (customerId, roomId, numGuests, checkIn, checkOut, totalNights, totalCost, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, 'confirmed')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, reservation.getCustomerId());
            pstmt.setInt(2, reservation.getRoomId());
            pstmt.setInt(3, reservation.getNumGuests());
            pstmt.setDate(4, java.sql.Date.valueOf(reservation.getCheckIn()));
            pstmt.setDate(5, java.sql.Date.valueOf(reservation.getCheckOut()));
            pstmt.setLong(6, reservation.getTotalNights());
            pstmt.setDouble(7, reservation.getTotalCost());

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
}