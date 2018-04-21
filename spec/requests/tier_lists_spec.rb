require 'rails_helper'

RSpec.describe "Sessions Controller", :type => :request do
  include UserSpecHelper
  include TierListSpecHelper

  let!(:user) { create_test_user }
  let!(:type_one_lists) { create_type_one_lists(user, 5) }
  let!(:type_two_lists) { create_type_two_lists(user, 3) }

  describe 'GET /api/tier_lists' do
    context 'when list_type is 1' do
      let!(:params) { { list_type: 1 } }

      it 'should return all tournament tier lists' do
        get("/api/tier_lists", params: params)

        body = JSON.parse(response.body)

        expect(body.length).to eq(type_one_lists.length)
        expect(body[0]).to have_key("user")
        expect(body[0]).to have_key("title")
        expect(body[0]).to have_key("description")
        expect(body[0]).to have_key("upvotes")
        expect(body[0]).to have_key("tiers")
        expect(body[0]).to have_key("tier_list_types")

        body.each do |tier_list|
          has_matching_list_type = tier_list["tier_list_types"].any? {|list_type| list_type["id"] == 1}
          expect(has_matching_list_type).to eq(true)
        end
      end
    end

    context 'when list_type is 2' do
      let!(:params) { { list_type: 2 } }

      it 'should return all tournament tier lists' do
        get("/api/tier_lists", params: params)

        body = JSON.parse(response.body)

        expect(body.length).to eq(type_two_lists.length)
        expect(body[0]).to have_key("user")
        expect(body[0]).to have_key("title")
        expect(body[0]).to have_key("description")
        expect(body[0]).to have_key("upvotes")
        expect(body[0]).to have_key("tiers")
        expect(body[0]).to have_key("tier_list_types")

        body.each do |tier_list|
          has_matching_list_type = tier_list["tier_list_types"].any? {|list_type| list_type["id"] == 2}
          expect(has_matching_list_type).to eq(true)
        end
      end
    end
  end
end
