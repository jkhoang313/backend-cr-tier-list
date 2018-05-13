module UserSpecHelper
  def create_test_user
    User.create(
      email_address: "test@email.com",
      password: "test",
      password_confirmation: "test",
      username: "testuser"
    )
  end
end
