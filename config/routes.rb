Rails.application.routes.draw do
  resources :projects
  resources :bugs
  devise_for :users
  authenticated :user do
    root :to => 'projects#index', as: :authenticated_root
  end
  root to: "static#index"
  get 'projects/:id/add_user', to: 'projects#add_user', as: 'add_user'
  get 'projects/:id/add_bug', to: 'projects#add_bug', as: 'add_bug'
  post 'projects/:id/create_bug', to: 'projects#create_bug', as: 'create_bug_projects'
  post 'projects/:id/add_user', to: 'projects#add_user'
  post 'projects/:id/remove_user', to: 'projects#remove_user', as: 'remove_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
