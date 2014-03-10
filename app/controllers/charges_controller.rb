class ChargesController < ApplicationController
	def new
		@plan = Plan.find(params[:plan_id])
	end

	def create
	  # Amount in cents
	  @amount = @plan.amount_in_cents

	  customer = Stripe::Customer.create(
	    :email => 'projectbeer@beer.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
