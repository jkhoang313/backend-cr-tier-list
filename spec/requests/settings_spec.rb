require 'rails_helper'

RSpec.describe "Settings Controller", :type => :request do
  let!(:url) { '/api/reset_password' }

  it "can randomize a user's password if the user exists" do
    user = create_test_user
    post(url, params: { email_address: user.email_address })

    body = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(body.key?("success")).to eq(true)
  end

  it "will return an error if the user does not exist" do
    post(url, params: { email_address: "fake@email.com" })

    body = JSON.parse(response.body)

    expect(response.status).to eq(400)
    expect(body.key?("error")).to eq(true)
  end
end
