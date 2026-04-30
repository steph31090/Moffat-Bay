/* Alpha Team
 * Created by: Sylvester Brandon
 */

package beans;

public class ReservationBean {

    // Matches reservations table columns exactly
    private int    reservationId;   // reservation_id
    private int    customerId;      // customer_id
    private String status;          // status
    private int    roomTypesId;     // room_types_id
    private int    guestCount;      // guest_count
    private String checkInDate;     // checkIn_date
    private String checkOutDate;    // checkOut_date
    private double totalPrice;      // total_price

    // Extra fields for display purposes (not in reservations table)
    private String roomName;        // from room_types.room_name
    private double roomPrice;       // from room_types.room_price
    private long   totalNights;     // calculated
    private double subtotal;        // calculated
    private double tax;             // calculated

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRoomTypesId() {
        return roomTypesId;
    }

    public void setRoomTypesId(int roomTypesId) {
        this.roomTypesId = roomTypesId;
    }

    public int getGuestCount() {
        return guestCount;
    }

    public void setGuestCount(int guestCount) {
        this.guestCount = guestCount;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public long getTotalNights() {
        return totalNights;
    }

    public void setTotalNights(long totalNights) {
        this.totalNights = totalNights;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }


    private String firstName;
    private String lastName;

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

}