Rails.application.routes.draw do
  resources :categories
  resources :lists
  root "lists#index"
end
