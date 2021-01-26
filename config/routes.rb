Rails.application.routes.draw do

  devise_for :users
  root to: 'contents#index'

  get 'illusts', to: 'illusts#index'
  get 'comics', to: 'comics#index'
  get 'piyocomics', to: 'piyocomics#index'

  resources :users
  resources :contents
  resources :illusts
  resources :comics
  resources :piyocomics


end