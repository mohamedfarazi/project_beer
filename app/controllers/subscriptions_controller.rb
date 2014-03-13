class SubscriptionsController < ApplicationController

	before_filter :load_plans
	skip_before_filter :require_login, only:[:new]

	def index
		# NJ: the singular here is temporary. Needs to be rewritten to show all user's subscription (active/inactive) once Mo's summary logic is sorted out
		@subscription = current_user.subscription
	end

	def show
		# NJ: the singular here is temporary. Needs to be rewritten to show all user's subscription (active/inactive) once Mo's summary logic is sorted out
		@subscription = current_user.subscription
	end

	def new
		@subscription = Subscription.new
	end

	def create
		@plan = Plan.find(params[:subscription][:plan_id])

	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @plan.amount_in_cents,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

		@subscription = current_user.build_subscription(subscr_params)

		if @subscription.save
			UserMailer.subscription_confirm(current_user).deliver
			redirect_to subscription_path(@subscription)

			# redirect_to subscription_path(@subscription), :notice => "Success!"
		else
		  render 'new'
	  end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def load_plans
		@plans = Plan.all
	end

	def subscr_params
		params.require(:subscription).permit(:user_id, :plan_id, :first_delivery_date, :n_packs)
	end

end
