class TierList < ApplicationRecord
  belongs_to :user
  has_many :tier_list_selected_types
  has_many :tier_list_types, through: :tier_list_selected_types

  # for the key tier, the format is:
  # tiers: [
  #   {
  #     name: "Tier name",
  #     description: "Tier description",
  #     notes: "Tier notes",
  #     cards: [10, 1, 40]
  #   },
  #   ....
  # ]
end
