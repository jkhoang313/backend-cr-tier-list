class TierSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :notes, :position, :cards
end
