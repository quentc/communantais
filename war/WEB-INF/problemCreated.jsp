<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>

<!DOCTYPE html>
<html>
 <jsp:include page="/includes/menu_top.jsp" />
    <body>
   	<div class="container">
        <h1>
            Problème enregistré avec succès !
        </h1>
        <p>Sujet : ${ problem.properties.sujet }</p>
        <p>Détails : ${ problem.properties.details }</p>
	<%--  
		<h1>Problèmes :</h1>
		<%
		//	List<Problem> problems = (List<Problem>) request.getAttribute("problems");
			//for (Problem problem : problems) {
		%>
		<p>
			<strong><%= //problem.getSujet() %></strong> Sujet :<br />
			<%= //problem.getDetails() %>
		</p>
		<%
		//	}
		%>--%>
       </div>   
    </body>
</html>