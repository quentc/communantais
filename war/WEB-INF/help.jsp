<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>

<!DOCTYPE html>
<html>
 <jsp:include page="/includes/menu_top.jsp" />
    <body>   
   	<div class="container">
   	<div class="jumbotron">
   	
   	<div>
   	<em>Afin de pouvoir accéder aux services de la CommuNantais, vous devez vous logger avec un compte Google ;) </em>
   	</div></br>
   	
   	Les Communantais peuvent à tout moment signaler un incident sur la voie publique afin d'avertir leurs concitoyens.</br>
   	Chaque alerte déposée pouvant être likée afin de prouver sa véracité. </br>
   	<b>5 Likes = Alerte confirmée ! L'équipe Municipalite est avertie.</b>	
   	</div>
   	<center><img src="/bootstrap/img/nantes.jpg" alt="Nantes" style="width:400px; height:300px;" /></center></br>
   	<div class="jumbotron">
   	Sources du projet :
	<a href="https://github.com/quentc/communantais">https://github.com/quentc/communantais</a></br>
	Documentation PDF :
	<a href="/includes/PENNY.pdf">Doc</a></br>      	
   	</div>

    </div>   
    </body>
</html>