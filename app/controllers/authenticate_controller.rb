class AuthenticateController < ApplicationController
  def new
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

  def destroy
    session[:user_id] = nil
    session[:role_name] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
