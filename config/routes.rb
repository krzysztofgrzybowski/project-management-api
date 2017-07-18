Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root to: 'projects#index'

  resources :projects do
    member do
      get 'team_members'
    end
    collection do
      get 'assigned'
    end
  end

  resources :project_assignments, only: [:create, :show, :update, :destroy] do
    collection do
      get 'for_project'
    end
  end
end
