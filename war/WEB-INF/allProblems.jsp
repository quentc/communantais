<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <jsp:include page="/includes/menu_top.jsp" />
<body>
   	<div class="container"> 
		<h3>Problèmes</h3>
		<table class="table table-bordered table-striped table-condensed">
		<tr><th>Sujet</th><th>Catégorie</th><th>Détails</th></tr>		
		<%
		List<Problem> problems = (List<Problem>) request.getAttribute("problems");
			for (Problem problem : problems) {
		%>
		<tr>
			<td><%=problem.getSujet()  %></td>
			<td><%=problem.getCategorie()  %></td>
			<td><%=problem.getDetails()  %></td>
		</tr>
		<%
			}
		%>
		</table>
       </div>  
       
</body>
</html>