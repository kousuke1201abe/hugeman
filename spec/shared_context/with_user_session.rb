RSpec.shared_context "with user session" do
  let!(:email) { "test@gmail.com" }
  let!(:password) { "password" }
  let!(:user) { create(:user, email: email) }
  let!(:user_password_authentication) { create(:user_password_authentication, password: password, user: user) }
  let!(:params) do
    {
      email: email,
      password: password,
    }
  end

  before do
    post project_management_project_sign_in_path, params: { user: params }
  end
end
