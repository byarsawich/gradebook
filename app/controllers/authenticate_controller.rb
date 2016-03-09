class AuthenticateController < ApplicationController
  before_action :authenticate, only: [:edit, :update]

  def new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:role_name] = user.role_name
      redirect_to user.get_home_dashboard, notice: "Login Great Success"
    else
      flash.now[:alert] = "Incorrect login information.  Please try again"
      render :new
    end
  end

  def update
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      user.update(password: user_params[:new_password])
      redirect_to root_path, notice: "Password has been changed"
    else
      flash.now[:alert] = "Old Password Does Not Macth!"
      render :edit
    end
  end

  def destroy
    session[:user_id] = nil
    session[:role_name] = nil
    redirect_to login_path, notice: "Logged out"
  end

  private def user_params
    params.require(:form_fields).permit(:email, :password, :new_password)
  end
end
