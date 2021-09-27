Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :price_alerts

  get "/users" => "users#index"

  get "/users/dashboard" => "users#dashboard"

  # Search for price alerts by user id
  get "/price_alerts/find_by_userid/:id" => "price_alerts#find_by_userid"

  post "/users/signup" => "users#signup"

  post "/users/login" => "users#login"

  post "/price_alerts" => "price_alerts#create"

  get "/cities" => "cities#index"

  get "/min_prices/:id" => "min_prices#find_by_id"

  post "/external_web" => "external_webs#index"

  put "/price_alerts/:id" => "price_alerts#update"
end
