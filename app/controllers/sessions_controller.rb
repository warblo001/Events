class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Name is invalid'
      render 'new'
    end
  end

  def destroy
    user = User.find_by(params[:username])
    if user
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out!'
    else
    flash.now.alert = 'Could not log out'
    render 'new'
    end
  end
end
