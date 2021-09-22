Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :price_alerts

  # Search for price alerts by user id
  get "/price_alerts/find_by_userid/:id" => "price_alerts#find_by_userid"

  # Search for price alerts by user id
  post "/users/signup" => "users#signup"
end
