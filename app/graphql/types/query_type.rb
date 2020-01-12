module Types
  class QueryType < Types::BaseObject
    field :events, Types::EventType.connection_type, null: false do
      argument :name, String, required: false
    end

    def events(name:)
      name ? Event.where(name: name) : Event.all
    end
  end
end
