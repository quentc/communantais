<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.google.appengine.api.blobstore.*" %>
<%@ page import="beans.Problem" %>
<%@ page import="java.util.ArrayList" %>
<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	ArrayList<String> varTableau = new ArrayList<String>();
	varTableau = (ArrayList<String>) request.getAttribute("tab") ;
%>
<!DOCTYPE html>
<html>

<jsp:include page="/includes/menu_top.jsp" />

    <body onload="initMap('<%=varTableau%>')">
    <div class="container">     
      <div class="row">
	     <div class="span4">   
	     	     <p><i>Les champs marqués d'une * doivent être remplis</i></p>
	            <form method="post" name="formAddProblem" action="creationProblem" onsubmit="return valider()" ><!--  enctype="multipart/form-data"-->
	                <fieldset>
	                    <legend>Informations sur le problème</legend>
	     
	    				<div class="input-group col-lg-3">
	                    <input type="text" id="sujet" class="form-control" placeholder="Sujet *" name="sujet" value="" size="20" maxlength="20" />
	                    </div>
	                    <br />
	                    
	                    <div class="input-group col-lg-3">
	              			<textarea class="form-control" id="details" placeholder="Details" name="details" rows="3"></textarea>
	          			</div>
	          			 <br />
	          
	    
	                    <label for="categorie">Catégorie</label>
	                    <div class="input-group col-lg-3">
	                    <select class="form-control" id="categorie" name="categorie">
	                        <option>Abribus</option>
	                        <option>Affichage sauvage</option>
	                        <option>Animaux</option>
	                        <option>Arbres</option>
	                        <option>Chaussée/Trottoirs</option>
	                        <option>Dépôt d'ordures</option>
	                        <option>Eclairage public</option>
	                        <option>Feux de signalisation</option>
	                        <option>Graffiti</option>
	                        <option>Nid-de-poule</option>
	                        <option>Parcs/Espaces verts</option>                       
	                        <option>Place de parking</option>
	                        <option>Plaques de rues</option>
	                        <option>Routes/Autoroutes</option>
	                        <option>Toilettes publiques</option>                         
	                        <option>Véhicule abandonné</option>
	                        <option>Autres</option>
	                    </select> 
	                    </div>                   
	                    <br />
	    
	                    <label for="photo">Photo</label>
	                    <!-- <input type="text" id="telephoneClient" name="telephoneClient" value="" size="20" maxlength="20" /> -->
	                    <input type="file" id="photo" name="photo" value="" width="20" />
	                    <br />
	                    
	                    <div class="input-group col-lg-3">
	                    	<span class="input-group-addon">@</span>
	                    	<input type="email" id="email" class="form-control" placeholder="Email *" name="email" value="" size="20" />                    	                    	
	                    </div>
	                    <br />
	                    
	                    <div class="input-group col-lg-3">                    
	                    <input type="text" id="nom" class="form-control" placeholder="Nom" name="nom" value="" size="20" maxlength="20" />                    
	                    </div>
	                    <br />
	                    
	                    <div class="input-group col-lg-3">                    
	                    <input type="text" id="telephone" class="form-control" placeholder="Telephone" name="telephone" value="" size="20" maxlength="20" />                    
	                    </div>
	                    <br />
	                    
	                    <input type="hidden" id="latFld" name="latFld">
	    				<input type="hidden" id="lngFld" name="lngFld">
	                    
	                </fieldset>
	                <input type="submit" value="Valider"  />
	                <input type="reset" value="Reinitialiser" /> <br />
	            </form>	             	    
	     </div>
	     <div class="span8">
	           <input id="address-input" type="textbox" value="Tour de Bretagne, Nantes">
		       <input id="rechercher-input" type="button" value="Rechercher" onclick="codeAddress()">        
		       <div id="map"></div> 
	     </div>
     </div>
   </div> 

       
    
       <script type="text/javascript">
        var geocoder;
        var map;
        var markersArray = [];
        var allMarkersArray = [];

        function loadMarkers(varTableau, map)
        {
        	var i;      	
        	//Suppression du premier et dernier caractère '['']'        
        	varTableau = varTableau.substring(1,varTableau.length-1);        	
        	var array = varTableau.split(",");
        	
            for(i=0 ; i < array.length; i = i + 2){
            	
                var latlng = new google.maps.LatLng(array[i],array[i+1]);
                placeAllMarkers(latlng);
                
            }
        	
        }
        
        function initMap(varTableau)
        {        	
          
        	geocoder = new google.maps.Geocoder();
        	// Carte centrée sur Nantes : LatLng(47.2180551,-1.558236,13), zoom 13
            var latlng = new google.maps.LatLng(47.2180551,-1.558236,13);
            var myOptions = {
                zoom: 13,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            
            //Création de la carte
            map = new google.maps.Map(document.getElementById("map"), myOptions);  
            // Create the search box and link it to the UI element.
            var inputAdresse = document.getElementById('address-input');
      	  	map.controls[google.maps.ControlPosition.TOP_LEFT].push(inputAdresse);
      	  	var rechercherButton = document.getElementById('rechercher-input');
      	  	map.controls[google.maps.ControlPosition.TOP_LEFT].push(rechercherButton);
            
            loadMarkers(varTableau, map);
            // Ajout d'un event click sur la map
            google.maps.event.addListener(map, "click", function(event)
            {
                //Ajout du marker
                placeMarker(event.latLng);

                //Ajout les lat/lng dans les champs correspondants du formulaire
                document.getElementById("latFld").value = event.latLng.lat();
                document.getElementById("lngFld").value = event.latLng.lng();
            });            
        }
        
        
        function placeMarker(location) {
            //On supprime d'abord les markers existants si il y en a
            deleteOverlays();
           
            var marker = new google.maps.Marker({
                position: location, 
                map: map,
    	    	//icon: myMarkerImage,
    	    	title: "Incident"
            });

            //Ajout du marker dans le tableau
            markersArray.push(marker);

            //map.setCenter(location);
        }
        
        function placeAllMarkers(location){
        	var myMarkerImage = new google.maps.MarkerImage('/bootstrap/img/darkgreen_MarkerS.png');
            var marker = new google.maps.Marker({
                position: location, 
                map: map,
    	    	icon: myMarkerImage,
    	    	title: "All markers"
            });

            //Ajout du marker dans le tableau
            allMarkersArray.push(marker);
            
            var contentString =
            '<p><b>'+ marker.position +'</b></p>'+
            '<a href="detailsProblem?coord='+marker.position+'">'+
            'Details</a> ';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });
            
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
              });
        }
        
        function codeAddress() {        	
        	  deleteOverlays();        	  
        	  var address = document.getElementById('address-input').value;
        	  geocoder.geocode( { 'address': address}, function(results, status) {
        	    if (status == google.maps.GeocoderStatus.OK) {
        	      var coordinates = results[0].geometry.location;
        	      map.setCenter(coordinates);
        	      var marker = new google.maps.Marker({
        	          map: map,
        	          position: coordinates
        	      });   
        	      //Ajout du marker dans le tableau
        	      markersArray.push(marker);   
   
        	      var strCoordinates = coordinates.toString();
        	      //Replace() des coordonnées de l'adresse recherchée pour enlever les parenthèses
        	      var temp1 = strCoordinates.replace('(', '');
        	      var temp2 = temp1.replace(')', '');
        	      //Split() des coordonnées pour différencier lat et lng
        	      var latlngStr = temp2.split(',', 2);
        	      var lat = parseFloat(latlngStr[0]);
        	      var lng = parseFloat(latlngStr[1]);    
        	      //Ajout les lat/lng dans les champs correspondants du formulaire
                  document.getElementById("latFld").value = lat;
                  document.getElementById("lngFld").value = lng;
        	      
        	    } else {
        	      alert('Geocode was not successful for the following reason: ' + status);
        	    }
        	  });
        }
        
        //Suppression de tous les markers du tableau en supprimant leurs références
        function deleteOverlays() {
            if (markersArray) {
                for (i in markersArray) {
                    markersArray[i].setMap(null);
                }
            markersArray.length = 0;
            }
        }
        
        function valider(){
        	  frm=document.forms['formAddProblem'];
        	  if(frm.elements['sujet'].value == "") {        	    
        	    alert("Erreur : le champ Sujet doit être rempli");
        	    return false;
        	  }
        	  else if(frm.elements['email'].value == "") {        	    
        	    alert("Erreur : le champ Email doit être rempli");
        	    return false;        		  
        	  }
        	  else if(frm.elements['latFld'].value == "" || frm.elements['lngFld'].value == "") {        	    
          	    alert("Erreur : veuillez localiser l'incident sur la carte");
          	    return false;        		  
          	  }
        	  else {
        		  return true;
        	  }
        	}
        
    </script> 
    </body>
</html>