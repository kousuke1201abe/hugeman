require "rails_helper"

describe "Types::EventType" do
  describe "event" do
    subject do
      HugemanSchema.execute(
        query_string,
        context:   context,
        variables: variables
      )
    end

    let!(:event) { create(:event) }
    let!(:event_tweets) { create_list(:event_tweet, 2, event: event) }

    let!(:query_string) do
      <<~QUERY_STRING
      {
        event(urlCode: "#{event.url_code}") {
          tweets {
            code
          }
        }
      }
      QUERY_STRING
    end
    let!(:context) { {} }
    let!(:variables) { {} }

    it "returns query result correctly" do
      payload = subject["data"]["event"]
      expect(payload.size).to eq(1)
      expect(payload["tweets"].count).to eq(2)
      expect(payload["tweets"][0]["code"]).to eq(event_tweets[0].url)
      expect(payload["tweets"][1]["code"]).to eq(event_tweets[1].url)
    end
  end
end
