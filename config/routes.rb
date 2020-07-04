Rails.application.routes.draw do

  root "users#index"

  resources :users do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
end