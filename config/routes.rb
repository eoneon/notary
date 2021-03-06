Rails.application.routes.draw do
  root to: 'jobs#index'
  devise_for :users

  resources :users, except: [:index, :create, :destroy] do
    resources :locations, module: :users
    resources :phones, module: :users
    resources :emails, module: :users
  end

  resources :jobs do
    resources :locations, module: :jobs
    resources :people, module: :jobs
    resources :line_items, only: [:create, :update, :destroy]
    resources :packages, only: [:create]
    resources :services, only: [:create]
    resources :documents, only: [:create]
    resources :companies, only: [:show, :create]
    get 'invoice' => 'jobs#invoice'
  end

  resources :people, only: [] do
    resources :phones, module: :people
    resources :emails, module: :people
  end

  resources :packages
  resources :services
  resources :documents
  resources :companies
end
