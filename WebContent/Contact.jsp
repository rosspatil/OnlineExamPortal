<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact</title>
</head>
<body>

	<jsp:include page="SimpleHeader.jsp"></jsp:include>


	<div class="w3-container w3-padding-32" id="contact">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-12">Contact</h3>
		<p>Lets get in touch and talk about your and our next project.</p>
		<form action="form.asp" target="_blank">
			<input class="w3-input" type="text" placeholder="Name" required>
			<input class="w3-input w3-section" type="text" placeholder="Email"
				required> <input class="w3-input w3-section" type="text"
				placeholder="Subject" required> <input
				class="w3-input w3-section" type="text" placeholder="Comment"
				required>
			<button class="w3-btn w3-section" type="button" onclick="send()">
				<i class="fa fa-paper-plane"></i> SEND MESSAGE
			</button>
		</form>
	</div>
	<script type="text/javascript">
		function send() {
			window.alert("Thankyou for contacting us!");
		}
	</script>
</body>
</html>