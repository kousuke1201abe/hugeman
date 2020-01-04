Rails.application.routes.draw do
  namespace :event_management do
    resources :users, only: [:new, :create]
  end
end
