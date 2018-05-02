module TierListSpecHelper
  def create_tier_lists(list_id, user, quantity)
    list_type = TierListType.find_or_create_by(id: list_id)

    Array(1..quantity).map do |num|
      list = TierList.create(
        user_id: user.id,
        title: "TierListType #{list_id} List #{num}",
        description: "This is a description for #{num}",
        upvotes: rand(20),
      )
      2.times do |num|
        list.tiers.create(
          name: "test tier #{num}",
          cards: [],
          position: num
        )
      end
      list.tier_list_selected_types.create(tier_list_type_id: list_type.id)
      list
    end
  end
end
