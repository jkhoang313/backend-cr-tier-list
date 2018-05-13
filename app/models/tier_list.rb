class TierList < ApplicationRecord
  belongs_to :user

  has_many :tier_list_selected_types
  has_many :tier_list_types, through: :tier_list_selected_types

  has_many :tiers

  belongs_to :primary_list_type, class_name: "TierListType", foreign_key: 'primary_list_type_id'
end
