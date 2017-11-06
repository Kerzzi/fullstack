Rails.application.routes.draw do
  devise_for :users
  
  root 'posts#index'
  
  resources :dashboard
  resources :posts
  resources :courses
  
  namespace :admin do
    resources :posts
    resources :courses
  end
end
