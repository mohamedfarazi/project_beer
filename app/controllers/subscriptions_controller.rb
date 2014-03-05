class SubscriptionsController < ApplicationController

	before_filter :load_plans

	def index
	end

	def show
		@subscription = Subscription.find(params[:id])
	end

	def new
		@subscription = Subscription.new
	end

	def create
		@subscription = Subscription.new
		@subscription.user = current_user
		@subscription.first_delivery_date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
		@subscription.plan_id = params[:plan_id]
		@subscription.n_packs = params[:n_packs]


			if @subscription.save
				UserMailer.subscription_confirm(current_user).deliver
				redirect_to subscription_path(@subscription), :notice => "Success!"
			else
			  render 'new'
		  end
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
