Rails.application.routes.draw do
  root to: 'homes#top'
  get 'books/top'
  get 'homes/top'
  devise_for :users

  get 'books/my_books/:user_id', to: 'books#my_books', as: 'my_books'

  resources :users, only: [:show, :index, :edit, :update, :create]
  

  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]


  get "homes/about" => "homes#about", as: "about"


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
