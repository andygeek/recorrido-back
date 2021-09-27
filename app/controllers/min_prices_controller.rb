class MinPricesController < ApplicationController

  # GET /min_prices/:id
  def find_by_id
    @min_prices = MinPrice.where(:price_alert_id => params[:id]).all
    if @min_prices
      render json: @min_prices, status: :ok
    end
  end 
end
