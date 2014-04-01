<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>

<!DOCTYPE html>
<html>
 <jsp:include page="/includes/menu_top.jsp" />
    <body>   
   	<div class="container">
        <h3>
            Problème enregistré avec succès !
        </h3>
        <p>Date : ${ problem.properties.dateProblem }</p>
        <p>Sujet : ${ problem.properties.sujet }</p>
        <p>Détails : ${ problem.properties.details }</p>
       </div>   
    </body>
</html>