<%@ page import="java.util.ArrayList" %>
<%@ page import="model.AboutUsBean" %>

<html>
<head>
    <title>About Us - Moffat Bay Lodge</title>
    <style>
        body {
            font-family: Arial;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .section {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>

<body>

<h1>About Moffat Bay Lodge</h1>

<%
    ArrayList<AboutUsBean> aboutList = AboutUsBean.getAboutInfo();

    for(AboutUsBean item : aboutList) {
%>

<div class="section">
    <h2><%= item.getTitle() %></h2>
    <p><%= item.getContent() %></p>
</div>
<hr>

<h2>Contact Us</h2>

<form action="contactProcess.jsp" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Message:</label><br>
    <textarea name="message" rows="5" cols="40" required></textarea><br><br>

    <input type="submit" value="Send Message">
</form>
<%
    }
%>

</body>
</html>