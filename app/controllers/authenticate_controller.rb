class AuthenticateController < ApplicationController
  def login
    if request.post?
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user.get_home_dashboard, notice: "Login Great Success"
      else
        flash[:notice] = "Incorrect login information.  Please try again"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
