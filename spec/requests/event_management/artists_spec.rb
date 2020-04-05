require "rails_helper"

RSpec.describe "EventManagement::ArtistController", type: :request do
  include_context "with user session"

  describe "GET new_event_management_artist_path" do
    subject { get new_event_management_artist_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end

  describe "GET create_event_management_artist_path" do
    subject { get new_event_management_artist_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end

  describe "POST event_management/artists/:id" do
    let!(:params) do
      { name: "test artist" }
    end
    context 'with valid params' do
      subject { post event_management_artist_path, params: { artist: params } }
      specify {
        expect(subject).to eq 302
        expect(subject).to redirect_to("/event_management/artists/new")
        
      }
    end
    context 'with invalid params' do
      subject { post event_management_artist_path, params: { artist: params } }
        let(:params) do
          { name: "" }
        end

        it 'render error page' do
          expect(Artist.count).to eq 0
          expect(subject).to eq 400
          expect(subject).to render_template(:new)
        end
    end
  end
end
