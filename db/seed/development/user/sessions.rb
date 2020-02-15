User.find_by!(email: "test1@hugeman.com").tap do |user|
  user.sessions.find_or_create_by!(
    token: "test user1 token"
  ) do |user_session|
    user_session.expires_at = Time.zone.now.since(1.day)
  end
end

User.find_by!(email: "test2@hugeman.com").tap do |user|
  user.sessions.find_or_create_by!(
    token: "test user2 token"
  ) do |user_session|
    user_session.expires_at = Time.zone.now.since(1.day)
  end
end
