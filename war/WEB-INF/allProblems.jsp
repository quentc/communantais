<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
All problems

   	<div class="container"> 
		<h1>Problèmes :</h1>
		<%
		List<Problem> problems = (List<Problem>) request.getAttribute("problems");
			for (Problem problem : problems) {
		%>
		<p>
			<strong><%= problem.getSujet() %></strong> Sujet :<br />
			<%= problem.getDetails() %>
		</p>
		<%
			}
		%>
       </div>  
       
</body>
</html>