<!-- Created by: Stephanie Lara
Alpha Team
 -->
<%@ page import="beans.UserBean" %>
<%@ page import="dao.UserDAO" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match');</script>");
        } else {

            UserBean user = new UserBean();
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phone);
            user.setPasswordHash(password);

            UserDAO dao = new UserDAO();
            boolean success = dao.registerUser(user);

            if (success) {
                out.println("<script>alert('Registration successful!'); window.location='login.jsp';</script>");
            } else {
                out.println("<script>alert('Registration failed');</script>");
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>

    <link rel="stylesheet" href="/MoffatBay-AlphaTeam/css/styles.css">
</head>

<body class="register-page">

<div class="register-container">
    <h1>Registration</h1>

    <form action="register.jsp" method="post" onsubmit="return confirmSubmission()">

        <label>First Name:</label>
        <input type="text" name="firstName" required>

        <label>Last Name:</label>
        <input type="text" name="lastName" required>

        <label>Email Address:</label>
        <input type="email" name="email" required>

        <label>Phone Number:</label>
        <input type="text" name="phoneNumber" required>

		<label>
		    Password:
		    <span class="password-note">
		        Must contain 8+ characters with at least 1 number and 1 upper case letter.
		    </span>
		</label>
		<input type="password" name="password" required
		pattern="^(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]{8,}$"
		title="Must be at least 8 characters, include 1 uppercase letter and 1 number">

        <label>Re-type Password:</label>
        <input type="password" name="confirmPassword" required>

        <input type="submit" value="Submit" class="submit-btn">
        
        <p>
			Already have an account?
			<a href="login.jsp">Back to Login</a>
		</p>

    </form>
</div>


<script>
function confirmSubmission() {
    const firstName = document.querySelector('[name="firstName"]').value;
    const lastName = document.querySelector('[name="lastName"]').value;
    const email = document.querySelector('[name="email"]').value;
    const phone = document.querySelector('[name="phoneNumber"]').value;

    const message =
        "Please review your information:\n\n" +
        "First Name: " + firstName + "\n" +
        "Last Name: " + lastName + "\n" +
        "Email: " + email + "\n" +
        "Phone: " + phone + "\n\n" +
        "Do you want to submit?";

    return confirm(message);
}
</script>

</body>
</html>