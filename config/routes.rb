Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: "pages#index"
  resources :articles
end
