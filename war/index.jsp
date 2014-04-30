<%@ page pageEncoding="UTF-8" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
<jsp:include page="/includes/menu_top.jsp" />
  <body>  	
    <div class="container">    
    	<%
			    UserService userService = UserServiceFactory.getUserService();
			    User user = userService.getCurrentUser();
			    if (user != null) {
		%>
	<div class="row">
		<section class="col-sm-8">
	      <h3>Bienvenue sur la CommuNantais <%= user.getNickname() %></h3>
			<p>Reportez, visualisez ou discutez des incidents de votre ville de Nantes.</p>
			<p><i>(Graffitis, déchets, nids de poules, feux de signalisation... ).</i></p> 
		</section> 
		<jsp:include page="/includes/top.jsp" />
	</div>
	<center>
	<div class="row">
    	<img src="/bootstrap/img/home.png" />
    </div>
    </center>
			<%
			    } else {
			%>
		<div class="row">
    		<img src="/bootstrap/img/home.png" />
    	</div>
    	<div class="row">
			<center><h3>Hello! Connecte-toi pour accéder au site  
			<a href="<%= userService.createLoginURL("/initServlet") %>" class="btn btn-success btn-large"><i class="fam-lock-open"></i> Connexion</a></h3></center>
			<%
			    }
			%> 
		</div>
	</div>
  </body>
</html>
