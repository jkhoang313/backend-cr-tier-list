class TierListsController < ApplicationController
  def index
    list_type_id = params["list_type_id"]
    offset = params["offset"]
    limit = params["limit"]

    if list_type_id
      tier_lists = TierList.joins(:tier_list_types).where(tier_list_types: { id: list_type_id }).order(upvotes: :DESC).offset(offset).limit(limit)
    else
      tier_lists = TierList.order(upvotes: :DESC).offset(offset).limit(limit)
    end

    render json: tier_lists, root: false
  end
end
