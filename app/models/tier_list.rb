class TierList < ApplicationRecord
  belongs_to :user
  has_many :tier_list_selected_types
  has_many :tier_list_types, through: :tier_list_selected_types
end
