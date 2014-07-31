Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
  root "pages#home"
end
