class Task::TweetFetcher < ApplicationModel
  attribute :event

  def execute!
    payload =
      twitter_api_search_client.call(
        search_word: event.tag,
        from_date: from_date,
        to_date: to_date,
      )

    payload["results"].each do |result|
      event.tweets.find_or_create_by!(url: result["id"].to_s)
    end
  end

  private

  def twitter_api_search_client
    @twitter_api_search_client = TwitterApiSearchClient.new
  end

  def from_date
    event.start_at.strftime("%Y%m%d%H%M")
  end

  def to_date
    event.end_at.strftime("%Y%m%d%H%M")
  end
end

