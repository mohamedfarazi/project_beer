jQuery(document).ready(function($) {
	$('[data-price]:radio').click(function(event) {
		var _this = $(this);

		//1- check if radio button is checked
		if ( _this.is(':checked') ) {
			//2- if it's checked, then fetch the price associated.
			//3- i need to set the data-amount attr  on stripe-button
			$('.stripe-button').attr('data-amount', _this.attr('data-price'));
		}
	});
});
