require "rails_helper"

describe Task::TweetFetcher do
  describe "#execute!" do
    subject { task_tweet_fetcher.execute! }

    let!(:event) { create(:event) }
    let!(:task_tweet_fetcher) { Task::TweetFetcher.new(event: event) }
    let!(:tweet_id_1) { 1234123412341234 }
    let!(:tweet_id_2) { 5678567856785678 }
    let!(:mock_payload) do
      {"results"=>
        [
          { "id"=>tweet_id_1 },
          { "id"=>tweet_id_1 },
          { "id"=>tweet_id_2 },
          { "id"=>tweet_id_2 },
        ]
      }
    end
    let(:twitte_api_search_client_double) { double(:twitte_api_search_client_double) }

    before do
      allow(TwitterApiSearchClient).to receive(:new) { twitte_api_search_client_double }
      allow(twitte_api_search_client_double).to receive(:call)
                               .with(
                                 search_word: event.tag,
                                 from_date: event.start_at.strftime("%Y%m%d%H%M"),
                                 to_date: event.end_at.strftime("%Y%m%d%H%M"),
                                )
                               .and_return(mock_payload)
    end

    it "create tweet records" do
      expect(Event::Tweet.count).to eq(0)

      subject

      expect(Event::Tweet.count).to eq(2)
      expect(event.tweets.first.url).to eq(tweet_id_1.to_s)
      expect(event.tweets.second.url).to eq(tweet_id_2.to_s)
    end
  end
end
