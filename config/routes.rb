Rails.application.routes.draw do

  root to: 'home#top'
  get '/home/about'=> "home#about",as: "about"
  devise_for :users
  resources :books, only: [:new, :show, :index, :edit, :create, :destroy,:edit,:update]
  resources :users, only: [:edit, :show,:index,:update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
