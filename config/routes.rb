Rails.application.routes.draw do

  get 'queries/new'
  get 'query', to: 'queries#result_display'
  post 'query/destroy', to: 'queries#destroy'
  get 'queries', to: 'queries#index'
  post 'queries/create'
  post 'visit_update/:id', to: 'queries#update_results_visit'
  post 'benefits/fetch'
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
