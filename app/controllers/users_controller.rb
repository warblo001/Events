class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    flash.notice = "User #{@user.username} successfully created!"
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
