Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :projects

  resources :project_assignments, only: [:create, :update, :destroy]
end
