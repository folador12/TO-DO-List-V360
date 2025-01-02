Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create ]
  resources :categories, except: [ :show, :new ]
  resources :lists do
    resources :items, except: [ :index, :show ]  do
      member do
        patch :complete
      end
    end
  end
  root "lists#index"
end
