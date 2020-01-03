create_table :event_tweets do |t|
  t.references :event,
               null: false,
               index: {
                 unique: false,
                 name: :idx_event_tweets_1,
               }
  t.string :url,
           null: false,
           index: {
             unique: false,
             name: :idx_event_tweets_2,
           }
end

add_foreign_key :event_tweets,
                :events,
                name: :fk_event_tweets_1
