Rails.application.routes.draw do
  namespace :event_management do
    get :sign_in, controller: :user_sessions, action: :new
    post :sign_in, controller: :user_sessions, action: :create
    resources :users, only: [:new, :create]
  end
end
