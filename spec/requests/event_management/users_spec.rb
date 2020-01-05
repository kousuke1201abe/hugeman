require "rails_helper"

RSpec.describe "EventManagement::UsersController", type: :request do
  describe "GET /event_management/users/new" do
    subject { get new_event_management_user_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end

  describe "POST /event_management/users" do
    subject { post event_management_users_path, params: { user: params } }

    let!(:params) do
      {
        name: "user name",
        email: "test@gmail.com",
        password: "password",
      }
    end

    context "with valid params" do
      specify {
        expect(subject).to eq 302
        expect(subject).to redirect_to(event_management_events_path)
      }
    end

    context "with invalid params" do
      before do
        params[:name] = ""
      end

      it "returns 400 and renders new" do
        expect(subject).to eq 400
        expect(subject).to render_template(:new)
      end
    end
  end
end
