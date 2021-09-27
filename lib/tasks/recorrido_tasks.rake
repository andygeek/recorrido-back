require 'faraday'
require 'faraday_middleware'
require 'json'

namespace :recorrido_tasks do
  
  desc "TODO"

  task search_price: :environment do
    
    # Get the list of PriceAlerts
    @price_alerts = PriceAlert.all
    # We create the search for each alert
    @price_alerts.each do |x|

      body = { 
        bus_travel: {
          departure_city_id: x.origin_id,
          destination_city_id: x.destiny_id,
          departure_date: Time.now.strftime("%d-%m-%Y")
        }
      }
      
      # Seach body
      obj_search = create_search(body)
      
      # Request until the search is completed
      if polling_progress_request(obj_search['search_progres_url']) == "complete"
        
        # Response of the search
        obj_result_search = result_search(obj_search["id"])

        # Array of results
        arr_result_search = obj_result_search['outbound']['search_results']

        if arr_result_search.size > 0

          # Result with minimum price
          min_result = arr_result_search.min_by {|x| x['price']}

          # Search the database for matches
          @exist_min_price = MinPrice.where(:search_result_id => min_result['id'], :price_alert_id => x[:id]).first

          if !@exist_min_price.present?
            
            # Add to the database
            MinPrice.create(search_result_id: min_result['id'], date_departure: Time.parse(min_result['departure_time']).strftime("%Y-%m-%d"), hour: Time.parse(min_result['departure_time']).strftime("%H:%M"), class_id: min_result[:seat_klass_stars], class_name: min_result[:seat_klass], min_price: min_result[:price], buss_operator_name: min_result[:bus_operator_name], price_alert_id: x[:id])
          
          else
            Rails.logger.info "Already exists in the database"
          end

        else
          Rails.logger.info "There is no array result"
        end

      else
        Rails.logger.info "A complete was not returned"
      end
    end
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
  
  # Create search
  def create_search(body)
    response = connection_api.post('/api/v2/es/bus_travels.json') do |req|
      req.body = body.to_json
    end
    return JSON.parse(response.body)
  end

  # Polling for search progress
  def polling_progress_request(url)
    retry_options = {
      max: 6,
      interval: 1,
      retry_if: -> (env, _exc) { env.body[:progress_status] == 'complete' }
    }
    conn_progress = Faraday.new(url: url) do |conn|
      conn.request :basic_auth, 'recorrido', 'recorrido'
      conn.request :retry, retry_options
    end
    # Responde cuando se completa la busqueda
    response = conn_progress.get('')
    status = JSON.parse(response.body)['progress_status']
    return status
  end

  # Search result
  def result_search(id)
    response = connection_api.get("/api/v2/es/bus_travels/#{id}/search_results.json")
    return JSON.parse(response.body)
  end

end
