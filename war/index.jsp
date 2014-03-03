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

    
  </body>
</html>
