Rails.application.routes.draw do
  root 'page#start'
  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'
  get 'login', to: 'registration#login_form'
  post 'login', to: 'registration#login'
  delete 'logout', to: 'registration#logout'
  get '/graph', to: 'graph#index', as: 'graph'
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Добавьте маршруты для страниц, связанных с узлами графа
  get 'start', to: 'page#start'
  get 'koans', to: 'page#koans'
  post 'run_koans_tests', to: 'page#run_koans_tests'
  get 'rails-quest-1', to: 'page#rails_quest_1'
  get 'gem-theme', to: 'page#gem_theme'
  get 'lab-1', to: 'page#lab_1'
  get 'rails-quest-2', to: 'page#rails_quest_2'
  get 'gem-repo', to: 'page#gem_repo'
  get 'rails-quest-3', to: 'page#rails_quest_3'
  get 'gem-review', to: 'page#gem_review'
end
