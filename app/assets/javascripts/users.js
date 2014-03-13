$(document).ready(function(){

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
	// setTimeout( function() {
	// 	cbpFixedScrollLayout.init();
	// }, 5000);

});