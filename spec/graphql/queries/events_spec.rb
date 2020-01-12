require "rails_helper"

describe "Types::EventType" do
  describe "evnets" do
    subject do
      HugemanSchema.execute(
        query_string,
        context:   context,
        variables: variables
      )
    end

    let!(:events) { create_list(:event, 2) }

    let!(:query_string) do
      <<~QUERY_STRING
      {
        events(name: null) {
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
      payload = subject["data"]["events"]

      expect(payload.size).to eq(3)
      expect(payload["edges"][0]["node"]["name"]).to eq(events[0].name)
      expect(payload["edges"][1]["node"]["name"]).to eq(events[1].name)
      expect(payload["nodes"][0]["name"]).to eq(events[0].name)
      expect(payload["nodes"][0]["tag"]).to eq(events[0].tag)
      expect(payload["nodes"][0]["startAt"]).to eq(events[0].start_at.iso8601)
      expect(payload["nodes"][0]["endAt"]).to eq(events[0].end_at.iso8601)
      expect(payload["nodes"][1]["name"]).to eq(events[1].name)
      expect(payload["nodes"][1]["tag"]).to eq(events[1].tag)
      expect(payload["nodes"][1]["startAt"]).to eq(events[1].start_at.iso8601)
      expect(payload["nodes"][1]["endAt"]).to eq(events[1].end_at.iso8601)
      expect(payload["pageInfo"]).to be_present
    end
  end
end
