Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root to: 'projects#index'

  resources :projects

  resources :project_assignments, only: [:create, :update, :destroy]
end
