RSpec.shared_context "with user session" do
  let!(:email) { "test@gmail.com" }
  let!(:password) { "password" }
  let!(:user) { create(:user, email: email) }
  let!(:user_password_authentication) { create(:user_password_authentication, password: password, user: user) }
  let!(:login_params) do
    {
      email: email,
      password: password,
    }
  end

  before do
    post event_management_sign_in_path, params: { user: login_params }
  end
end
