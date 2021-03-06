class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to "/welcome"
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    log_out
    redirect_to "/login"
  end
end
