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
	<div class="w3-top" style="background-color: #212121; color: #FFFFFF">
		<ul class="w3-navbar w3-wide w3-padding-8 w3-card-2">
			<li><a href="/Online_Exam_Pattern/Welcome.jsp"
				class="w3-margin-left"><b>OnlineExamPortal</b></a></li>
			<!-- Float links to the right. Hide them on small screens -->
			<li class="w3-right w3-hide-small"><%=user.getFirstName() + " " + user.getLastName()%>
			</li>
		</ul>
	</div>
	</nav>

</body>
</html>