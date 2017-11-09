Rails.application.routes.draw do
  devise_for :users
  
  root 'welcome#index'
  
  resources :dashboard
  resources :posts
  resources :courses do
    resources :syllabuses
    resources :assignments
    resources :faqs
    resources :activities
  end
  
  namespace :admin do
    resources :posts
    resources :courses
  end
end
