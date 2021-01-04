Rails.application.routes.draw do

  root 'blog#index'
  get 'about' , to: 'blog#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users , except: [:new]
end
