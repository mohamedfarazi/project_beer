Rails.configuration.stripe = {
	:publishable_key => 'pk_test_m8oTRM7hCHFrzE20ecJOLqWv',
	:secret_key => 'sk_test_J0goqaBfrdlBeXug3M1anLTV'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]