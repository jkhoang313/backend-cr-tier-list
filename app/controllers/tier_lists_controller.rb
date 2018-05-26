class TierListsController < ApplicationController
  def index
    list_type_id = params["list_type_id"]
    offset = params["offset"]
    limit = params["limit"]

    if list_type_id
      all_tier_lists = TierList.joins(:tier_list_types).where(tier_list_types: { id: list_type_id }).order(upvotes: :DESC)
    else
      all_tier_lists = TierList.order(upvotes: :DESC)
    end
    selected_tier_lists = all_tier_lists.offset(offset).limit(limit)

    render json: {
      tier_lists: selected_tier_lists.map { |tier_list| TierListSerializer.new(tier_list) },
      total_tier_lists: all_tier_lists.count
    }, root: false
  end
end
