class UsersController < ApplicationController
  before_action :setup_user, only: [:show, :edit, :update]
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

    if user.save
      flash.now[:success] = "Hi {#@user.first_name}, your account has been created"
      ApplicationMailer.welcome_email(user).deliver_now
      redirect_to users_path
    else
      flash[:warning] = "Please enter valid user details"
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)

    if @user.save
      flash.now[:success] = 'Your profile has been updated'
      redirect_to user_path @user
    else
      flash.now[:danger] = 'Invalid entry'
      redirect_to edit_user_path @user
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash.now[:success] = '#{user.username} has been deleted'
    redirect_to signin_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :employer, :username, :password)
  end

  def setup_user
    @user = User.find(params[:id])
  end
end
