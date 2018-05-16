Rails.application.routes.draw do
  resources :artists do
    member do
      get 'records', to: 'records#index_by_artist'
    end
  end
  resources :records
  root to: 'records#index'
end
