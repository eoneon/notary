Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  resources :users, except: [:index, :create, :destroy] do
    resources :locations, module: :users
    resources :phones, module: :users
    resources :emails, module: :users
  end
end
