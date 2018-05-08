class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :card_type, :rarity, :elixir_cost, :arena

  def card_type
    Card.CARD_TYPES[object.card_type]
  end

  def rarity
    Card.RARITIES[object.rarity]
  end

  def arena
    Card.ARENAS[object.arena]
  end
end
