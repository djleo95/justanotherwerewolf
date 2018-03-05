Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homepage#show", page: "home"
  get "/pages/:page" => "homepage#show"
  resources :rooms, :gameusers
  post "rooms/create_message" => "rooms#create_message"
end
