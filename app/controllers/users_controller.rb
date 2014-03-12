class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create, :activate]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
          if @user.check_postal_code
            @user.area = true
            @user.save
            redirect_to(user_path(@user), notice: 'User was successfully created.')
          else
            @user.area = false
            @user.save
            redirect_to(user_path(@user), alert: "We're sorry but you are currently outside the delivery area. But fear not! We will contact you when we have expanded to your area.")
          end
      else
        render action: 'new'
      end
  end

  def edit
  end

  def update
      if @user.update(user_params)
        if @user.check_postal_code
          @user.area = true
          @user.save
          redirect_to(user_path(@user), notice: 'User was successfully updated.')
        else
          @user.area = false
          @user.save
          redirect_to(user_path(@user), alert: "We're sorry but your new postal code is outside the delivery area. But fear not! We will contact you when we have expanded to your area.")
        end

      else
        render action: 'edit'
      end
  end


  def destroy
    @user.destroy
      redirect_to :back
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      auto_login(@user)
      redirect_to(root_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :address, :postal_code, :phone, :contact_name, :company_name)
    end

end
