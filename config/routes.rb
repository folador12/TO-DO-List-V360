Rails.application.routes.draw do
  resources :categories
  resources :lists do
    resources :items
  end
  root "lists#index"
end
