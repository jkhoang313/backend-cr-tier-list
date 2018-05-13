require 'rails_helper'

RSpec.describe Tier, type: :model do
  describe 'when being created' do
    it 'must have a unique tier_list and position combination' do
      user = create_test_user
      tier_list = create_tier_lists(user, num_tiers: 0, quantity: 1).first

      expect(Tier.count).to eq(0)

      tier = Tier.create(tier_list: tier_list, position: 1)
      expect(tier_list.save).to eq(true)

      expect(Tier.count).to eq(1)

      dupe_tier = Tier.create(tier_list: tier_list, position: 1)
      expect(dupe_tier.save).to eq(false)

      expect(Tier.count).to eq(1)
    end
  end
end
