require 'rails_helper'

RSpec.describe "Users Controller", :type => :request do
  let!(:url) { '/api/user' }

  describe 'POST /user' do
    it "can create a user" do
      post(url, params: {
        email_address: "new@user.com",
        first_name: "new",
        last_name: "user",
        password: "password",
        password_confirmation: "password"
      })
      body = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(body.key?("jwt")).to eq(true)
      expect(body.key?("user")).to eq(true)
      expect(body["user"]["email_address"]).to eq("new@user.com")
    end

    it "will return an error if the passwords do not match" do
      post(url, params: {
        email_address: "new@user.com",
        first_name: "new",
        last_name: "user",
        password: "password",
        password_confirmation: "wrong_password"
      })
      body = JSON.parse(response.body)

      expect(response.status).to eq(400)

      expect(body.key?("error")).to eq(true)
    end

    it "will return an error if the email already exists" do
      existing_user = User.create(email_address: "existing@user.com")
      post(url, params: {
        email_address: "existing@user.com",
        first_name: "new",
        last_name: "user",
        password: "password",
        password_confirmation: "wrong_password"
      })
      body = JSON.parse(response.body)

      expect(response.status).to eq(400)

      expect(body.key?("error")).to eq(true)
    end
  end

  describe 'PUT /user' do
    let!(:user) { create_test_user }
    let!(:jwt_token) { Auth.encrypt({ user_id: user.id }) }

    it "can update a user's password if the current password is correct and the password confirmation matches" do
      expect(user.authenticate("new password")).to eq(false)

      put(url,
        params: {
          "change_password": {
            current_password: "test",
            password: "new password",
            password_confirmation: "new password"
          }
        },
        headers: {
          'Auth-Token': jwt_token
        }
      )
      user.reload
      body = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(user.authenticate("new password")).to eq(user)
    end

    it "will return an error if the current password is incorrect" do
      expect(user.authenticate("new password")).to eq(false)

      put(url,
        params: {
          "change_password": {
            current_password: "wrong current",
            password: "new password",
            password_confirmation: "new password"
          }
        },
        headers: {
          'Auth-Token': jwt_token
        }
      )
      user.reload
      body = JSON.parse(response.body)

      expect(response.status).to eq(400)

      expect(body.key?("error")).to eq(true)
    end

    it "will return an error if the new passwords does not match the password confirmation" do
      expect(user.authenticate("new password")).to eq(false)

      put(url,
        params: {
          "change_password": {
            current_password: "test",
            password: "new password",
            password_confirmation: "does not match"
          }
        },
        headers: {
          'Auth-Token': jwt_token
        }
      )
      user.reload
      body = JSON.parse(response.body)

      expect(response.status).to eq(400)

      expect(body.key?("error")).to eq(true)
    end
  end
end
