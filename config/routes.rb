Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :items do
        get "/:id/merchant", to: 'merchant#show'
        get "/find", to: 'search#show'
        get "/find_all", to: 'search#index'
      end

      namespace :merchants do
        get "/:id/items", to: 'items#index'
        get "/find", to: 'search#show'
        get "/find_all", to: 'search#index'
        get "/most_revenue", to: 'revenue#index'
        get "/:id/revenue", to: 'revenue#show'
      end

      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
