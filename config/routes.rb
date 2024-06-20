Rails.application.routes.draw do

  root 'page#start'
  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'
  get 'login', to: 'user#login_form'
  post 'login', to: 'user#login'
  get '/mermaid', to: 'mermaid#index', as: 'mermaid'
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/logout', to: 'user#logout', as: :logout


end
