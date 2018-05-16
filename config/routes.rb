Rails.application.routes.draw do
  resources :artists do
    member do
      get 'records', to: 'records#index_by_artist'
    end
    collection do
      get 'overview_csv', to: 'artists#overview_csv', defaults: { format: :csv }
    end
  end
  resources :records
  root to: 'records#index'
end
