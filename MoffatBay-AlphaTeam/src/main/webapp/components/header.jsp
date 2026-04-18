<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Your CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
</head>


<header class="header-area header-sticky">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <nav class="main-nav">

          <!-- Logo -->
          <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
            <img src="${pageContext.request.contextPath}/images/Logo.jpg" alt="Moffat Bay Lodge Logo">
          </a>

          <!-- Menu -->
			<ul class="nav">
			  <li><a href="${pageContext.request.contextPath}/index.jsp" class="active">Home</a></li>
			  <li><a href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
			  <li><a href="${pageContext.request.contextPath}/attractions.jsp">Attractions</a></li>
			  <li><a href="${pageContext.request.contextPath}/reservation.jsp">Book Reservation</a></li>
			  <li><a href="${pageContext.request.contextPath}/lookup.jsp">Reservation Lookup</a></li>
			
			  <%
			    if (session.getAttribute("user") == null) {
			  %>
			    <li class="auth">
			      <a class="btn-outline" href="${pageContext.request.contextPath}/account/login.jsp">Login</a>
			    </li>
			  <%
			    } else {
			  %>
			    <li class="auth">
			      <a class="btn-outline" href="#">Welcome, <%= session.getAttribute("user") %></a>
			    </li>
			    <li class="auth">
			      <a class="btn-outline" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
			    </li>
			  <%
			    }
			  %>
			</ul>

          <!-- Mobile Menu Trigger -->
          <a class="menu-trigger">
            <span>Menu</span>
          </a>

        </nav>
      </div>
    </div>
  </div>
</header>

<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/js/isotope.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl-carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/tabs.js"></script>
<script src="${pageContext.request.contextPath}/js/popup.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>