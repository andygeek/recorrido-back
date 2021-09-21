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

end