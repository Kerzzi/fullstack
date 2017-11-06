Rails.application.routes.draw do
  devise_for :users
  
  resources :posts
  root 'posts#index'
  
  resources :dashboard
  resources :courses
  
  namespace :admin do
    resources :posts
  end
end
