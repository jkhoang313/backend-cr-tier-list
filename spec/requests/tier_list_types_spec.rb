require 'rails_helper'

RSpec.describe "TierListTypes Controller", :type => :request do
  let!(:tier_list_types) { Array(1..5).map {|num| TierListType.create(name: "Type #{num}") } }

  describe 'GET /api/tier_list_types' do
    it 'should return all tier lists types' do
      get("/api/tier_list_types")

      body = JSON.parse(response.body)

      expect(body.length).to eq(tier_list_types.length)
      expect(body[0]).to have_key("id")
      expect(body[0]).to have_key("name")
    end
  end
end
