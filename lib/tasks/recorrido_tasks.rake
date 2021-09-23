namespace :recorrido_tasks do
  desc "TODO"
  task check_prices: :environment do
    url = "https://v2.jokeapi.dev/joke/Any"
    response = RestClient.get(url)
    Rails.logger.info "my task is working -------- #{response}"
  end

end
