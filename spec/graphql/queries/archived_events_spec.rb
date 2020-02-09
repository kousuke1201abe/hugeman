require "rails_helper"

describe "Types::EventType" do
  describe "archived_events" do
    subject do
      HugemanSchema.execute(
        query_string,
        context:   context,
        variables: variables
      )
    end

    let!(:frozen_now) { Time.zone.now }
    let!(:finished_event) { create(:event, start_at: Time.zone.now.ago(2.day), end_at: Time.zone.now.ago(1.day)) }
    let!(:not_finished_event) { create(:event, start_at: Time.zone.now.since(1.day), end_at: Time.zone.now.since(2.day)) }

    let!(:query_string) do
      <<~QUERY_STRING
      {
        archivedEvents {
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
        payload = subject["data"]["archivedEvents"]
        expect(payload["nodes"].count).to eq(1)
        expect(payload["edges"][0]["node"]["name"]).to eq(finished_event.name)
        expect(payload["nodes"][0]["name"]).to eq(finished_event.name)
        expect(payload["nodes"][0]["tag"]).to eq(finished_event.tag)
        expect(payload["nodes"][0]["startAt"]).to eq(finished_event.start_at.iso8601)
        expect(payload["nodes"][0]["endAt"]).to eq(finished_event.end_at.iso8601)
        expect(payload["pageInfo"]).to be_present
      end
    end
  end
end
