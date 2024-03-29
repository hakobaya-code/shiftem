Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    get '/login', to: 'devise/sessions#new', as: 'login'
    post '/login', to: 'devise/sessions#create', as: 'sign_in'
    delete '/logout', to: 'devise/sessions#destroy', as: 'logout'
  end

  root "home_pages#home"
  get "/home", to: "home_pages#home", as: 'home'
  get "/admin", to: "home_pages#admin", as: 'admin'
  get "/member", to: "home_pages#member", as: 'member'
  get "/signup", to: "users#new", as: 'signup'
  get '/dashboard', to: 'dashboard#dashboard', as: 'dashboard'
  get '/attendance', to: 'attendances#create', as: 'attendance'
  post '/sognup', to: 'devise/sessions#create', as: 'sign_up'

  resources :users
  resources :attendances, only: [:create]
end