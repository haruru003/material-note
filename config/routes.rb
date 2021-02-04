Rails.application.routes.draw do

  devise_for :users
  root to: 'contents#index'

  get 'illusts', to: 'illusts#index'
  get 'comics', to: 'comics#index'
  get 'piyocomics', to: 'piyocomics#index'
  get 'users', to: 'users#index'

  resources :users
  resources :contents
  
  resources :comics
  resources :piyocomics
  resources :illusts do
    collection do
      get 'search'
    end
  end


end