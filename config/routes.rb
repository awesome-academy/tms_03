Rails.application.routes.draw do
  root "pages#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  namespace :supervisor do
    resources :users, except: [:show, :edit, :update]
    resources :courses, :subjects
  end
  namespace :admin do
    resources :users
  end
end
