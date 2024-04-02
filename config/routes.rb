Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new', as: 'login'
    post '/login', to: 'devise/sessions#create', as: 'sign_in'
    delete '/logout', to: 'devise/sessions#destroy', as: 'logout'
  end
  
  devise_scope :user do
    # カスタムセッションのルーティング
    get 'admin/login', to: 'admin/sessions#new', as: 'new_admin_session'
    post 'admin/login', to: 'admin/sessions#create', as: 'admin_session'
    delete 'logout', to: 'devise/sessions#destroy', as: 'destroy_admin_session'
  end

  namespace :admin do
    get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'
    resources :users
  end

  resources :attendances, only: [:create] do
    collection do
      get 'show_monthly_logs'
    end
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
  resources :attendances, only: [:create, :index] 
  resources :attendances do
    post 'undo', on: :collection
  end
  post 'undo_attendance', to: 'attendances#undo'
  post 'attendances/redo', to: 'attendances#redo', as: 'redo_attendance'
end