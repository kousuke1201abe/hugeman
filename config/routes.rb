Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "event_timelines#index"
  get '/*path', to: 'event_timelines#index', constraints: -> (req) { (req.fullpath =~ /^(?!.*event_management).*$/) }

  namespace :event_management do
    get :sign_in, controller: :user_sessions, action: :new
    post :sign_in, controller: :user_sessions, action: :create
    post :sign_out, controller: :user_sessions, action: :sign_out
    resources :users, only: [:new, :create, :edit]
    resources :events, only: [:index, :show, :new]
    resources :nightclubs, only: [:new]
    resources :artists, only: [:new]
    resources :users, only: [:new, :create]

  end
end
