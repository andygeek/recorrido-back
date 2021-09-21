class PriceAlertsController < ApplicationController 
  

  # GET /price_alerts
  def index
    @price_alerts = PriceAlert.all
    render json: @price_alerts, status: :ok
  end
end