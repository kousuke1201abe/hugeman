test_user1 =
  User.find_or_create_by!(name: "test user1", email: "test1@hugeman.com")

test_user2 =
  User.find_or_create_by!(name: "test user2", email: "test2@hugeman.com")
