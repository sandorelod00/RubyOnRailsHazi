class ApplicationController < ActionController::Base
  before_action :find_user

  private
  def find_user
    @user = User.find session[:user] if session[:user]
  end
end
