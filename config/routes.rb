Rails.application.routes.draw do

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  root 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  get 'sessions/new'
  resources :microposts,          only: [:create, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :comments,            only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]

  
end