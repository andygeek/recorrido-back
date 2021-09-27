class PriceAlertsController < ApplicationController 
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: "Record not found"}, status: :bad_request
  end

  # GET /price_alerts
  def index
    @price_alerts = PriceAlert.all
    render json: @price_alerts, status: :ok
  end

  # GET /price_alerts/find_by_userid/:id
  def find_by_userid
    @user = User.find(params[:id])
    if @user
      @price_alerts = PriceAlert.where(:user_id => params[:id]).all
      render json: @price_alerts, status: :ok
    end
  end

  # POST /price_alerts
  def create
    @price_alert = PriceAlert.create(create_params)
    render json: @price_alert, status: :ok
  end

  # DELETE /price_alerts/:id
  def destroy
    @price_alert = PriceAlert.find(params[:id])
    @price_alert.destroy
    render json: {action: "Record deleted"}, status: :ok
  end

  private
  
  def create_params
    params.require(:price_alert).permit(:name, :origin_id, :origin_name, :origin_url_name, :destiny_id, :destiny_name, :destiny_url_name, :class_id, :class_name, :price, :user_id)
  end

end