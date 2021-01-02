Rails.application.routes.draw do

  root 'blog#index'
  get 'about' , to: 'blog#about'
end
