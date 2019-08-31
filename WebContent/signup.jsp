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
input[type=button], input[type=submit], input[type=reset] {
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
	<div class="container" >
  <div class="row-sm-3">
    <div class="col-sm-6">
     <img src="images/quize2.jpg" width="500px">
    </div>
    <div class="col-sm-6">
      <h3><b>Create an Account</b><h3><small><b>Its free and alwayse will be.</b></small>
      <h5></h5>	
      <form action = "/Online_Exam_Pattern/Controller" method="post">
   		 <div class="form-group">
      		 <label for="firstname">First Name:</label>
      		 <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter email" required>
    	</div>
    	<div class="form-group">
      		 <label for="lastname">Last Name:</label>
      		 <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter email" required>
    	</div>
    	<div class="form-group">
      		 <label for="mobile">Phone no:</label>
      		 <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter phone" required>
    	</div>
		<div class="form-group">
      		 <label for="email">Email:</label>
      		 <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
    	</div>
    	<div class="form-group">
      	<label for="pwd">Password:</label>
      	<input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
    	</div>
    	<input type="submit" class="btn btn-default" value="Create an Account" style="background-color: #4CAF50;color: white;border: none;border-radius: 4px;cursor: pointer;">
  		<input type="hidden" name="action" value="signup">
  </form>
    </div>
  </div>
</div>

</body>
</html>