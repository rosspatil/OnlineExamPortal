
<%@page import="java.io.InputStream"%>
<%@page import="com.zensar.bean.User"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/online_exam" user="roshan"
	password="hibuddy" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%!int userId;
	String firstName;
	String lastName;
	String phone;
	String email;
	User user;%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {
	font-family: "Open Sans", sans-serif
}
</style>
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
<%
	user = (User) session.getAttribute("User");
	userId = user.getUserId();
	firstName = user.getFirstName();
	lastName = user.getLastName();
	phone = user.getPhone();
	email = user.getEmail();
%>

<title>header</title>
</head>
<body class="w3-theme-l5">

	<jsp:include page="SimpleHeader.jsp" />



	<div class="container" style="width: 500px; margin-top: 20px;">
		<div class="row">
			<div class="w3-card-2 w3-round w3-white"
				style="margin: 0px; padding: 0px;">
				<div class="w3-container">
					<h4 class="w3-center">My Profile</h4>
					<p class="w3-center">

						<a data-toggle="modal" href="#imageModal"> <img width="90" height="90"
							src="/Online_Exam_Pattern/PhotoServlet?userId=<%=URLEncoder.encode(String.valueOf(userId), "UTF-8")%>"
							class="w3-circle">
						</a>
					</p>

					<p>
						<i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i>
						<%=firstName%>&nbsp;<%=lastName%>&nbsp;<a data-toggle="modal"
							href="#nameModal"><i
							class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i></a>
					</p>
					<p>
						<i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i>
						<%=email%>
					</p>
					<p>
						<i class="fa fa-phone fa-fw w3-margin-right w3-text-theme"></i>+91-<%=phone%><a
							data-toggle="modal" href="#phoneModal"><i
							class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i></a>
					</p>
				</div>
			</div>
		</div>
	</div>



	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="w3-card-2 w3-round w3-white">
				<div class="container">
					<h4 class="w3-center">Test History</h4>
					<table class="table table-striped" style="width: 1100px">
						<thead>
							<tr>
								<th>Test</th>
								<th>Score</th>
							</tr>
						</thead>
						<sql:query var="rs" dataSource="${dataSource}">
							SELECT * FROM result where email='<%=email%>'
						</sql:query>
						<tbody>
							<c:if test="${rs!=null}">
								<c:forEach var="row" items="${rs.rows}">
									<tr>
										<td><c:out value="${row.email}" /></td>
										<td><c:out value="${row.score}" /></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>



					</table>
				</div>
			</div>
		</div>
	</div>

	<c:set var="userId" value="<%=userId%>" />


	<c:set var="phone" value='<%=request.getParameter("phone")%>' />
	<c:if test="${phone!=null }">
		<%
			user.setPhone(request.getParameter("phone"));

				session.setAttribute("User", user);
		%>
		<sql:update dataSource="${ dataSource}">
						UPDATE user_details SET phoneno='${phone}'  where userid='${userId}'
		</sql:update>
	</c:if>

	<c:set var="firstName" value='<%=request.getParameter("firstName")%>' />
	<c:set var="lastName" value='<%=request.getParameter("lastName")%>' />
	<c:if test="${firstName!=null }">
		<c:if test="${lastName!=null }">
			<%
				user.setFirstName(request.getParameter("firstName"));
						user.setLastName(request.getParameter("lastName"));
						session.setAttribute("User", user);
			%>
			<sql:update dataSource="${ dataSource}">
						UPDATE user_details SET firstname='${firstName}' , lastname='${lastName}' where userid='${userId}'
						
			</sql:update>
		</c:if>
	</c:if>
	<div class="modal fade" id="nameModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Enter new name</h4>
				</div>
				<form action="profileCard.jsp">
					<div class="modal-body">

						<p>
							<label for="firstName">Enter First name</label><input type="text"
								class="form-control" id="firstName" name="firstName">
						</p>
						<p>
							<label for="lastName">Enter Last name</label><input type="text"
								class="form-control" id="lastName" name="lastName">
						</p>
					</div>
					<div class="modal-footer">
						<input type="submit" value="Save" class="btn btn-default">&nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>


		</div>
	</div>

	<div class="modal fade" id="imageModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Enter new Photo</h4>
				</div>
				<form action="/Online_Exam_Pattern/Controller" method="post"
					enctype="multipart/form-data">

					<input type="file" name="profile" accept="image/*">

					<div class="modal-footer">
						<input type="submit" value="Upload" class="btn btn-default">&nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>


		</div>
	</div>




	<div class="modal fade" id="phoneModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Enter new phone no.</h4>
				</div>
				<form action="profileCard.jsp">
					<div class="modal-body">

						<p>
							<label for="phone">Enter Phone no.</label><input type="text"
								class="form-control" id="phone" name="phone">
						</p>
					</div>
					<div class="modal-footer">
						<input type="submit" value="Save" class="btn btn-default">&nbsp;
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>


		</div>
	</div>
</body>
</html>
