Rails.application.routes.draw do
  resources :users do


  # namespace :users do
  root "users#index"
  collection {post :import}
  # end
  #
  # namespace :adminmin do
  #   root "adminmin#index"
  # end

  # old
  # root to: 'users#index'
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end