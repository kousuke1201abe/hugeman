module Types
  class EventType < QueryType
    field :nightclub, Types::NightclubType, null: false
    field :name, String, null: false
    field :tag, String, null: false
    field :start_at, GraphQL::Types::ISO8601DateTime, null: false
    field :end_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
