module Types
  class EventType < QueryType
    field :nightclub, Types::NightclubType, null: false
    field :name, String, null: false
    field :tag, String, null: false
    field :start_at, GraphQL::Types::ISO8601DateTime, null: false
    field :end_at, GraphQL::Types::ISO8601DateTime, null: false
    field :urlCode, String, null: false
    field :total_count, Integer, null: false
    field :tweets, [Types::TweetType], null: true
  end
end
