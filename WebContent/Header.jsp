<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <style type="text/css">
  	input[type=button] , input[type=submit] , input[type=reset]{
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
		//String base = config.getInitParameter("URL").toString();
	%>
	<div class="w3-container" style="background-color : #212121;color : #FFFFFF">
	<div class="row">
		<div class="col-sm-6">
  			<h1>ONLINE EXAM PORTAL</h1>
 		</div>
 		<div class="col-sm-6" style="padding: 12px">
  			<form action="/Online_Exam_Pattern/Controller" method="post">
  				<table class="w3-table" style="margin-left: 100px">
  				<tr style="margin: 0px">
  					<td style="padding: 0px"><label for="username">username</label></td>
  					<td style="padding: 0px"><label for="username">password</label></td>
  					
  				</tr>
  				<tr style="margin: 0px">	
  					<td style="padding: 0px;width: 30%"><input type="text" class="form-control" name="userName" id="username"></td>
  					<td style="padding: 0px;width: 30%"><input type="password" class="form-control" name="password" id="password"></td>
  					<td style="padding: 0px;width: 30%"><input class="btn btn-default" type="submit" value="Login" style="background-color: #4CAF50;color: white;border: none;border-radius: 4px;cursor: pointer;"></td>
  				</tr>
  				</table>
  				<input type="hidden" name="action" value="login">
  			</form>
 		</div>
  	</div>	
</div>
</body>
</html>