class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def authenticate
    redirect_to login_path, notice: "Please Login First" unless session[:user_id]
  end

  private def authorize_teacher
    redirect_to :back, notice: "You don't have permission to access that page." unless session[:role_name] == "Teacher"
  end
end
