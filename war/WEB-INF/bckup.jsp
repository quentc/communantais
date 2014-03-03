<script type="text/javascript">       
       window.onload = function() {
    	   var markersArray = [];
   	   var myLatlng = new google.maps.LatLng(47.2180551,-1.558236,13);
      
	   // Carte centrée sur Nantes, zoom 13
	   var myMapOptions = {
	  	zoom: 13,
	  	center: myLatlng,
	  	mapTypeId: google.maps.MapTypeId.ROADMAP
	   };
	   
	  // Création de la carte
	  var myMap = new google.maps.Map(
	  	document.getElementById('map'),
	  	myMapOptions
	  	);
    
	    var myMarkerImage = new google.maps.MarkerImage('/bootstrap/img/A17.gif');
	    
	    // Création du Marker
	    var myMarker = new google.maps.Marker({
	    	// Coordonnées du cinéma
	    	position: myLatlng,
	    	map: myMap,
	    	icon: myMarkerImage,
	    	title: "Incident : feu de signalisation"
	    });
	    
	 // Options de la fenêtre
	    var myWindowOptions = {
	    	content:
	    	'<h6>Incident feu de signalisation</h6>'+
	    	'<p><a href="#" title="Voir incident">Voir incident</a></p>'
	    };
	 
 // Création de la fenêtre
    var myInfoWindow = new google.maps.InfoWindow(myWindowOptions);
 
 // Affichage de la fenêtre au click sur le marker
    google.maps.event.addListener(myMarker, 'click', function() {
    	myInfoWindow.open(myMap,myMarker);
    });
 
    // add a click event handler to the map object
    google.maps.event.addListener(myMap, "click", function(event)
    {
    	alert("1");
        // place a marker
        placeMarker(event.myLatlng);
        // display the lat/lng in your form's lat/lng fields
        alert("7");
        document.getElementById("latFld").value = event.myLatlng.lat();
        document.getElementById("lngFld").value = event.myLatlng.lng();
    });

    function placeMarker(location) {
        // first remove all markers if there are any
        alert("2");
        deleteOverlays();
        alert("6");

        var marker = new google.maps.Marker({
            position: location, 
            map: myMap
        });

        // add marker in markers array
        markersArray.push(marker);

        //map.setCenter(location);
    }
    
    // Deletes all markers in the array by removing references to them
    function deleteOverlays() {
        alert("3");
        if (markersArray) {
        	alert("4");
            for (i in markersArray) {
                markersArray[i].setMap(null);
                alert("5");
            }
        markersArray.length = 0;
        }
    }
    
    }
       </script>      