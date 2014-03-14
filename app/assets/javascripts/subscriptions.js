jQuery(document).ready(function($) {

	$('.no-packs').change(function(event) {
		var _this = $(this),
			basePrice = parseInt(_this.data('price'), 10);


		_this.closest('.upborder-div').find('.subscr-total > strong').html("Total monthly cost: $" +(basePrice + ((_this.val() - 1) * basePrice)));

		$('.stripe-button').attr('data-amount', (basePrice + ((_this.val() - 1) * basePrice))*100);
	});

	$('.deliv-date').change(function(event) {
		var _this = $(this)
			basePrice = parseInt(_this.data('price'), 10),
			no_packs = _this.siblings('.no-packs').val();


		_this.closest('.upborder-div').find('.subscr-total > strong').html("Total monthly cost: $"+(basePrice + ((no_packs - 1) * basePrice)));

		$('.stripe-button').attr('data-amount', (basePrice + ((no_packs - 1) * basePrice))*100);
	});


});
