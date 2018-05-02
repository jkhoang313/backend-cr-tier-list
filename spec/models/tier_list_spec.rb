require 'rails_helper'

RSpec.describe TierList, type: :model do
  include TierListSpecHelper
  include UserSpecHelper

  describe 'when adding tiers' do
    it 'should return the tiers in order of position' do
      user = create_test_user
      tier_list = create_tier_lists(user, quantity: 1, num_tiers: 0).first

      tier_three = tier_list.tiers.create(tier_list: tier_list, position: 3)
      tier_one = tier_list.tiers.create(tier_list: tier_list, position: 1)
      tier_two = tier_list.tiers.create(tier_list: tier_list, position: 2)

      expect(tier_list.tiers.pluck(:position)).to eq([1, 2, 3])
    end
  end
end
