Rails.application.routes.draw do

  get 'books/top'
  get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  
  resources :post_image, only: [:new, :create, :index, :show]

  get "homes/abouy" => "homes#about", as: "about"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
