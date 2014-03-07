class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create, :activate]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
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

        # redirect_to @user, notice: 'User was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
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
      params.require(:user).permit(:email, :password, :password_confirmation, :address, :postal_code, :phone, :contact_name, :company_name, :admin)
    end

end
