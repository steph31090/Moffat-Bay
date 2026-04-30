<!-- Alpha Team
	Created by: Sylvester Brandon -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="beans.ReservationBean" %>

<%
    // -----------------------------------------
    // AUTH GUARD
    // -----------------------------------------
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/account/login.jsp");
        return;
    }

    // -----------------------------------------
    // POST -- handle confirm or cancel actions
    // -----------------------------------------
    int confirmedReservationId = -1;
    String errorMessage = "";

    if (request.getMethod().equalsIgnoreCase("post")) {

        String action = request.getParameter("action");

        // CANCEL -- clear draft and go back to reservation page
        if ("cancel".equals(action)) {
            session.removeAttribute("reservation_draft");
            response.sendRedirect(request.getContextPath() + "/reservation.jsp");
            return;
        }

        // CONFIRM -- insert into database
        if ("confirm".equals(action)) {

            ReservationBean draft = (ReservationBean) session.getAttribute("reservation_draft");

            if (draft == null) {
                response.sendRedirect(request.getContextPath() + "/reservation.jsp");
                return;
            }

            String userEmail   = (String) session.getAttribute("user");
            ReservationDAO dao = new ReservationDAO();

            // Look up customerId from email
            int customerId = dao.getCustomerId(userEmail);

            if (customerId == -1) {
                errorMessage = "Account not found. Please log in again.";
            } else {
                draft.setCustomerId(customerId);

                // Save to database
                confirmedReservationId = dao.saveReservation(draft);

                // Clear draft from session -- booking is complete
                session.removeAttribute("reservation_draft");
            }
        }
    }

    // -----------------------------------------
    // GET -- read draft from session for display
    // -----------------------------------------
    ReservationBean draft = (ReservationBean) session.getAttribute("reservation_draft");

    // No draft and no confirmed booking -- send back to start
    if (draft == null && confirmedReservationId == -1) {
        response.sendRedirect(request.getContextPath() + "/reservation.jsp");
        return;
    }

    boolean isConfirmed = confirmedReservationId > 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay - <%= isConfirmed ? "Booking Confirmed" : "Review Reservation" %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>

<body class="reservation-page" style="background-color: #f2f2f2;">

<!--Header Insert!-->
<jsp:include page="components/header.jsp" />

<% if (isConfirmed) { %>

    <%-- CONFIRMATION SCREEN --%>
    <div class="register-container" style="max-width: 500px; margin: 100px auto; text-align: center; padding: 40px 50px;">

        <h1>Booking Confirmed!</h1>

        <p>Your reservation has been confirmed at Moffat Bay Lodge.</p>

        <h2 style="margin: 20px 0; color: #22b3c1;">
            Reservation #<%= String.format("%05d", confirmedReservationId) %>
        </h2>

        <p>Save this number for your records.</p>

        <a href="<%= request.getContextPath() %>/" class="submit-btn" style="display: inline-block; margin-top: 20px; text-decoration: none;">
            Return to Home
        </a>

    </div>

<% } else { %>

    <%-- REVIEW SCREEN --%>
    <div class="register-container" style="max-width: 600px; margin: 100px auto; padding: 40px 50px;">

        <h1 style="text-align: center; margin-bottom: 30px;">Review Your Reservation</h1>

        <% if (!errorMessage.isEmpty()) { %>
            <script>alert("<%= errorMessage %>");</script>
        <% } %>

        <label>Room Type:</label>
        <input type="text" value="<%= draft.getRoomName() %>" disabled style="width: 100%; margin-bottom: 12px;">
        
        <label>Check-In Date:</label>
        <input type="text" value="<%= draft.getCheckInDate() %>" disabled style="width: 100%; margin-bottom: 12px;">
        
        <label>Check-Out Date:</label>
        <input type="text" value="<%= draft.getCheckOutDate() %>" disabled style="width: 100%; margin-bottom: 12px;">
        
        <label>Number of Nights:</label>
        <input type="text" value="<%= draft.getTotalNights() %>" disabled style="width: 100%; margin-bottom: 12px;">

        <label>Number of Guests:</label>
        <input type="text" value="<%= draft.getGuestCount() %>" disabled style="width: 100%; margin-bottom: 12px;">

        <label>Subtotal:</label>
        <input type="text" value="$<%= String.format("%.2f", draft.getSubtotal()) %>" disabled style="width: 100%; margin-bottom: 12px;">

        <label>Taxes and Fees (12%):</label>
        <input type="text" value="$<%= String.format("%.2f", draft.getTax()) %>" disabled style="width: 100%; margin-bottom: 12px;">

        <label>Total Charged:</label>
        <input type="text" value="$<%= String.format("%.2f", draft.getTotalPrice()) %>" disabled style="width: 100%; margin-bottom: 20px;">

        <form action="reservation_summary.jsp" method="post">
            <input type="hidden" name="action" value="confirm" />
            <input type="submit" value="Confirm and Book" class="submit-btn" style="width: 100%; margin-bottom: 10px;">
        </form>

        <form action="reservation_summary.jsp" method="post">
            <input type="hidden" name="action" value="cancel" />
            <input type="submit" value="Go Back and Change" class="submit-btn" style="width: 100%;">
        </form>

    </div>

<% } %>

</body>
</html>