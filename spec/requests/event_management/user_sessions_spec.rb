require 'rails_helper'

RSpec.describe EventManagement::UserSessionsController, type: :request do
  describe "GET /event_management/sign_in" do
    context 'without session' do
      subject { get event_management_sign_in_path }

      specify {
        subject
        expect(response).to have_http_status(200)
      }
    end
  end

  describe "POST /event_management/sign_in" do
    let!(:email) { "test@gmail.com" }
    let!(:password) { "password" }
    let!(:user) { create(:user, email: email) }
    let!(:user_password_authentication) { create(:user_password_authentication, password: password, user: user) }

    context 'with valid params' do
      subject { post event_management_sign_in_path, params: { user: params } }

      let!(:params) {
        {
          email: email,
          password: password,
        }
      }

      it "creates ::User::Session record" do
        expect(::User::Session.count).to eq(0)
        expect(subject).to eq 302
        expect(subject).to redirect_to(event_management_events_path)
        expect(::User::Session.count).to eq(1)
      end
    end

    context 'with invalid params' do
      subject { post event_management_sign_in_path, params: { user: params } }

      context 'with not registered email' do
        let(:not_registered_email) { "invalid_#{email}" }
        let(:params) {
          {
            email: not_registered_email,
            password: password
          }
        }

        it 'render error page' do
          expect(::User::Session.count).to eq(0)
          expect(subject).to eq 400
          expect(subject).to render_template(:new)
          expect(::User::Session.count).to eq(0)
        end
      end

      context 'with invalid password' do
        subject { post event_management_sign_in_path, params: { user: params } }

        let(:invalid_password) { "invalid_#{password}" }
        let(:params) {
          {
            email: email,
            password: invalid_password
          }
        }

        it 'render error page' do
          expect(::User::Session.count).to eq(0)
          expect(subject).to eq 400
          expect(subject).to render_template(:new)
          expect(::User::Session.count).to eq(0)
        end
      end
    end
  end
end
