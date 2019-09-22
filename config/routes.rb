Rails.application.routes.draw do
  resources :tasks
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end
