<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/includes/menu_top.jsp" />
    <body onload="initMap()">
      <input id="address-input" type="textbox" value="Tour de Bretagne, Nantes">
      <input id="rechercher-input" type="button" value="Rechercher" onclick="codeAddress()">        
      <div id="map"></div>        
    <div class="container">    
        <div>
            <form method="get" action="creationProblem">
                <fieldset>
                    <legend>Informations sur le problème</legend>
     
    				<div class="input-group col-lg-3">
                    <input type="text" id="sujet" class="form-control" placeholder="Sujet" name="sujet" value="" size="20" maxlength="20" />
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
                    	<input type="email" id="email" class="form-control" placeholder="Email" name="email" value="" size="20" />                    	                    	
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
                    
                    <input type="text" id="latFld">
    				<input type="text" id="lngFld">
                    
                </fieldset>
                <input type="submit" value="Valider"  />
                <input type="reset" value="Reinitialiser" /> <br />
            </form>
        </div>
       </div>       
       <script type="text/javascript">
        var geocoder;
        var map;
        var markersArray = [];

        function initMap()
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
            
            // Ajout d'un event click sur la map
            google.maps.event.addListener(map, "click", function(event)
            {
                //Ajout du marker
                placeMarker(event.latLng);

                //Ajout les lat/lng dans les champs correspondants du formulaire
                document.getElementById("latFld").value = event.latLng.lat();
                document.getElementById("lngFld").value = event.latLng.lng();
            });
            
            // Create the search box and link it to the UI element.
              var inputAdresse = document.getElementById('address-input');
        	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(inputAdresse);
        	  var rechercherButton = document.getElementById('rechercher-input');
        	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(rechercherButton);
        	  
         //   var input = /** @type {HTMLInputElement} */(
           //     document.getElementById('pac-input'));
            //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
            
            //var searchBox = new google.maps.places.SearchBox(
            	    /** @type {HTMLInputElement} *///(input));
            
            
            
            
        }
        
        
        function placeMarker(location) {
            //On supprime d'abord les markers existants si il y en a
            deleteOverlays();
            //var myMarkerImage = new google.maps.MarkerImage('/bootstrap/img/A17.gif');
            var marker = new google.maps.Marker({
                position: location, 
                map: map,
    	    	//icon: myMarkerImage,
    	    	title: "Incident : feu de signalisation"
            });

            //Ajout du marker dans le tableau
            markersArray.push(marker);

            //map.setCenter(location);
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
        	      markersArray.push(marker);   
        	              	      
        	      //Replace() des coordonnées de l'adresse recherchée pour enlever les parenthèses
        	      var temp1 = coordinates.toString.replace('(', '');
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
    </script> 
    </body>
</html>