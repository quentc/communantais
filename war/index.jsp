<%@ page pageEncoding="UTF-8" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
<jsp:include page="/includes/menu_top.jsp" />
  <body>  	
    <div class="container">

      <h1>Bienvenue sur la CommuNantais</h1>
      
              <%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%= user.getNickname() %>! (Vous pouvez
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Déconnecter</a>.)</p>
<%
    } else {
%>
<p>Hello! Vous pouvez vous
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>"> Connecter</a></p>
<%
    }
%>

      <p>Reportez, visualisez ou discutez des incidents de votre ville de Nantes.</p>
      <p><i>(Graffitis, déchets, nids de poules, feux de signalisation... ).</i></p>
      
      <form class="navbar-form" role="search">
      	<div class="form-group">
      			<input type="text" class="form-control" placeholder="Rechercher">
      	</div>
      	<button type="submit" class="btn btn-default">GO</button>
      </form>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d43355.744723519965!2d-1.5494812560058593!3d47.22178593245512!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4805ee81f0a8aead%3A0x40d37521e0ded30!2sNantes!5e0!3m2!1sfr!2sfr!4v1392223875763" width="600" height="450" frameborder="0" style="border:0"></iframe>    </div> <!-- /container -->
        

    
  </body>
</html>
