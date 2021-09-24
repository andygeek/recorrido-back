require 'faraday'
require 'faraday_middleware'
require 'json'

namespace :recorrido_tasks do
  desc "TODO"
  task check_prices: :environment do

    url = "https://demo.recorrido.cl/api/v2/es/bus_travels.json"
    connection = Faraday.new(url: url) do |conn|
      conn.request :basic_auth, 'recorrido', 'recorrido'
      conn.request :json
    end

    body = { 
      bus_travel: {
        departure_city_id: 9333,
        destination_city_id: 9360,
        departure_date: '01-01-2050'
      }
    }

    response = connection.post('') do |req|
      req.body = body.to_json
    end

    Rails.logger.info "response -------- #{response.body}"
  end

end
