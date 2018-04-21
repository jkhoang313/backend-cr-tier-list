class TierListSerializer < ActiveModel::Serializer
  has_one :user
  has_many :tier_list_types

  attributes :id, :title, :description, :upvotes, :tiers
end
