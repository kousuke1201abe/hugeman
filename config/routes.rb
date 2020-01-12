Rails.application.routes.draw do
  root "event_timelines#index"

  namespace :event_management do
    get :sign_in, controller: :user_sessions, action: :new
    post :sign_in, controller: :user_sessions, action: :create
    resources :users, only: [:new, :create]
    resources :events, only: [:index, :show]
  end
end
