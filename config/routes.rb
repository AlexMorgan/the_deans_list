Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root "pages#home"
  resources :users, only: [:index, :show, :edit, :update]
  resources :girls
  resources :sales
  resources :locations
  resources :contact_forms, only: [:new, :create]
  get '/paypal' => 'pages#paypal'
  # For Stripe CC Processing
  resources :charges, except: :new
end
