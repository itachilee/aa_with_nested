Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :answers
  resources :questions
  resources :surveys
  resources :survers
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
