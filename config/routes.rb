Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    post :watch, on: :member
  end
  resource :watch_list, path: 'watch-list'

  root 'welcome#index'
end
