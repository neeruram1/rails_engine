Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :items do
        get "/:id/merchant", to: 'merchant#show'
      end

      namespace :merchants do
        get "/:id/items", to: 'items#index'
      end

      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
