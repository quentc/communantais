<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
 <jsp:include page="/includes/menu_top.jsp" />
    <body>
   	<div class="container">
        <h1>
            Problème enregistré avec succès !
        </h1>
        <%-- Affichage de la chaîne "message" transmise par la servlet --%>
        <!-- <p class="info">${ message }</p> -->
        <%-- Puis affichage des données enregistrées dans le bean "client" transmis par la servlet --%>
        <p>Sujet : ${ problem.sujet }</p>
        <p>Détails : ${ problem.details }</p>
        <p>Catégorie : ${ problem.categorie }</p>        
        <p>Email : ${ problem.email }</p>
        <p>Nom : ${ problem.nom }</p>   
        <p>Numéro de téléphone : ${ problem.telephone }</p> 
       </div>   
    </body>
</html>