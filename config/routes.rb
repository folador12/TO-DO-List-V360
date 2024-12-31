Rails.application.routes.draw do
  resources :categories
  resources :lists do
    resources :items, except: [ :index, :show ]  do
      member do
        patch :complete
      end
    end
  end
  root "lists#index"
end
