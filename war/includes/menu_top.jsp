  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>CommuNantais</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
  </head>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="navbar-inner">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="index.jsp">CommuNantais</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="communantais1">Ajouter un problème</a></li>
              <li><a href="#myproblems">Mes problèmes</a></li>
              <li><a href="#contact">Tous les problèmes</a></li>
              <li><a href="#local">Alertes locales</a></li>
              <li><a href="#help">Aide</a></li>
            </ul>
          </div><!--/.nav-collapse -->
      </div>
    </div>
    
    
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li><a href="index.jsp">Communantais</a></li>
            <li><a href="communantais1">Ajouter un incident</a></li>
            <li><a href="#mes_rapports">Mes rapports</a></li>
            <li><a href="#tous">Tous les incidents</a></li>
            <li><a href="#locales">Alertes locales</a></li>
            <li><a href="#aide">Aide</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
    <script>
    	$('.nav li').click(function(e){ 
    		$('.nav li.active').removeClass('active');
    		var $this = $(this);    		
    		if(!$this.hasClass('active')) {
    			$this.addClass('active');
    		}
    		e.preventDefault();
    	});
      	
    </script>
    <script src="bootstrap/js/bootstrap.js"></script> 