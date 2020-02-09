module Types
  class QueryType < Types::BaseObject
    field :events, Types::EventType.connection_type, null: false do
      argument :name, String, required: false
    end
    field :featured_events, Types::EventType.connection_type, null: false
    field :scheduled_events, Types::EventType.connection_type, null: false
    field :archived_events, Types::EventType.connection_type, null: false
    field :hello, String, null: false

    def events(name:)
      name ? Event.where(name: name) : Event.archived
    end

    def featured_events
      Event.featured
    end

    def scheduled_events
      Event.scheduled
    end

    def archived_events
      Event.archived
    end

    def hello
      "Hello"
    end
  end
end
