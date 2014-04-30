<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>
<!DOCTYPE html>
<html>
 <jsp:include page="/includes/menu_top.jsp" />
    <body onload="initMap()">   
   	<div class="container">
        <%
        Problem problem = null;
        if(request.getAttribute("coord") != null)
        {
			List<Problem> problemFind = (List<Problem>) request.getAttribute("problem");
			problem = problemFind.get(0);
        }
        else
        {
            problem = (Problem) request.getAttribute("problem");
        }
		%>
		<div class="row">		
			<section class="col-sm-5">
			<div class="jumbotron">
			<h4><%= problem.getSujet() %></h4>
			<i>Incident répertorié le <%= problem.getDateProblem() %></i><br /><br />
			<img src="<%=problem.getUrlImage()  %>" style="width:90%;margin-bottom:50px;"  />		
			<div>Détails : <br />
			<%= problem.getDetails() %></div><br /><br />

			<a href="/increLike"><span class="glyphicon glyphicon-thumbs-up"></span></a>
			<%
			String message = (String) session.getAttribute("msg");
  			if( message != null )
  			{
  			%>
  				<%= message %>
  			<%  message = ""; session.setAttribute("msg", message);}%>
			<%= problem.getLike() %>
			<%
			if(problem.isConfirme())
			{
			%>
			Incident confirmé !
			<%
			}
			%>
			</div>
			</section>
			
			<section class="col-sm-7">
			<div id="map"></div>	
			</section>	
			
		</div>	
       </div> 
       <form>
       	<input type="hidden" id="latitude" name="latitude" value="<%= problem.getLng() %>">
	   	<input type="hidden" id="longitude" name="longitude" value="<%= problem.getLat() %>">
       </form>
       
       <script type="text/javascript">
        var geocoder;
        var map;
        var latitude = document.getElementById("latitude").value;
        var longitude = document.getElementById("longitude").value;
        
        
        //Initialisation de la map
        function initMap()
        {        	
        	geocoder = new google.maps.Geocoder();
        	// Carte centrée sur Nantes

            var latlng = new google.maps.LatLng(longitude, latitude);
            var myOptions = {
                zoom: 15,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            
            //Création de la carte
            map = new google.maps.Map(document.getElementById("map"), myOptions); 
            placeMarker(latlng);         
        }

        
        //Placement des markers existants
        function placeMarker(location){
        	var myMarkerImage = new google.maps.MarkerImage('/bootstrap/img/darkgreen_MarkerS.png');
            var marker = new google.maps.Marker({
                position: location, 
                map: map,
    	    	icon: myMarkerImage,
    	    	title: "Incident"
            });
            
            var contentString =
            '<p><b>Coordonnées GPS du problème : </b>'+ marker.position +'</p>';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });
            
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
              });
        }        
    </script>   
    </body>
</html>
