Rails.application.routes.draw do
  root "home_pages#home"
  get 'home_pages/home'
  get 'home_pages/admin'
  get 'home_pages/member'
end
