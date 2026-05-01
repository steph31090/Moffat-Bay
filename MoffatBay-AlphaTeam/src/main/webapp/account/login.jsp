<!-- Alpha Team
	Created by: Stephanie Lara -->

<%@ page import="dao.UserDAO" %>

<%
    String errorMessage = "";

    if (request.getMethod().equalsIgnoreCase("post")) {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        boolean validUser = dao.validateUser(email, password);

        if (validUser) {
            session.setAttribute("user", email);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        } else {
            errorMessage = "Invalid email or password";
        }
    }
%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay - Login</title>


	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css?v=10">
</head>

<body>

<!--Header Insert!--->
<jsp:include page="../components/header.jsp" />


<div class="login-page">


    <!-- LEFT SIDE IMAGE/TEXT -->
    <div class="login-left">
        <img src="../images/Login.jpg" alt="Login Image">
    </div>
    
    <div class="image-text">
        Stay, explore, and unwind<br>
        at Moffat Bay Lodge
    </div>

    <!-- RIGHT SIDE LOGIN FORM -->
    <div class="login-right">

        <div class="login-box">

            <img src="../images/Logo.jpg" alt="Logo" class="logo-img">

            <h1>Welcome to Moffat Bay Lodge!</h1>
            <p>Sign in to access your account.</p>

            <h2>Login</h2>
			
            <form action="login.jsp" method="post">

				<div class="email-row">
				    <label for="email">Email:</label>
				    <input type="email" id="email" name="email" placeholder="type your email" required>
				</div>
				
				<div class="password-row">
				    <label for="password">Password:</label>
				    <input type="password" id="password" name="password" placeholder="******" required>
				</div>
			
			    <a href="#" class="forgot-link" onclick="alert('Password recovery is not implemented yet.'); return false;">Forgot password?</a>
			
			    <div class="remember-row">
			        <input type="checkbox" id="rememberMe" name="rememberMe">
			        <label for="rememberMe">Remember me</label>
			    </div>
			
			    <div class="main-button" style="text-align:center; margin-bottom:30px;">
    				<a href="#" onclick="this.closest('form').submit(); return false;">Sign In</a>
				</div>

			</form>

			<p class="register-text">
			  Don't have an account?
			  <a href="register.jsp" class="text-button">
			    Create an account <i class="fa fa-arrow-right"></i>
			  </a>
			</p>
			
        </div>

    </div>

</div>

<% if (!errorMessage.isEmpty()) { %>
<script>
   	alert("<%= errorMessage %>");
</script>
<% } %>


</body>
</html>