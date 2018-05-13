require 'rails_helper'

RSpec.describe "Sessions Controller", :type => :request do
  let!(:user) { create_test_user }

  describe 'GET /get_user' do
    let!(:url) { '/api/get_user' }

    it "will return a user if it exists" do
      jwt_token = Auth.encrypt({ user_id: user.id })

      get(url,
        params: {
          email_address: user.email_address
        },
        headers: {
          'Auth-Token': jwt_token
        }
      )
      body = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(body["email_address"]).to eq(user.email_address)
    end

    it "will return a status code of 400 if the user doesn't exist" do
      get(url)

      expect(response.status).to eq(400)
    end
  end

  describe 'POST /login' do
    let!(:url) { '/api/login' }

    it 'will return a jwt token and user with the correct credentials' do
      post(url, params: {
        email_address: user.email_address,
        password: "test"
      })
      body = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(body.key?("jwt")).to eq(true)
      expect(body.key?("user")).to eq(true)
      expect(body["user"]["email_address"]).to eq(user.email_address)
    end

    it 'will return an error with the incorrect credentials' do
      post(url, params: {
        email_address: "fake@email.com",
        password: "wrong_password"
      })
      body = JSON.parse(response.body)

      expect(response.status).to eq(400)

      expect(body.key?("error")).to eq(true)
    end
  end
end
