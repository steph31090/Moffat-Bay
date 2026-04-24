<%@ page import="dao.ReservationDAO" %>
<%@ page import="beans.RoomBean" %>
<%@ page import="java.util.List" %>

<%
    // ─────────────────────────────────────────────
    // AUTH GUARD — redirect to login if not signed in
    // ─────────────────────────────────────────────
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/account/login.jsp");
        return;
    }

    String errorMessage = "";

    // ─────────────────────────────────────────────
    // POST — user submitted the reservation form
    // Validate input, build a draft, save to session
    // ─────────────────────────────────────────────
    if (request.getMethod().equalsIgnoreCase("post")) {

        String roomIdStr = request.getParameter("roomId");
        String roomType  = request.getParameter("roomType");
        String rateStr   = request.getParameter("nightlyRate");
        String checkIn   = request.getParameter("checkIn");
        String checkOut  = request.getParameter("checkOut");
        String guestsStr = request.getParameter("numGuests");
        String maxStr    = request.getParameter("maxGuests");

        // Validate all fields are present
        if (roomIdStr == null || checkIn.isEmpty() || checkOut.isEmpty() || guestsStr == null) {
            errorMessage = "All fields are required. Please try again.";
        } else {

            // Calculate nights
            long inMillis  = java.sql.Date.valueOf(checkIn).getTime();
            long outMillis = java.sql.Date.valueOf(checkOut).getTime();
            long nights    = (outMillis - inMillis) / (1000 * 60 * 60 * 24);

            if (nights <= 0) {
                errorMessage = "Check-out date must be after check-in date.";
            } else {

                int guests    = Integer.parseInt(guestsStr);
                int maxGuests = Integer.parseInt(maxStr);

                if (guests > maxGuests) {
                    errorMessage = "This room holds a maximum of " + maxGuests + " guest(s).";
                } else {

                    // Calculate costs
                    double nightlyRate = Double.parseDouble(rateStr);
                    double subtotal    = nightlyRate * nights;
                    double tax         = subtotal * 0.12;
                    double totalCost   = subtotal + tax;

                    // Build ReservationBean and save as draft in session
                    beans.ReservationBean draft = new beans.ReservationBean();
                    draft.setRoomId(Integer.parseInt(roomIdStr));
                    draft.setRoomType(roomType);
                    draft.setNightlyRate(nightlyRate);
                    draft.setCheckIn(checkIn);
                    draft.setCheckOut(checkOut);
                    draft.setNumGuests(guests);
                    draft.setTotalNights(nights);
                    draft.setSubtotal(subtotal);
                    draft.setTax(tax);
                    draft.setTotalCost(totalCost);

                    session.setAttribute("reservation_draft", draft);

                    response.sendRedirect(request.getContextPath() + "/reservation_summary.jsp");
                    return;
                }
            }
        }
    }

    // ─────────────────────────────────────────────
    // GET — load rooms from database for display
    // ─────────────────────────────────────────────
    ReservationDAO dao = new ReservationDAO();
    List<RoomBean> rooms = dao.getRooms();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay - Book a Reservation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="reservation-page" style="background-color: #f2f2f2; padding-top: 80px;">

<!--Header Insert!-->
<jsp:include page="components/header.jsp" />

<div class="container" style="margin-top: 30px;">
    <div class="register-container" style="max-width: 600px; margin: 0 auto; text-align: center; padding: 40px 50px;">

    <h1>Book a Reservation</h1>

    <% if (!errorMessage.isEmpty()) { %>
        <script>alert("<%= errorMessage %>");</script>
    <% } %>

    <form action="reservation.jsp" method="post">

        <label>Select a Room:</label>
        <select name="roomId" id="roomSelect" required onchange="updateRoomDetails(this)"style="width: 100%;">
            <option value="" disabled selected>-- Choose a room --</option>
            <% for (RoomBean room : rooms) { %>
                <option value="<%= room.getRoomId()%>"
                        data-type="<%= room.getRoomType() %>"
                        data-rate="<%= room.getNightlyRate() %>"
                        data-max="<%= room.getMaxGuests() %>">
                    <%= room.getRoomType() %> - $<%= String.format("%.2f", room.getNightlyRate()) %>/night (up to <%= room.getMaxGuests() %> guests)
                </option>
            <% } %>
        </select>

        <%-- Hidden fields populated by JavaScript when a room is selected --%>
        <input type="hidden" name="roomType"    id="roomType"    value="" />
        <input type="hidden" name="nightlyRate" id="nightlyRate" value="" />
        <input type="hidden" name="maxGuests"   id="maxGuests"   value="" />

        <label>Check-In Date:</label>
        <input type="date" name="checkIn" id="checkIn" required>

        <label>Check-Out Date:</label>
        <input type="date" name="checkOut" id="checkOut" required>

        <label>Number of Guests:</label>
        <select name="numGuests" required>
            <option value="" disabled selected>-- Select guests --</option>
            <option value="1">1 Guest</option>
            <option value="2">2 Guests</option>
            <option value="3">3 Guests</option>
            <option value="4">4 Guests</option>
            <option value="5">5 Guests</option>
            <option value="6">6 Guests</option>
        </select>

        <input type="submit" value="Review Reservation" class="submit-btn">

    </form>
</div>

<script>
    // Set today as minimum check-in date
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('checkIn').min  = today;
    document.getElementById('checkOut').min = today;

    // Populate hidden fields when a room is selected
function updateRoomDetails(select) {
    const option = select.options[select.selectedIndex];
    document.getElementById('roomType').value    = option.getAttribute('data-type');
    document.getElementById('nightlyRate').value = option.getAttribute('data-rate');
    document.getElementById('maxGuests').value   = option.getAttribute('data-max');
    document.getElementById('checkOut').min      = document.getElementById('checkIn').value;
    }
</script>

</body>
</html>