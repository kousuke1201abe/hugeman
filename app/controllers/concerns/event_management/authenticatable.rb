module EventManagement::Authenticatable
  def current_user
    unless @current_user
      user_session =
        User::Session.find_by(
         token: session[:event_management_user_session_token],
        )
      @current_user = user_session&.user
    end
    @current_user
  end

  def sign_in(args)
    user = ::User.find_by(email: args[:email])
    if user&.password_authentication&.authenticate(args[:password])
      session[:event_management_user_session_token] =
        user.sessions.create!(token: SecureRandom.uuid, expires_at: Time.zone.now.since(1.week)).token
      @current_user = user
    end
  end

  def sign_out!
    session[:event_management_user_session_token] = nil
    flash[:notice] = "ログアウトしました"
  end

  def signed_in?
    !!current_user
  end
end
