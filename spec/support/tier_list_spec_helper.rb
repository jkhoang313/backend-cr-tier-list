module TierListSpecHelper
  def create_type_one_lists(user, quantity)
    list_type_one = TierListType.find_or_create_by(id: 1)

    Array(1..quantity).map do |num|
      list = TierList.create(
        user_id: user.id,
        title: "TierListType 1 List #{num}",
        description: "This is a description for #{num}",
        upvotes: num,
        tiers: [
          {
            title: "test tier",
            cards: []
          },
          {
            title: "test tier 2",
            cards: []
          },
        ]
      )
      list.tier_list_selected_types.create(tier_list_type_id: list_type_one.id)
      list
    end
  end

  def create_type_two_lists(user, quantity)
    list_type_two = TierListType.find_or_create_by(id: 2)

    Array(1..quantity).map do |num|
      list = TierList.create(
        user_id: user.id,
        title: "TierListType 2 List #{num}",
        description: "This is a description for #{num}",
        upvotes: num,
        tiers: [
          {
            title: "test tier",
            cards: []
          },
          {
            title: "test tier 2",
            cards: []
          },
        ]
      )
      list.tier_list_selected_types.create(tier_list_type_id: list_type_two.id)
      list
    end
  end
end
