<!-- Alpha Team
	Created by: Reed Bunnell -->

<%@ page import="beans.ContactBean" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    ContactBean cb = new ContactBean();
    cb.setName(name);
    cb.setEmail(email);
    cb.setMessage(message);

    if(cb.saveMessage()) {
%>
        <h2>Message Sent!</h2>
<%
    } else {
%>
        <h2>Error sending message.</h2>
<%
    }
%>

<br>
<a href="about.jsp">Back</a>