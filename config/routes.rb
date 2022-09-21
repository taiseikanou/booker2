Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about",as: "about"
  resources :books, only: [:new, :show, :index, :edit, :create, :destroy,:edit,:update]
  resources :users, only: [:edit, :show,:index,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
