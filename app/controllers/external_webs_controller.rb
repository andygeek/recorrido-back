class ExternalWebsController < ApplicationController

  # POST /external_web
  def index
    response = connection_api.get("/es/bus/#{web_params[:origin]}/#{web_params[:destiny]}/#{web_params[:date]}")
    render json: response.body, status: :ok
  end

  private

  # Connection
  def connection_api
    url = "https://demo.recorrido.cl"
    connection = Faraday.new(url: url) do |conn|
      conn.request :basic_auth, 'recorrido', 'recorrido'
      conn.request :json
    end
    return connection
  end
  
  def web_params
    params.require(:web).permit(:origin, :destiny, :date)
  end
end