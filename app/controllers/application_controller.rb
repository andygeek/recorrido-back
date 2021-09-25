class ApplicationController < ActionController::API

  # Authentication is necessary to use this api
  before_action :authenticate!

  private

  def authenticate!
    # Get header of Authorization
    header = request.headers["Authorization"]
    
    # Authorization = bearer xxxx, we will use only xxx
    header = header.split(' ').last if header

    begin
      # Decoding token
      @decoded = JsonWebToken.decode(header)

      # Get user_id from token
      @current_user = User.find(@decoded[:user_id])

    rescue ActiveRecord::RecordNotFound => e

      render json: { error: e }, status: :unauthorized

    rescue JWT::DecodeError => e

      render json: { error: "Invalid token" }, status: :unauthorized

    end

  end
    
end
