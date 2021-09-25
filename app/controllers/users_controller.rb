class UsersController < ApplicationController

  # Signup does not require authentication
  skip_before_action :authenticate!, only: [:signup, :login]

  rescue_from ActionController::ParameterMissing do |e|
    render json: {error: "No parameters found"}, status: :bad_request
  end

  # GET /users
  def index
    users = User.all
    render json: users.as_json(json_options)
  end

  # POST /users/singup
  def signup
    @user = User.find_by(email: signup_params[:email])
    if @user
      render json: { error: "User already exists" }, status: :bad_request    
    else
      new_user = User.new(signup_params)
      if new_user.save
        time = Time.now + 24.hours.to_i
        token = JsonWebToken.encode({user_id: new_user.id}, time)
        render json: { token: token, exp: time.strftime( "%d-%m-%Y %H:%M"), name:new_user.name, email: new_user.email }, status: :ok
      else
        render json: { error: new_user.errors.message }, status: :bad_request 
      end
    end
  end

  # POST /users/login
  def login

    @user = User.find_by(email: login_params[:email])

    # Thanks to bycript
    if @user&.authenticate(login_params[:password])
      
      # Token die in 24 hours
      time = Time.now + 24.hours.to_i
      # Encode the user_id in the token
      token = JsonWebToken.encode({user_id: @user.id}, time)
      
      render json: { token: token, exp: time.strftime( "%d-%m-%Y %H:%M"), email: @user.email }
    else
      render json: { error: "unauthorized" }, status: :forbidden    
    end
  end

  private 
  # TO-DO : Switch to active_model_serializers
  def json_options
    { except: %i[created_at updated_at password_digest] }
  end

  def signup_params
    params.require(:user).permit(:name, :email, :password)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end