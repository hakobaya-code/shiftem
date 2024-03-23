Rails.application.routes.draw do
  root "home_pages#home"
  get "/home", to: "home_pages#home", as: 'home'
  get "/admin", to: "home_pages#admin", as: 'admin'
  get "/member", to: "home_pages#member", as: 'member'
  get "/signup", to: "users#new", as: 'signup'
end
