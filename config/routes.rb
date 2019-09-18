Rails.application.routes.draw do
  get 'sessions/new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :comments,            only: [:create, :destroy]
  root 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  resources :microposts,          only: [:create, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations, only: [:edit]


  
end