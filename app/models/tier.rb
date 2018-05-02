class Tier < ApplicationRecord
  default_scope -> { order(position: :asc) }

  belongs_to :tier_list

  validates_uniqueness_of :position, scope: :tier_list_id
end
