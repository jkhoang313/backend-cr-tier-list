class TierList < ApplicationRecord
  belongs_to :user

  has_many :tier_list_selected_types
  has_many :tier_list_types, through: :tier_list_selected_types

  has_many :tiers

  has_one :primary_list_type
end
