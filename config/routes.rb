Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: [:index, :new, :create, :destroy]

  root 'welcome#index'
end
