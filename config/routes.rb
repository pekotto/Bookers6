Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  resources :users,only: [:show,:index,:edit,:update] do
  	member do
      get :following, :followers
    end
  end
  get '/search' => 'search#search', as: 'search'

end