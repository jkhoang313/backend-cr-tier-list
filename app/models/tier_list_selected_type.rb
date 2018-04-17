class TierListSelectedType < ApplicationRecord
  belongs_to :tier_list
  belongs_to :tier_list_type
end
