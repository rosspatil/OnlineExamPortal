<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Score</title>
</head>
<body>
	<div>
		<jsp:include page="SimpleHeader.jsp"></jsp:include><br />
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />

	<div class="container">
		<p>
		<% String score=request.getParameter("score");		
		%>
			<h1 align="center" >Score is: <%=score%></h1></h1></p>
	</div>
	

</body>
</html>