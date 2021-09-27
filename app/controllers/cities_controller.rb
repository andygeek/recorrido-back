class CitiesController < ApplicationController

  # GET /cities
  def index
    response = connection_api.get("/api/v2/es/cities.json?country=chile")
    render json: JSON.parse(response.body), status: :ok
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
  
end

