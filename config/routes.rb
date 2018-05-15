Rails.application.routes.draw do
  resources :artists
  resources :records
  root to: 'records#index'
end
