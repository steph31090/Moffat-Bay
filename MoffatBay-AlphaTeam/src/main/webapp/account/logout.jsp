<!-- Alpha Team
	Created by: Daniel Graham -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout User</title>
</head>
<body>
<!-- Stephanie: Logout fix -->
<%
    session.invalidate();
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>