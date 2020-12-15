# frozen_string_literal: true

Rails.application.routes.draw do
  scope :queries do
    get '/', to: 'queries#index', as: 'queries'
    post '/', to: 'queries#create', as: 'create_query'
    get '/new', to: 'queries#new', as: 'new_query'
    get '/:hash_id', to: 'queries#show', as: 'query'
  end

  scope :user_queries do
    put '/:id', to: 'user_queries#update', as: 'update_user_query'
    delete '/:id', to: 'user_queries#destroy', as: 'destroy_user_query'
  end

  get 'admin/index'
  get 'admin/new_password'
  post 'admin/update_password'
  get 'admin/destroy'
  get 'about', to: 'app_info#about_app'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'queries#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
