<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="beans.Problem" %>
<section class="col-sm-4">
	<h2>Top 5 des incidents</h2>
	<table class="table table-bordered table-striped table-condensed">

		<%
			List<Problem> problems = (List<Problem>) request.getAttribute("problems");
			if(problems.size() == 0)
			{
		 %>
			<tr>
				<td><em>Aucun incident liké</em></td>
			</tr>
		<%
		}
		else
		{
			for (Problem problem : problems) {
		%>	
		<tr><th>Sujet <span class="glyphicon glyphicon-pushpin"/></th><th>  Likes <span class="glyphicon glyphicon-heart"/></th></tr>	
		<tr>
			<td><a href="detailsProblem?coord=(<%=problem.getLat()%>,<%=problem.getLng()%>)"><%=problem.getSujet()%></a></td>			
			<td><span class="badge"><%=problem.getLike()  %></span></td>
		</tr>			
		
		
		<%
		}
		}
		%>			
	</table>
</section>