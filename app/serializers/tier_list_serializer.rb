class TierListSerializer < ActiveModel::Serializer
  has_one :user
  has_many :tier_list_types, :tiers

  attributes :id, :title, :description, :upvotes, :primary_list_type_id
end
