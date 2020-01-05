require "rails_helper"

RSpec.describe "EventManagement::EventsController", type: :request do
  include_context "with user session"
  describe "GET /event_management/events" do
    subject { get event_management_events_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end
end