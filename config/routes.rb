Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
  root "pages#home"

  resources :girls
  resources :contact_forms, only: [:new, :create]
  # For Stripe CC Processing
  resources :charges, except: :new
end
