Rails.application.routes.draw do
  devise_for :userrails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#show'
end
