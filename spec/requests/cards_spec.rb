require 'rails_helper'

RSpec.describe "Cards Controller", :type => :request do
  let!(:cards) do
    Array(1..5).map {|num| Card.create(
      name: "Type #{num}",
      card_type: 1,
      rarity: 1,
      elixir_cost: 1,
      arena: 1
    )}
  end

  describe 'GET /api/cards' do
    it 'should return all cards' do
      get("/api/cards")

      body = JSON.parse(response.body)

      expect(body.length).to eq(cards.length)
      expect(body[0]).to have_key("id")
      expect(body[0]).to have_key("name")
      expect(body[0]).to have_key("card_type")
      expect(body[0]["card_type"]).to have_key("name")
      expect(body[0]).to have_key("rarity")
      expect(body[0]["rarity"]).to have_key("name")
      expect(body[0]).to have_key("elixir_cost")
      expect(body[0]).to have_key("arena")
      expect(body[0]["arena"]).to have_key("name")
    end
  end
end
