Rails.application.routes.draw do
  resources :recipes
  root to: "pages#index"
end
