
# Ajoute la route pour afficher une tâche spécifique
Rails.application.routes.draw do
  resources :tasks, only: [:index, :show, :new, :create]

  get 'up' => 'rails/health#show', as:rails_health_check

  get 'tasks', to: 'tasks#index'
  get "tasks/:id", to: "tasks#show", as: "task"
end
