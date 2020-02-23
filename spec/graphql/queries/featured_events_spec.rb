require "rails_helper"

describe "Types::EventType" do
  describe "featured_events" do
    subject do
      HugemanSchema.execute(
        query_string,
        context:   context,
        variables: variables
      )
    end

    let!(:frozen_now) { Time.zone.now }
    let!(:finished_event) { create(:event, :published, start_at: Time.zone.now.ago(2.day),  end_at: Time.zone.now.ago(1.day)) }
    let!(:not_holding_event) { create(:event, :published, start_at: Time.zone.now.since(1.day),  end_at: Time.zone.now.since(2.day)) }
    let!(:holding_event) { create(:event, :published, start_at: Time.zone.now.ago(1.day), end_at: Time.zone.now.since(1.day)) }
    let!(:not_published_event) { create(:event, start_at: Time.zone.now.ago(1.day), end_at: Time.zone.now.since(1.day)) }

    let!(:query_string) do
      <<~QUERY_STRING
      {
        featuredEvents {
          edges {
            cursor
            node {
              name
            }
          }
          nodes {
            name
            tag
            startAt
            endAt
            urlCode
            nightclub {
              name
            }
          }
          pageInfo {
            endCursor
            hasNextPage
            hasPreviousPage
            startCursor
          }
        }
      }
      QUERY_STRING
    end
    let!(:context) { {} }
    let!(:variables) { {} }

    it "returns query result correctly" do
      travel_to frozen_now do
        payload = subject["data"]["featuredEvents"]
        expect(payload["nodes"].count).to eq(1)
        expect(payload["edges"][0]["node"]["name"]).to eq(holding_event.name)
        expect(payload["nodes"][0]["name"]).to eq(holding_event.name)
        expect(payload["nodes"][0]["tag"]).to eq(holding_event.tag)
        expect(payload["nodes"][0]["startAt"]).to eq(holding_event.start_at.iso8601)
        expect(payload["nodes"][0]["endAt"]).to eq(holding_event.end_at.iso8601)
        expect(payload["nodes"][0]["urlCode"]).to eq(holding_event.url_code)
        expect(payload["pageInfo"]).to be_present
      end
    end
  end
end
