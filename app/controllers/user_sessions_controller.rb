class UserSessionsController < ApplicationController
skip_before_filter :require_login, except:[:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      if @user.admin
        redirect_to admin_dashboard_index_path
      else
        redirect_back_or_to(user_path(@user), notice: 'Login successful')
      end
    else
      flash.now[:alert] = "Login failed"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to(goodbye_path, notice: 'Logged out!')
  end
end