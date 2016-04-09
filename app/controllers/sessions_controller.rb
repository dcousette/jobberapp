class SessionsController < ApplicationController
  def new 
  end 
  
  def create
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Login successful'
      redirect_to user_path(user)
    else 
      flash.now[:danger] = 'Please re-enter your username/password'
      render :new
    end 
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logout successful'
    redirect_to signin_path
  end 
end 
