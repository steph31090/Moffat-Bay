/* Alpha Team
 * Created by: Sylvester Brandon
 */

package beans;
 
public class RoomBean {
 
    private int    roomId;       // room_types_id
    private String roomType;     // room_name
    private double nightlyRate;  // room_price
 
    public int getRoomId() {
        return roomId;
    }
 
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
 
    public String getRoomType() {
        return roomType;
    }
 
    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
 
    public double getNightlyRate() {
        return nightlyRate;
    }
 
    public void setNightlyRate(double nightlyRate) {
        this.nightlyRate = nightlyRate;
    }
}
 