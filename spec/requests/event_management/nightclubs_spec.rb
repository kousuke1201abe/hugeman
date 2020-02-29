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

  describe "GET create_event_management_nightclub_path" do
    subject { get new_event_management_nightclub_path }

    specify {
      subject
      expect(response).to have_http_status 200
    }
  end

  describe "POST event_management/nitghtclubs/:id" do
    let!(:params) do
      { name: "test club", id: 1 }
    end
    context 'with valid params' do
      subject { post event_management_nightclubs_path, params: { nightclub: params } }
      specify {
        expect(subject).to eq 302
        expect(subject).to render_template(new_event_management_artist_path)
        
      }
    end
    context 'with invalid params' do
      subject { post event_management_nightclubs_path, params: { nightclub: params } }
        let(:params) do
          { name: "", id: 1 }
        end

        it 'render error page' do
          expect(Nightclub.count).to eq 0
          expect(subject).to eq 302
          expect(subject).to render_template(:new)
        end
    end
  end
end
