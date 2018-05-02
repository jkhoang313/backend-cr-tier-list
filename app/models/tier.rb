class Tier < ApplicationRecord
  belongs_to :tier_list

  validates_uniqueness_of :position, scope: :tier_list_id
end
