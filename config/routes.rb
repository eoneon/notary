Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  resources :users, except: [:index, :new, :create] do
    resources :locations, module: :users
  end
end
