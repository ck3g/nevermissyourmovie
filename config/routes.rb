Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    post :watch, on: :member
    delete :stop_watching, on: :member
    get :approval, on: :collection
    patch :approve, on: :member
  end
  resource :watch_list, path: 'watch-list'

  authenticated do
    root 'watch_lists#show', as: :watch_list_root
  end

  unauthenticated do
    root 'welcome#index'
  end
end
