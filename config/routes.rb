Rails.application.routes.draw do
  root 'static_pages#home'
  #get "doctors#index"
   
  resources :users
  resources :doctors do 
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
