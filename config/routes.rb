Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :items do
        #item's merchant
        get "/:id/merchant", to: 'merchant#show'

        #search by attribute
        get "/find", to: 'search#show'
        get "/find_all", to: 'search#index'
      end

      namespace :merchants do
        #merchant items
        get "/:id/items", to: 'items#index'

        #search by attribute
        get "/find", to: 'search#show'
        get "/find_all", to: 'search#index'

        #revenue
        get "/most_revenue", to: 'revenue#index'
        get "/:id/revenue", to: 'revenue#show'

        #most items sold
        get "/most_items", to: 'items_sold#index'
      end

      resources :revenue, only: [:index]
      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
