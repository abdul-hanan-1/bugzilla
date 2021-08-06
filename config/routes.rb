Rails.application.routes.draw do
  resources :projects
  resources :bugs
  devise_for :users
  authenticated :user do
    root :to => 'projects#index', as: :authenticated_root
  end
  root to: "static#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
