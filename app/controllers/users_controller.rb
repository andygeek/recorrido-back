class UsersController < ApplicationController

  # GET /users/singup
  def signup
    @user = User.create(signup_params)
    render json: @user, status: :ok
  end

  private 

  def signup_params
    params.require(:user).permit(:name, :username, :password)
  end
end