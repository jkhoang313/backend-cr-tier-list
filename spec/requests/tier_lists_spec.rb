require 'rails_helper'

RSpec.describe "TierLists Controller", :type => :request do
  let!(:user) { create_test_user }
  let!(:type_one_lists) do
    create_tier_lists(user, list_id: 1, quantity: 10) + create_tier_lists(user, list_id: 1, quantity: 1, upvotes: 0)
  end
  let!(:type_two_lists) { create_tier_lists(user, list_id: 2, quantity: 3) }

  describe 'GET /api/tier_lists' do
    context 'when list_type_id is 1' do
      let!(:list_type_id) { 1 }

      it 'should return all tournament tier lists' do
        get("/api/tier_lists?list_type_id=#{list_type_id}")

        body = JSON.parse(response.body)
        tier_lists = body["tier_lists"]

        expect(tier_lists.length).to eq(type_one_lists.length)
        expect(tier_lists[0]).to have_key("user")
        expect(tier_lists[0]).to have_key("title")
        expect(tier_lists[0]).to have_key("description")
        expect(tier_lists[0]).to have_key("upvotes")
        expect(tier_lists[0]).to have_key("tiers")
        expect(tier_lists[0]["tiers"].length).to eq(2)
        expect(tier_lists[0]).to have_key("tier_list_types")

        tier_lists.each do |tier_list|
          has_matching_list_type = tier_list["tier_list_types"].any? {|list_type| list_type["id"] == 1}
          expect(has_matching_list_type).to eq(true)
        end
      end

      it 'should the tier lists in order of upvotes' do
        get("/api/tier_lists?list_type_id=#{list_type_id}")

        body = JSON.parse(response.body)
        tier_lists = body["tier_lists"]

        sorted_tier_lists = tier_lists.sort_by {|tier_list| -tier_list["upvotes"]}

        expect(tier_lists).to eq(sorted_tier_lists)
      end

      it 'should can respect the "limit" params' do
        limit = 3

        get("/api/tier_lists?list_type_id=#{list_type_id}&limit=#{limit}")

        body = JSON.parse(response.body)
        tier_lists = body["tier_lists"]

        expect(tier_lists.length).to eq(limit)
      end

      it 'should can respect the "offset" params' do
        offset = 2

        get("/api/tier_lists?list_type_id=#{list_type_id}&offset=#{offset}")

        body = JSON.parse(response.body)
        tier_lists = body["tier_lists"]

        expect(tier_lists.length).to eq(type_one_lists.length - offset)
      end

      it 'should return the total number of tier lists' do
        get("/api/tier_lists?list_type_id=#{list_type_id}")

        body = JSON.parse(response.body)
        total_tier_lists = body["total_tier_lists"]

        expect(total_tier_lists).to eq(type_one_lists.length)
      end
    end

    context 'when list_type_id is 2' do
      let!(:list_type_id) { 2 }

      it 'should return all tournament tier lists' do
        get("/api/tier_lists?list_type_id=#{list_type_id}")

        body = JSON.parse(response.body)
        tier_lists = body["tier_lists"]

        expect(tier_lists.length).to eq(type_two_lists.length)
        expect(tier_lists[0]).to have_key("user")
        expect(tier_lists[0]).to have_key("title")
        expect(tier_lists[0]).to have_key("description")
        expect(tier_lists[0]).to have_key("upvotes")
        expect(tier_lists[0]).to have_key("tiers")
        expect(tier_lists[0]).to have_key("tier_list_types")

        tier_lists.each do |tier_list|
          has_matching_list_type = tier_list["tier_list_types"].any? {|list_type| list_type["id"] == 2}
          expect(has_matching_list_type).to eq(true)
        end
      end
    end
  end
end
