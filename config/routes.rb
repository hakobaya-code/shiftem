Rails.application.routes.draw do
  get 'home_pages/home'
  get 'home_pages/admin'
  get 'home_pages/member'
  root "application#shiftem"
end
