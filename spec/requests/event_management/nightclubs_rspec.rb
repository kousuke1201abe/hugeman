require "rails_helper"

RSpec.describe "EventManagement::NightclubsController", type: :request do
  include_context "with user session"
  
  describe "GET new_event_management_nightclub_path" do
    subject { get new_event_management_nightclub_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end
end
