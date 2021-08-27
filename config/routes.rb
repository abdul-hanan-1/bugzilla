# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects do
    collection do
      get 'bugs_bucket'
    end
  end
  resources :bugs
  devise_for :users
  authenticated :user do
    root to: 'projects#index', as: :authenticated_root
  end
  root to: 'static#index'
  patch 'bugs/:id/assign_bug', to: 'bugs#assign_bug', as: 'assign_bug'
  patch 'bugs/:id/mark_completed', to: 'bugs#mark_completed', as: 'mark_completed'
  get 'projects/test_route', to: 'projects#test_route'
  get 'projects/qa_show/:id', to: 'projects#qa_show', as: 'qa_show'
  get 'projects/developer_show/:id', to: 'projects#developer_show', as: 'developer_show'
  get 'projects/:id/add_user', to: 'projects#add_user', as: 'add_user'
  get 'projects/:id/add_bug', to: 'projects#add_bug', as: 'add_bug'
  post 'projects/:id/create_bug', to: 'projects#create_bug', as: 'create_bug_projects'
  post 'projects/:id/add_user', to: 'projects#add_user'
  post 'projects/:id/remove_user', to: 'projects#remove_user', as: 'remove_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
