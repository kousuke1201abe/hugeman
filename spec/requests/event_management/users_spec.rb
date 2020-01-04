require "rails_helper"

RSpec.describe "EventManagement::UsersController", type: :request do
  describe "GET /event_management/users/new" do
    subject { get new_event_management_user_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end
end
