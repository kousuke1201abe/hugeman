User.find_by!(email: "test@hugeman.com").tap do |user|
  user.password_authentication || user.create_password_authentication!(password: "password")
end
