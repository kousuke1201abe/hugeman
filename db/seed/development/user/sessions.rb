User.find_by!(email: "test@hugeman.com").tap do |user|
  user.sessions.find_or_create_by!(
    token: "test user token"
  ) do |user_session|
    user_session.expires_at = Time.zone.now.since(1.day)
  end
end
