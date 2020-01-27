require "rails_helper"

RSpec.describe "EventManagement::ArtistsController", type: :request do
  include_context "with user session"
  
  describe "GET new_event_management_artist_path" do
    subject { get new_event_management_artist_path }

    let!(:artist) { create(:artist) }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end
end
