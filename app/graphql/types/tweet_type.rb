module Types
  class TweetType < QueryType
    field :code, String, null: false, method: :url
  end
end
