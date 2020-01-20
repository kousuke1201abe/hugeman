Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "event_timelines#index"
  get '/*path', to: 'event_timelines#index'

  namespace :event_management do
    get :sign_in, controller: :user_sessions, action: :new
    post :sign_in, controller: :user_sessions, action: :create
    post :sign_out, controller: :user_sessions, action: :sign_out
    resources :users, only: [:new, :create]
    resources :events, only: [:index, :show]
  end
end
