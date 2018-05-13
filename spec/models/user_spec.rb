require 'rails_helper'

RSpec.describe User, type: :model do
  include UserSpecHelper

  let!(:user) { create_test_user }

  it 'can save a password' do
    new_password = "new_password"

    expect(user.authenticate(new_password)).to eq(false)

    user.update(password: new_password)

    expect(user.authenticate(new_password)).to eq(user)
  end

  it 'can set a random password' do
    expect(user.authenticate("test")).to eq(user)

    user.set_random_password

    expect(user.authenticate("test")).to eq(false)
  end

  it 'can not create a user if the email already exists' do
    user_with_existing_email = User.create(
      email_address: user.email_address,
      password: "password",
      password_confirmation: "password"
    )

    expect(user_with_existing_email.save).to eq(false)
  end

  it 'can not create a user if the username already exists' do
    user_with_existing_username = User.create(
      email_address: "new@email.com",
      password: "password",
      password_confirmation: "password",
      username: "testuser"
    )

    expect(user_with_existing_username.save).to eq(false)
  end
end
