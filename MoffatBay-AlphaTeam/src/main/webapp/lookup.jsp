<!-- Alpha Team
	Reservation Lookup Page by Daniel Graham -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="beans.ReservationBean" %>

<%
    ReservationBean result = null;
    String lookupError = null;
    boolean searched = false;

    String paramId       = request.getParameter("reservationId");
    String paramLastName = request.getParameter("lastName");

    if (paramId != null && paramLastName != null &&
        !paramId.trim().isEmpty() && !paramLastName.trim().isEmpty()) {

        searched = true;
        try {
            int resId = Integer.parseInt(paramId.trim());
            ReservationDAO dao = new ReservationDAO();
            result = dao.lookupReservation(resId, paramLastName.trim());
            if (result == null) {
                lookupError = "No reservation found matching that ID and last name. Please check your information and try again.";
            }
        } catch (NumberFormatException e) {
            lookupError = "Reservation ID must be a number.";
        } catch (RuntimeException e) {
            lookupError = "A database error occurred. Please try again later.";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <title>Reservation Lookup - Moffat Bay Lodge</title>

  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/fontawesome.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
  <link rel="stylesheet" href="css/animate.css">
</head>

<body>

  <%@ include file="components/header.jsp" %>

  <!-- Hero Banner -->
  <div class="lookup-hero">
    <div class="lookup-hero-overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="lookup-hero-text">
            <h6>Moffat Bay Lodge</h6>
            <h2>Reservation Lookup</h2>
            <p>Enter your details below to find your booking</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Main Content -->
  <div class="lookup-body">
    <div class="container">

      <% if (result != null) { %>

        <!-- ── RESULT VIEW ─────────────────────────── -->
        <%
          String statusVal = result.getStatus() != null ? result.getStatus() : "Unknown";
          String statusClass = "lookup-status-pending";
          if (statusVal.equalsIgnoreCase("Confirmed")) statusClass = "lookup-status-confirmed";
          else if (statusVal.equalsIgnoreCase("Cancelled")) statusClass = "lookup-status-cancelled";
        %>

        <div class="row">

          <!-- Left: Confirmation Card -->
          <div class="col-lg-7">
            <div class="lookup-card">

              <div class="lookup-card-header">
                <div>
                  <h3><%= result.getFirstName() %> <%= result.getLastName() %></h3>
                  <span class="lookup-res-id">Reservation #<%= result.getReservationId() %></span>
                </div>
                <span class="lookup-status <%= statusClass %>"><%= statusVal %></span>
              </div>

              <div class="lookup-card-body">

                <div class="lookup-detail-row">
                  <div class="lookup-detail-item">
                    <label>Room Type</label>
                    <span><%= result.getRoomTypesId() %></span>
                  </div>
                  <div class="lookup-detail-item">
                    <label>Guests</label>
                    <span><%= result.getGuestCount() %></span>
                  </div>
                </div>

                <div class="lookup-detail-row">
                  <div class="lookup-detail-item">
                    <label>Check-In</label>
                    <span><%= result.getCheckinDate() %></span>
                  </div>
                  <div class="lookup-detail-item">
                    <label>Check-Out</label>
                    <span><%= result.getCheckoutDate() %>
                  </div>
                </div>

                <div class="lookup-detail-row">
                  <div class="lookup-detail-item">
                    <label>Nightly Rate</label>
                    <span>$<%= String.format("%.2f", result.getNightlyRate()) %></span>
                  </div>
                </div>

              </div>

              <div class="lookup-card-total">
                <span>Total Charged</span>
                <strong>$<%= String.format("%.2f", result.getTotalCost()) %></strong>
              </div>

              <div class="lookup-card-footer">
                <div class="text-button">
                  <a href="${pageContext.request.contextPath}/lookup.jsp">
                    <i class="fa fa-arrow-left"></i> Look up another reservation
                  </a>
                </div>
                <div class="main-button" style="position:static;">
                  <a href="reservation.jsp">Book Another Stay</a>
                </div>
              </div>

            </div>
          </div>

          <!-- Right: Map -->
          <div class="col-lg-5">
            <div class="side-bar-map">
              <div class="row">
                <div class="col-lg-12">
                  <div id="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3729.9545445599924!2d-123.16413001420244!3d48.61986978738752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x548f63117673f035%3A0xbcde95848200f427!2sBarren%20Island!5e0!3m2!1sen!2sus!4v1776292767288!5m2!1sen!2sus"
                      width="100%" height="440px" frameborder="0"
                      style="border:0; border-radius: 23px;" allowfullscreen="">
                    </iframe>
                  </div>
                  <div class="lookup-lodge-info">
                    <p><strong>Moffat Bay Lodge</strong><br>
                    Joviedsa Island, Pacific Northwest<br>
                    <i class="fa fa-envelope" style="color:var(--brand); margin-right:6px;"></i>reservations@moffatbay.com</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      <% } else { %>

        <!-- ── SEARCH FORM ─────────────────────────── -->
        <div class="row">

          <!-- Left: Form -->
          <div class="col-lg-6">
            <div class="lookup-card">

              <div class="lookup-card-header">
                <div>
                  <h3>Find Your Reservation</h3>
                  <span class="lookup-res-id">Enter your booking ID and last name</span>
                </div>
              </div>

              <div class="lookup-card-body">
                <form method="GET" action="${pageContext.request.contextPath}/lookup.jsp">
                  <div class="lookup-field">
                    <label>Reservation ID</label>
                    <input type="text" name="reservationId" placeholder="e.g. 1"
                      value="<%= paramId != null ? paramId : "" %>">
                  </div>
                  <div class="lookup-field">
                    <label>Last Name</label>
                    <input type="text" name="lastName" placeholder="e.g. Graham"
                      value="<%= paramLastName != null ? paramLastName : "" %>">
                  </div>

                  <% if (searched && lookupError != null) { %>
                    <p class="lookup-error">
                      <i class="fa fa-circle-exclamation"></i> <%= lookupError %>
                    </p>
                  <% } %>

                  <div class="lookup-card-footer">
                    <div class="main-button" style="position:static;">
                      <a href="#" onclick="this.closest('form').submit(); return false;">Look Up Reservation</a>
                    </div>
                    <div class="text-button" style="margin-top: 16px;">
                      <a href="reservation.jsp">Need to make a new booking? <i class="fa fa-arrow-right"></i></a>
                    </div>
                  </div>
                </form>
              </div>

            </div>
          </div>

          <!-- Right: Map -->
          <div class="col-lg-6">
            <div class="side-bar-map">
              <div class="row">
                <div class="col-lg-12">
                  <div id="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3729.9545445599924!2d-123.16413001420244!3d48.61986978738752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x548f63117673f035%3A0xbcde95848200f427!2sBarren%20Island!5e0!3m2!1sen!2sus!4v1776292767288!5m2!1sen!2sus"
                      width="100%" height="380px" frameborder="0"
                      style="border:0; border-radius: 23px;" allowfullscreen="">
                    </iframe>
                  </div>
                  <div class="lookup-lodge-info">
                    <p><strong>Moffat Bay Lodge</strong><br>
                    Joviedsa Island, Pacific Northwest<br>
                    <i class="fa fa-envelope" style="color:var(--brand); margin-right:6px;"></i>reservations@moffatbay.com</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      <% } %>

    </div>
  </div>

  <!-- CTA -->
  <div class="call-to-action">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <h2>Ready for an escape?</h2>
          <h4>Book with us now!</h4>
        </div>
        <div class="col-lg-4">
          <div class="border-button">
            <a href="reservation.jsp">Make a reservation</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright &copy; 2026 Alpha Team - Stephanie, Daniel, Sylvester, Reed. All rights reserved.
          <br>A Project for CSD460-H307: Software Development Capstone. Not a real place, sorry folks!</p>
        </div>
      </div>
    </div>
  </footer>

  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="js/custom.js"></script>

</body>
</html>
