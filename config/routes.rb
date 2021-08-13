Rails.application.routes.draw do
  resources :projects
  resources :bugs
  devise_for :users
  authenticated :user do
    root :to => 'projects#index', as: :authenticated_root
  end
  root to: "static#index"
  get 'projects/:id/add_user', to: 'projects#add_user', as: 'add_user'
  post 'projects/:id/add_user', to: 'projects#add_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
