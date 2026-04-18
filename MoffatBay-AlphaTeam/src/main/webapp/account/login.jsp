<!-- Created by: Stephanie Lara
Alpha Team
 -->
 <%@ page import="dao.UserDAO" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        boolean validUser = dao.validateUser(email, password);

        if (validUser) {
            session.setAttribute("user", email);  // 🔥 THIS LINE
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            out.println("<p style='color:red;'>Invalid email or password</p>");
        }
    }
%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay - Login</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
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
				    <input type="email" id="email" name="email" placeholder="type your email">
				</div>
				
				<div class="password-row">
				    <label for="password">Password:</label>
				    <input type="password" id="password" name="password" placeholder="******">
				</div>
			
			    <a href="#" class="forgot-link" onclick="alert('Password recovery is not implemented yet.'); return false;">Forgot password?</a>
			
			    <div class="remember-row">
			        <input type="checkbox" id="rememberMe" name="rememberMe">
			        <label for="rememberMe">Remember me</label>
			    </div>
			
			    <input type="submit" value="Sign in" class="signin-btn">

			</form>

            <p class="register-text">
                Don't have an account?
                <a href="register.jsp">Create an account</a>
            </p>
			
        </div>

    </div>

</div>

</body>
</html>