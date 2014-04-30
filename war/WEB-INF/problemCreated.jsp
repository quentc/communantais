<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>

<!DOCTYPE html>
<html>
   	<h1>Craaack ! ...</h1> la page ne s'affiche pas correctement... Problème de redirection URL causé par l'upload via le Blob </br>
   	<b>=> Deconnectez/Reconnectez pour continuer la navigation</b>
 <jsp:include page="/includes/menu_top.jsp" />
    <body>   
   	<div class="container">
        <h3>
            Problème enregistré avec succès !
        </h3>
        <p>Date : ${ problem.properties.dateProblem }</p>
        <p>Sujet : ${ problem.properties.sujet }</p>
    </div>   
    </body>
</html>