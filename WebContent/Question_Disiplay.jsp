<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.zensar.bean.Question"%>
<%@page import="com.zensar.DAO.QuestionDAO"%>
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
<body>
	<div class="container">
		<div class="row-sm-3">
			<form action="/Online_Exam_Pattern/Controller" method="post">
				<%
					String counter = request.getParameter("counter");
					QuestionDAO questionDAO = (QuestionDAO) session
																.getAttribute("Questions");
					Question question = null;
					ArrayList<String> scoreMap=(ArrayList<String>)session
					.getAttribute("ScoreMap");
					Logger logger=(Logger)request.getServletContext().getAttribute("Logger");
				%>
				<%
					if (counter == null || String.valueOf(counter).equals("0")) {
					 question = questionDAO.questions.get(0);
				%>

				<div class="well" style="width: 750px; margin: auto">
					<b>Q.1.</b><b><%=question.getQuestion()%></b>
				</div>
				<br>
				<div class="well" style="width: 750px; margin: auto">
					<input type="radio" id="answer1" value="1"><%=question.getOptions().get(0)%><br>
					<input type="radio" id="answer2" value="2"><%=question.getOptions().get(1)%><br>
					<input type="radio" id="answer3" value="3"><%=question.getOptions().get(2)%><br>
					<input type="radio" id="answer4" value="4"><%=question.getOptions().get(3)%><br>
					<input type="hidden" id="counter" value="0"> <input
						type="button" onclick="next()" value="Next">&nbsp;
				</div>
				<%
					} else if(Integer.parseInt(counter)>=1){
						logger.info("Question no."+Integer.parseInt(counter)+" Answer choosed: "+  request.getParameter("answer"));
						if( request.getParameter("answer")!=null)
						    scoreMap.add(Integer.parseInt(counter)-1, request.getParameter("answer"));
						question = questionDAO.questions.get(Integer.parseInt(counter));
				%>
				<div class="well" style="width: 750px; margin: auto">
					<b>Q.<%=Integer.parseInt(counter)+1 + "\t"%>.
					</b><b><%=question.getQuestion()%></b>
				</div>
				<br>
				<div class="well" style="width: 750px; margin: auto">
					<input type="radio" id="answer1" value="1"><%=question.getOptions().get(0)%><br>
					<input type="radio" id="answer2" value="2"><%=question.getOptions().get(1)%><br>
					<input type="radio" id="answer3" value="3"><%=question.getOptions().get(2)%><br>
					<input type="radio" id="answer4" value="4"><%=question.getOptions().get(3)%><br>
					<input type="hidden" id="counter" value="<%=counter%>"> <br>
					<br>
					<%
						if (Integer.parseInt(counter) < 14) {
					%>
					<input type="button" onclick="next()" value="Next">&nbsp;<input
						type="button" onclick="prev()" value="Prev">&nbsp;
						
					<%
						}else if (Integer.parseInt(counter) == 14) {
					%>
					<input
						type="button" onclick="prev()" value="Prev">&nbsp;
						
					<%
						}
					}
							session.setAttribute("ScoreMap",scoreMap);
					%>
					<input type="hidden" name="action" value="finish"><input
						type="submit" value="Finish">

				</div>
			</form>

		</div>
	</div>
	<script src="js/script.js"></script>


</body>
</html>