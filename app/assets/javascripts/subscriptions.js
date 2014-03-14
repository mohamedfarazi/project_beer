jQuery(document).ready(function($) {
	// $('[data-price]:radio').click(function(event) {
	// 	var _this = $(this);

	// 	//1- check if radio button is checked
	// 	if ( _this.is(':checked') ) {
	// 		//2- if it's checked, then fetch the price associated.
	// 		//3- i need to set the data-amount attr  on stripe-button
	// 		$('.stripe-button').attr('data-amount', _this.attr('data-price'));
	// 	}
	// });

	$('.no-packs').change(function(event) {
		var _this = $(this),
				basePrice = parseInt(_this.data('price'), 10);

		_this.closest('.upborder-div').find('.subscr-total > strong').html("Total monthly cost: $" +(basePrice + ((_this.val() - 1) * basePrice)));
	});

	$('.deliv-date').change(function(event) {
		var _this = $(this);
		var basePrice = parseInt(_this.data('price'), 10);
		var no_packs = _this.siblings('.no-packs').val();

		_this.closest('.upborder-div').find('.subscr-total > strong').html("Total monthly cost: $"+(basePrice + ((no_packs - 1) * basePrice)));
	});

});
