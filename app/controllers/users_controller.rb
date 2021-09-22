class UsersController < ApplicationController

  # POST /users/singup
  def signup
    @user = User.create(signup_params)
    render json: @user, status: :ok
  end

  # POST /users/login
  def login
    @user = User.where(:username => login_params[:username], :password => login_params[:password]).first
    render json: @user, status: :ok
  end

  private 

  def signup_params
    params.require(:user).permit(:name, :username, :password)
  end

  def login_params
    params.require(:user).permit(:username, :password)
  end
end