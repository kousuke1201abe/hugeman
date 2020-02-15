User.find_by!(email: "test1@hugeman.com").tap do |user|
  user.password_authentication || user.create_password_authentication!(password: "password")
end

User.find_by!(email: "test2@hugeman.com").tap do |user|
  user.password_authentication || user.create_password_authentication!(password: "password")
end
