Rails.application.routes.draw do

  root 'page#start'
  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'
  get 'login', to: 'registration#login_form'
  post 'login', to: 'registration#login'
  delete 'logout', to: 'registration#logout'
  get '/graph', to: 'graph#index', as: 'graph'
  get 'up' => 'rails/health#show', as: :rails_health_check


  get '/mermaid', to: 'mermaid#index'
end
