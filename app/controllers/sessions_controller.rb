class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You are successfully signed in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
    # byebug
  end

  def destroy
    session[:user_id] = nil
    flash[:sucess] = "You have been logged out"
    redirect_to login_path
  end
end
