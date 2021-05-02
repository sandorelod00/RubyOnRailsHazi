class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user] = 'Successful registration'
      session[:user] = @user.id
      redirect_back fallback_location: projects_path
    else
      flash[:user] = @user.errors.messages
      redirect_to "users/new"
    end
  end

  def edit
    @user = User.find(session[:user])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Update_successful"
    else
      flash[:user] = "Could_not_update_profile"
    end
    redirect_back fallback_location: edit_profile_path
  end

  def show
    @pageId = params[:id]
    @user = User.find(params[:id])
    @comments = Comment.where(toUserId: @pageId)
    allUsers = User.all
    @allUserIdNameMap = Hash.new
    allUsers.each do |user|
      @allUserIdNameMap[user.id] = user.name
    end
  end

  def forgotten
  end

  def send_forgotten
  end

  private
  def user_params
    params.require(:user).permit([:name,:email, :password, :phone])
  end
end
