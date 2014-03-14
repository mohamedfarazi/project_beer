$(document).ready(function(){
	if ( $('#cbp-fbscroller') ) {
		var options = {
			// the cbp-fbscroller's sections
			$sections : $( '#cbp-fbscroller > section' ),
			// the navigation links
			$navlinks : $( '#cbp-fbscroller > nav:first > a' ),
			// index of current link / section
			currentLink : 0,
			// the body element
			$body : $( 'html, body' ),
			// the body animation speed
			animspeed : 650,
			// the body animation easing (jquery easing)
			animeasing : 'easeInOutExpo'
		};

		cbpFixedScrollLayout.init( options );
	}
});

jQuery(document).ready(function($) {
	function initialize() {
	  var mapDiv = document.getElementById('map-canvas');

	  if ( mapDiv ) {
		  var map = new google.maps.Map(mapDiv, {
		    center: new google.maps.LatLng(43.652481,-79.379236),
		    zoom: 13,
		    mapTypeId: google.maps.MapTypeId.ROADMAP,
		    disableDefaultUI: true,
		    scrollwheel: false,
		     navigationControl: false,
		     mapTypeControl: false,
		     scaleControl: false,
		     draggable: false,
		     setClickable: false
		  });

		  var paths = [new google.maps.LatLng(43.659886,-79.435332),
		    new google.maps.LatLng(43.630085, -79.424201),
		    new google.maps.LatLng(43.651483, -79.347189),
		    new google.maps.LatLng(43.67559, -79.361716),
		    new google.maps.LatLng(43.659886,-79.435332)];

		  var shape = new google.maps.Polygon({
	       paths: paths,
	       strokeColor: '#ff9900',
	       strokeOpacity: 0.8,
	       strokeWeight: 2,
	       fillColor: '#ff9900',
	       fillOpacity: 0.35
	       });

	       shape.setMap(map);
	  }
	}

  google.maps.event.addDomListener(window, 'load', initialize);
});

///Need to disable zoom still.