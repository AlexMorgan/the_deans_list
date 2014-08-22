Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
  root "pages#countdown"

  resources :girls
  resources :contact_forms, only: [:new, :create]
  get '/paypal' => 'pages#paypal'
  # For Stripe CC Processing
  resources :charges, except: :new
end
