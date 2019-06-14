Rails.application.routes.draw do
  root "pages#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  namespace :supervisor do
    resources :users, except: [:show, :edit, :update]
    resources :courses, :subjects
    post "/add_subjects/:course_id/:subject_id", to: "course_subjects#create",
                                                 as: :add_subjects
    delete "/remove_subjects/:course_id/:subject_id", to: "course_subjects#destroy",
                                                 as: :remove_subjects
    get "/edit_course_subject/:course_id/:subject_id", to: "course_subjects#edit",
                                                 as: :edit_course_subjects
    patch "/update_course_subject/:course_id/:subject_id", to: "course_subjects#update",
                                                 as: :update_course_subjects
    patch "/update_status/:course_id/:subject_id", to: "course_subjects#update_status",
                                                 as: :update_status
  end
  namespace :admin do
    resources :users
  end
end
