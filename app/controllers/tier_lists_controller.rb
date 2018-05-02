class TierListsController < ApplicationController
  def index
    list_type_id = params["list_type_id"].to_i

    tier_lists = TierList.joins(:tier_list_types).where(tier_list_types: { id: list_type_id }).order(upvotes: :DESC)

    render json: tier_lists, root: false
  end
end
