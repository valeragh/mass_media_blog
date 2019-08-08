Rails.application.routes.draw do

  resources :categories
  resources :category_posts

  root "categories#index"
end
