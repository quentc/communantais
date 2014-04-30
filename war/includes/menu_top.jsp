<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
 <%
 UserService userService = UserServiceFactory.getUserService();
 User user = userService.getCurrentUser();
 %>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>CommuNantais</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <link rel="icon" type="image/png" href="/bootstrap/img/favicon.ico" />
	<!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><![endif]-->    
  </head>
    
    <div class="navbar navbar-default navbar-fixed-top" role="navigation ">
      <div class="container">
        <div class="navbar-collapse collapse">
        <%   if(user != null)
              {
            %>
          <form class="navbar-form navbar-right">
			<a href="<%= userService.createLogoutURL("/initServlet") %>" class="btn btn-danger btn-small"><i class="fam-lock"></i> Deconnexion</a>
		  </form>
		  <%
              }
		  %>
          <ul class="nav navbar-nav">
          	<li><a href="initServlet"><img src="/bootstrap/img/logoSmall.png" border="0"></a></li>            
              <%
              if(user != null)
              {
              %>
              <li><a href="#"><span class="glyphicon glyphicon-user"/><%=user.getNickname() %></a></li>
              <li><a href="communantais1">Ajouter un incident</a></li>
	          <li><a href="myReports">Mes rapports</a></li>
	          <li><a href="allProblems">Tous les incidents</a></li>
	          <li><a href="help">Aide</a></li>              
              <%
              }
              else
              { %>
              <li><a href="help">Aide</a></li>
              <%   
              } %>
              
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
    <script>
    (function($){
    	   $('.nav li').click(function(){
    	       $('.nav li').each(function(){
    	          $(this).removeClass('active');
    	          });
    	       $(this).addClass('active');
    	       });
    	 
    	})(jQuery);
      	
    </script>
    <script src="bootstrap/js/bootstrap.js"></script> 