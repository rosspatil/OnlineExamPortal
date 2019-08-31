<%@page import="com.zensar.bean.User"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
input[type=button],input[type=submit],input[type=reset] {
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.w3-table.no-gutters {
	margin-right: 0;
	margin-left: 0;
}
</style>
<title>header</title>
</head>
<body>
	<%
		User user = (User) session.getAttribute("User");
		int userId = user.getUserId();
	%>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/Online_Exam_Pattern/Welcome.jsp">ONLINE
				EXAM PORTAL</a>
		</div>
		<ul class="nav navbar-nav w3-right w3-hide-small"
			style="padding: 0px;">
			<li class="active"><a href="/Online_Exam_Pattern/Welcome.jsp">Home</a></li>
			<li><a href="/Online_Exam_Pattern/Controller?action=start">Start
					Test</a></li>
			<li><a href="/Online_Exam_Pattern/About.jsp">About
			</a></li>
			<li><a href="/Online_Exam_Pattern/Contact.jsp">Contact
			</a></li>
			<li><a href="/Online_Exam_Pattern/Controller?action=logout">Logout</a></li>
			<li class="w3-right w3-hide-small"><a
				href="/Online_Exam_Pattern/profileCard.jsp"><img
					src="/Online_Exam_Pattern/PhotoServlet?userId=<%=URLEncoder.encode(String.valueOf(userId), "UTF-8")%>" height="42" width="42"><%=user.getFirstName()+" "+user.getLastName() %></i></a> </li>
		</ul>
	</div>
	</nav>




</body>
</html>