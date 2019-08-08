Rails.application.routes.draw do

  resources :categories do
  	resources :comments
  end
  resources :category_posts do
    resources :comments
  end

  root "categories#index"
end
