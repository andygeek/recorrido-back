class PriceAlertsController < ApplicationController 
  

  # GET /price_alerts
  def index
    @price_alerts = PriceAlert.all
    render json: @price_alerts, status: :ok
  end

  # GET /price_alerts/find_by_userid/:id
  def find_by_userid
    @price_alerts = PriceAlert.where(:user_id => params[:id]).all
    render json: @price_alerts, status: :ok
  end

  # POST /price_alerts
  def create
    @price_alert = PriceAlert.create(create_params)
    render json: @price_alert, status: :ok
  end

  private
  
  def create_params
    params.require(:price_alert).permit(:name, :origin_id, :destiny_id, :class_id, :price, :user_id)
  end

end