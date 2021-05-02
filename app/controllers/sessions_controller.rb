class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate params[:email], params[:password]
    if @user
      session[:user] = @user.id
      flash[:notice] = "Successful_login"
    else
      flash[:notice] = "Invalid_email_address_or_password"
    end
    redirect_back fallback_location: projects_path
  end

  def destroy
    reset_session
    flash[:notice] = "Successful_logout"
    redirect_back fallback_location: projects_path
  end
end
